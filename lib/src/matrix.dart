class ColorMatrix {
  final int row = 4;
  final int column = 5;
  late final List<double> values;

  ColorMatrix.empty() {
    values = [
      ...[1, 0, 0, 0, 0],
      ...[0, 1, 0, 0, 0],
      ...[0, 0, 1, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
  }

  ColorMatrix.filled({required List<double> values}) {
    assert(values.length == row * column);
    // ignore: prefer_initializing_formals
    this.values = values;
  }
}

extension ColorMatrixExt on ColorMatrix {
  /// ColorMatrix class to represent and manipulate 4x5 color matrices used in image processing.
  ///
  /// Color matrix merging in image processing is used to apply multiple color corrections in a sequence.
  /// Each color matrix represents a set of color transformations, including adjustments to hues,
  /// saturation, brightness, and transparency.
  ///
  /// Process:
  /// 1. 4x4 Matrix Multiplication: The first four columns of each matrix, representing color transformations,
  ///    are multiplied. This part handles how colors are transformed without considering any translation (offsets).
  /// 2. Handling Translation: The fifth column in a color matrix represents the translation vector,
  ///    which is an additive component. This vector is separately processed. It's multiplied by the 4x4 portion of the
  ///    other matrix and then added to its own translation vector to calculate the overall translation effect.
  /// 3. Combining Results: The resulting 4x4 matrix and the newly calculated translation vector are combined
  ///    to form the final 4x5 matrix. This matrix now encapsulates the sequential color transformations and
  ///    translations of both original matrices.
  ///

  ColorMatrix merge(ColorMatrix other) {
    // Ensure matrices are 4x5, Not required since already funded
    // if (row != 4 || column != 5 || other.row != 4 || other.column != 5) {
    //   throw Exception('Matrices should be 4x5 for this operation.');
    // }

    // Prepare for 4x4 matrix multiplication
    List<double> result4x4 = List.filled(4 * 4, 0.0);

    // Perform 4x4 matrix multiplication
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        for (var k = 0; k < 4; k++) {
          result4x4[i * 4 + j] +=
              values[i * column + k] * other.values[k * other.column + j];
        }
      }
    }

    // Handle the translation column (5th column)
    List<double> finalTranslation = List<double>.filled(4, 0.0);
    for (var i = 0; i < 4; i++) {
      for (var k = 0; k < 4; k++) {
        finalTranslation[i] +=
            values[i * column + k] * other.values[k * other.column + 4];
      }
      finalTranslation[i] += values[i * column + 4];
    }

    // Combine the results into a final 4x5 matrix
    List<double> finalValues = List.filled(4 * 5, 0.0);
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        finalValues[i * 5 + j] = result4x4[i * 4 + j];
      }
      finalValues[i * 5 + 4] = finalTranslation[i];
    }

    return ColorMatrix.filled(values: finalValues);
  }
}
