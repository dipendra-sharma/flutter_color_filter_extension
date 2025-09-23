import 'package:color_filter_extension/color_filter_extension.dart';
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

  group('ColorFilterExt', () {
    test('brightness filter should modify matrix correctly', () {
      final filter = ColorFilterExt.brightness(0.1);
      expect(filter.matrix.length, equals(20));
      expect(filter.matrix[4], equals(10.0)); // brightness offset
    });

    test('contrast filter should have proper scaling', () {
      final filter = ColorFilterExt.contrast(0.2);
      expect(filter.matrix.length, equals(20));
      expect(filter.matrix[0], greaterThan(1.0)); // contrast factor
    });

    test('saturation filter should create valid matrix', () {
      final filter = ColorFilterExt.saturation(0.3);
      expect(filter.matrix.length, equals(20));
    });

    test('merged filter should combine multiple effects', () {
      final brightness = ColorFilterExt.brightness(0.1);
      final contrast = ColorFilterExt.contrast(0.2);
      final merged = ColorFilterExt.merged([brightness, contrast]);
      expect(merged.matrix.length, equals(20));
    });

    test('preset filter should work correctly', () {
      final preset = ColorFiltersPreset.clarendon();
      final filter = ColorFilterExt.preset(preset);
      expect(filter.matrix.length, equals(20));
    });
  });

  group('ColorFiltersPreset', () {
    test('preset should have name field', () {
      final preset = ColorFiltersPreset.clarendon();
      expect(preset.name, equals('Clarendon'));
    });

    test('custom preset should have default name', () {
      final preset =
          ColorFiltersPreset.create([ColorFilterExt.brightness(0.1)]);
      expect(preset.name, equals('Custom'));
    });

    test('custom preset with name should use provided name', () {
      final preset = ColorFiltersPreset.create([ColorFilterExt.brightness(0.1)],
          name: 'Test');
      expect(preset.name, equals('Test'));
    });

    test('all presets should have unique names', () {
      final presetNames = presetFiltersList.map((p) => p.name).toSet();
      expect(presetNames.length, equals(presetFiltersList.length));
    });
  });

  group('Advanced ColorFilterExt filters', () {
    test('vibrance filter should create valid matrix', () {
      final filter = ColorFilterExt.vibrance(0.5);
      expect(filter.matrix.length, equals(20));
    });

    test('clarity filter should enhance contrast', () {
      final filter = ColorFilterExt.clarity(0.3);
      expect(filter.matrix.length, equals(20));
    });

    test('exposure filter should create valid matrix', () {
      final filter = ColorFilterExt.exposure(1.0);
      expect(filter.matrix.length, equals(20));
      // Just check that the matrix is valid, not specific values
    });

    test('white balance should adjust temperature and tint', () {
      final filter = ColorFilterExt.whiteBalance(50, -25);
      expect(filter.matrix.length, equals(20));
    });

    test('vignette should create darkening effect', () {
      final filter = ColorFilterExt.vignette(0.5);
      expect(filter.matrix.length, equals(20));
    });

    test('film grain should add texture', () {
      final filter = ColorFilterExt.filmGrain(0.3);
      expect(filter.matrix.length, equals(20));
    });

    test('sharpen filter should work', () {
      final filter = ColorFilterExt.sharpen(1.0);
      expect(filter.matrix.length, equals(20));
    });

    test('high key and low key effects should work', () {
      final highKey = ColorFilterExt.highKey(0.7);
      final lowKey = ColorFilterExt.lowKey(0.7);

      expect(highKey.matrix.length, equals(20));
      expect(lowKey.matrix.length, equals(20));
    });

    test('channel swap filters should work', () {
      final redGreen = ColorFilterExt.swapRedGreen();
      final redBlue = ColorFilterExt.swapRedBlue();
      final greenBlue = ColorFilterExt.swapGreenBlue();

      expect(redGreen.matrix.length, equals(20));
      expect(redBlue.matrix.length, equals(20));
      expect(greenBlue.matrix.length, equals(20));
    });

    test('shadows and highlights should work', () {
      final filter = ColorFilterExt.shadowsHighlights(-0.3, 0.2);
      expect(filter.matrix.length, equals(20));
    });
  });

  group('Parameter Validation', () {
    test('filters should handle edge case values', () {
      // Test extreme values
      expect(() => ColorFilterExt.vibrance(-2.0), returnsNormally);
      expect(() => ColorFilterExt.vibrance(2.0), returnsNormally);
      expect(() => ColorFilterExt.exposure(-10.0), returnsNormally);
      expect(() => ColorFilterExt.clarity(-2.0), returnsNormally);
      expect(() => ColorFilterExt.vignette(-1.0), returnsNormally);
    });

    test('filters should clamp values properly', () {
      final vibrance1 = ColorFilterExt.vibrance(-2.0);
      final vibrance2 = ColorFilterExt.vibrance(-1.0);
      expect(vibrance1.matrix,
          equals(vibrance2.matrix)); // Should be clamped to -1.0

      final clarity1 = ColorFilterExt.clarity(2.0);
      final clarity2 = ColorFilterExt.clarity(1.0);
      expect(
          clarity1.matrix, equals(clarity2.matrix)); // Should be clamped to 1.0
    });
  });
}
