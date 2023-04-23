
import 'package:flow/utils/stage_utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class StageSizeState extends Cubit<StageSize> {
  StageSizeState(): super(mobileRatios[0]);

  update(StageSize current) {
    emit(current);
  }
}