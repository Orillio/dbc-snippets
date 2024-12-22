import 'package:design_by_contract/annotation.dart';


part 'point.g.dart';

@Contract({
  'x.isFinite': 'X coordinate must be a finite number.',
  'y.isFinite': 'Y coordinate must be a finite number.',
})
class Point {
  final double x;
  final double y;

  @Invariant()
  Point._(this.x, this.y);

  // No methods to modify state; invariants ensure object is always valid upon creation.
}