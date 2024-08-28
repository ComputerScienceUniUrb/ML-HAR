import 'package:logger/logger.dart';

var logger = Logger(
  output: DevOutput(),
  filter: ReleaseFilter()
);

String devOutput = '';

class DevOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(print);
    for (final v in event.lines) {
      devOutput += '\n$v';
    }
  }
}

class ReleaseFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
