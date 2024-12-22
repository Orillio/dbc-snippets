import 'package:design_by_contract/annotation.dart';

@Contract()
class SystemMonitor {
  bool isRunning = false;

  @Postcondition({
    'isRunning == true': 'The system must be in a running state.',
  })
  void _startMonitoring() {
    isRunning = true;
    while (isRunning) {
      // Perform monitoring tasks.
    }

  }
}
