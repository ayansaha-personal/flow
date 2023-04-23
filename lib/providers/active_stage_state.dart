import 'package:flow/entities/flow_widget.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ActiveStageState extends Cubit<String> with HydratedMixin {
  ActiveStageState(): super('home');

  update(String current) {
    emit(current);
  }

  @override
  String fromJson(Map<String, dynamic> json) => json['value'] as String;

  @override
  Map<String, String> toJson(String state) => { 'value': state };
}