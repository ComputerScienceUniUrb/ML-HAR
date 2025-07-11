/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

// part 'tf_local_data_source.g.dart';
//
// @riverpod
// Future<Interpreter> getInterpreter(Ref ref) async {
//   final interpreter =
//       await Interpreter.fromAsset('assets/aiFit_09_07_2025.tflite');
//   return interpreter;
// }

class TensorFlowLocalDataSource {
  Future<void> run() async {
    final interpreter =
        await Interpreter.fromAsset('assets/aiFit_09_07_2025.tflite');
    var input0 = [1.23];
    var input1 = [2.43];

// input: List<Object>
    var inputs = [input0, input1, input0, input1];

    var output0 = List<double>.filled(1, 0);
    var output1 = List<double>.filled(1, 0);

// output: Map<int, Object>
    var outputs = {0: output0, 1: output1};

// inference
    interpreter.runForMultipleInputs(inputs, outputs);

// print outputs
    print(outputs);
  }
}
*/
