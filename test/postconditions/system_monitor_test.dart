import 'package:dbc_snippets/postconditions/system_monitor.dart';
import 'package:test/test.dart';

void main() {
  group('SystemMonitor Contract Tests', () {
    late SystemMonitor systemMonitor;

    setUp(() {
      systemMonitor = SystemMonitor();
    });

    test(
        'Postcondition: System must be running after startMonitoring is called',
        () async {
      await systemMonitor.startMonitoring();

      expect(systemMonitor.isRunning, isTrue);
    });

    test('Postcondition fails if system is not running', () async {
      // If startMonitoring has not been called or has been stopped
      expect(systemMonitor.isRunning, isFalse);
    });
  });
}
