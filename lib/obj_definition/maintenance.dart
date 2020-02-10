import 'package:hive/hive.dart';
part 'maintenance.g.dart';

@HiveType(typeId: 1)
class Maintenance {
  @HiveField(0)
  final String plannedDate;
  @HiveField(1)
  final String atDistance;
  @HiveField(2)
  final String description;

  Maintenance(this.plannedDate, this.atDistance, this.description);
}