import 'package:flow/entities/flow_widget.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SelectedWidgetState extends Cubit<FlowWidget?> {
  SelectedWidgetState(): super(null);

  update(FlowWidget? current) {
    emit(current);
  }
}