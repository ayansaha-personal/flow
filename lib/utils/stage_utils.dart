import 'package:flutter/material.dart';

class StageSize {
  final String name;
  final Size ratio;

  const StageSize(this.name, this.ratio);
}

const List<StageSize> mobileRatios = [StageSize('iPhone 13', Size(9, 19.5)), StageSize('iPhone 8', Size(9, 16))];

const List<StageSize> tabRatios = [StageSize('iPad Pro 12.9"', Size(3, 4)), StageSize('iPad Mini 6', Size(2, 3)), StageSize('iPad Air 4', Size(16, 23))];

const List<StageSize> desktopRatios = [StageSize("iMac 27'", Size(16, 9)), StageSize('Macbook Pro', Size(16, 10))];

// Size getStageSize(BuildContext context, int index) {
//   Size ratio = ratios[index];
//   Size devDeviceSize = MediaQuery.of(context).size;
//   double maxStageHeight = (80 / 100) * devDeviceSize.height;
//   double maxStageWidth = (60 / 100) * devDeviceSize.width;
//   double stageWidth = maxStageHeight * (ratio.width / ratio.height);
//   if (stageWidth <= maxStageWidth) {
//     return Size(stageWidth, maxStageHeight);
//   } else {
//     double stageHeight = maxStageWidth * (ratio.height / ratio.width);
//     return Size(maxStageWidth, stageHeight);
//   }
// }
