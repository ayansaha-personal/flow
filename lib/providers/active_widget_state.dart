import 'package:flow/entities/flow_widget.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ActiveWidgetState extends Cubit<FlowWidget?> {
  ActiveWidgetState(): super(null);

  update(FlowWidget? current) {
    emit(current);
  }
}