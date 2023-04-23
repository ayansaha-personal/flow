import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flow/view/home/login_view.dart';
import 'package:flow/view/projects/projects_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: StreamBuilder<User?>(
                  stream: auth.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.data != null) {
                      return const ProjectsView();
                    }
                    return const LoginView();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
