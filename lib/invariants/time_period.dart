import 'package:design_by_contract/annotation.dart';

part 'time_period.g.dart';

@Contract({
  'end > start': 'End must be greater than start.',
})
class TimePeriod {
  int start = 0;
  int end = 10;

  @Invariant()
  void _updateStart(int newStart) {
    start = newStart;
  }

  @Invariant()
  void _updateEnd(int newEnd) {
    end = newEnd;
  }
}
