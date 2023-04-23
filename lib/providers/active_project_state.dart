import 'package:flow/entities/flow_project.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ActiveProjectState extends Cubit<FlowProject?> with HydratedMixin {
  ActiveProjectState() : super(null);

  update(FlowProject? current) async {
    emit(current);
  }

  @override
  FlowProject fromJson(Map<String, dynamic> json) {
    return FlowProject(id: json['id'], name: json['name'], packageName: json['packageName'], initialRoute: json['initialRoute']);
  }

  @override
  Map<String, dynamic> toJson(FlowProject? state) => {
    'id': state?.id,
    'name': state?.name,
    'packageName': state?.packageName,
    'initialRoute': state?.initialRoute,
  };
}
