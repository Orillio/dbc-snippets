import 'package:design_by_contract/annotation.dart';

part 'system_monitor.g.dart';

@Contract()
class SystemMonitor {
  bool isRunning = false;

  @Postcondition({
    'isRunning == true': 'The system must be in a running state.',
  })
  Future<void> _startMonitoring() async {
    isRunning = true;
    while (isRunning) {
      await Future.delayed(Duration(seconds: 1));
      break;
    }
  }
}
