import 'package:logger/logger.dart';

var logger = Logger(
  output: DevOutput(),
);

String devOutput = '';

class DevOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(print);
    for (var v in event.lines) {
      devOutput += '\n$v';
    }
  }
}
