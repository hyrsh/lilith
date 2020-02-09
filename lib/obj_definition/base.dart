import 'package:hive/hive.dart';
part 'base.g.dart';

@HiveType(typeId: 0)
class Baseinfo {
  @HiveField(0)
  final DateTime currentDate;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final double volume;
  @HiveField(3)
  final double distance;

  Baseinfo(this.currentDate, this.price, this.volume, this.distance);
}