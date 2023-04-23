import 'dart:math';

generateKey({String parent = ''}) {
  return "$parent|${Random().nextInt(1000000)}";
}