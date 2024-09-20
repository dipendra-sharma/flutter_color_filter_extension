import 'package:color_filter_extension/src/matrix.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorMatrix', () {
    test('empty constructor should create an identity matrix', () {
      final matrix = ColorMatrix.empty();
      expect(matrix.values,
          equals([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]));
    });

    test('filled constructor should initialize with given values', () {
      final values = List<double>.generate(20, (index) => index.toDouble());
      final matrix = ColorMatrix.filled(values: values);
      expect(matrix.values, equals(values));
    });

    test('filled constructor should assert if values length is not 20', () {
      expect(() => ColorMatrix.filled(values: [1.0]),
          throwsA(isA<AssertionError>()));
    });

    test(
        'merge method should return identity matrix when merging two identity matrices',
        () {
      final matrix1 = ColorMatrix.empty();
      final matrix2 = ColorMatrix.empty();
      final result = matrix1.merge(matrix2);
      expect(result.values,
          equals([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]));
    });

    test('merge method should correctly merge non-identity matrices', () {
      final matrix1 = ColorMatrix.filled(
          values: List<double>.generate(20, (index) => index.toDouble()));
      final matrix2 = ColorMatrix.filled(
          values:
              List<double>.generate(20, (index) => (19 - index).toDouble()));
      final result = matrix1.merge(matrix2);
      // Expected result should be calculated based on the merge operation logic
      final expectedValues = [
        44.0,
        38.0,
        32.0,
        26.0,
        24.0,
        274.0,
        248.0,
        222.0,
        196.0,
        179.0,
        504.0,
        458.0,
        412.0,
        366.0,
        334.0,
        734.0,
        668.0,
        602.0,
        536.0,
        489.0
      ];
      expect(result.values, equals(expectedValues));
    });

    test('should assert if values length is not 20', () {
      expect(() => ColorMatrix.filled(values: [1.0]),
          throwsA(isA<AssertionError>()));
    });
  });
}
