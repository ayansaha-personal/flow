import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow/firebase_options.dart';
import 'package:flow/providers/active_project_state.dart';
import 'package:flow/providers/active_stage_state.dart';
import 'package:flow/providers/active_widget_state.dart';
import 'package:flow/providers/selected_widget_state.dart';
import 'package:flow/providers/stage_size_state.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flow/view/home/home_view.dart';
import 'package:flow/view/editor_view/editor_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("INITIALIZING FIREBASE");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    try {
      await auth.useAuthEmulator('localhost', 9001);
      debugPrint("AUTH EMULATOR INITIALIZED");
      db.useFirestoreEmulator('localhost', 9003);
      debugPrint("FIRESTORE EMULATOR INITIALIZED");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  if (kIsWeb && Firebase.apps.isNotEmpty) {
    debugPrint("FIREBASE INITIALIZED");
    if (db.settings.cacheSizeBytes != Settings.CACHE_SIZE_UNLIMITED) {
      debugPrint("SETTING FIREBASE CACHE AND PERSISTENCE");
      try {
        db.settings = const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
        await db.enablePersistence(const PersistenceSettings(synchronizeTabs: true));
        debugPrint("SETTINGS ENABLED");
      } catch (e) {
        debugPrint("PERSISTENCE SETTINGS EXISTS");
      }
    }
  }
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );
  runApp(Flow());
}

class Flow extends StatelessWidget {
  Flow({super.key});

  final ActiveProjectState activeProjectState = ActiveProjectState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flow',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      routes: {
        '/editor': (context) => MultiBlocProvider(providers: [
              BlocProvider<ActiveProjectState>(
                create: (BuildContext context) => activeProjectState,
              ),
              BlocProvider<ActiveStageState>(
                create: (BuildContext context) => ActiveStageState(),
              ),
              BlocProvider<StageSizeState>(
                create: (BuildContext context) => StageSizeState(),
              ),
              BlocProvider<ActiveWidgetState>(
                create: (BuildContext context) => ActiveWidgetState(),
              ),
              BlocProvider<SelectedWidgetState>(
                create: (BuildContext context) => SelectedWidgetState(),
              ),
            ], child: const EditorView()),
        '/': (context) => MultiBlocProvider(providers: [
              BlocProvider<ActiveProjectState>(
                create: (BuildContext context) => activeProjectState,
              ),
            ], child: const HomeView())
      },
    );
  }
}
