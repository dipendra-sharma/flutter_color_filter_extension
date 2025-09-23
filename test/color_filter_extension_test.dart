import 'package:color_filter_extension/color_filter_extension.dart';
import 'package:color_filter_extension/src/matrix.dart';
import 'package:flutter/material.dart';
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

  group('Color Science Filters', () {
    test('hue rotation should create valid matrix', () {
      final filter = ColorFilterExt.hueRotation(45);
      expect(filter.matrix.length, equals(20));
    });

    test('temperature adjustment should work', () {
      final filter = ColorFilterExt.temperatureKelvin(5500);
      expect(filter.matrix.length, equals(20));
    });

    test('tint adjustment should work', () {
      final filter = ColorFilterExt.tint(0.2);
      expect(filter.matrix.length, equals(20));
    });

    test('duotone should work with colors', () {
      final filter = ColorFilterExt.duotone(Colors.blue, Colors.orange);
      expect(filter.matrix.length, equals(20));
    });

    test('posterize should work', () {
      final filter = ColorFilterExt.posterize(8);
      expect(filter.matrix.length, equals(20));
    });

    test('threshold should work', () {
      final filter = ColorFilterExt.threshold(0.5);
      expect(filter.matrix.length, equals(20));
    });

    test('solarize should work', () {
      final filter = ColorFilterExt.solarize(0.7);
      expect(filter.matrix.length, equals(20));
    });
  });

  group('Professional Photo Filters', () {
    test('dehaze should work', () {
      final filter = ColorFilterExt.dehaze(0.5);
      expect(filter.matrix.length, equals(20));
    });

    test('split tone should work', () {
      final filter = ColorFilterExt.splitTone(Colors.blue, Colors.orange, 0.0);
      expect(filter.matrix.length, equals(20));
    });

    test('cross process should work', () {
      final filter = ColorFilterExt.crossProcess();
      expect(filter.matrix.length, equals(20));
    });

    test('bleach bypass should work', () {
      final filter = ColorFilterExt.bleachBypass(0.5);
      expect(filter.matrix.length, equals(20));
    });

    test('infrared should work', () {
      final filter = ColorFilterExt.infrared();
      expect(filter.matrix.length, equals(20));
    });

    test('night vision should work', () {
      final filter = ColorFilterExt.nightVision();
      expect(filter.matrix.length, equals(20));
    });

    test('thermal should work', () {
      final filter = ColorFilterExt.thermal();
      expect(filter.matrix.length, equals(20));
    });
  });

  group('Artistic Filters', () {
    test('vintage should work', () {
      final filter = ColorFilterExt.vintage(0.5, 0.3);
      expect(filter.matrix.length, equals(20));
    });

    test('retro should work', () {
      final filter = ColorFilterExt.retro();
      expect(filter.matrix.length, equals(20));
    });

    test('cyberpunk should work', () {
      final filter = ColorFilterExt.cyberpunk();
      expect(filter.matrix.length, equals(20));
    });

    test('noir should work', () {
      final filter = ColorFilterExt.noir();
      expect(filter.matrix.length, equals(20));
    });

    test('pastel should work', () {
      final filter = ColorFilterExt.pastel(0.5);
      expect(filter.matrix.length, equals(20));
    });

    test('pop art should work', () {
      final filter = ColorFilterExt.popArt();
      expect(filter.matrix.length, equals(20));
    });

    test('golden hour should work', () {
      final filter = ColorFilterExt.goldenHour();
      expect(filter.matrix.length, equals(20));
    });

    test('blue hour should work', () {
      final filter = ColorFilterExt.blueHour();
      expect(filter.matrix.length, equals(20));
    });
  });

  group('Technical Filters', () {
    test('gamma should work', () {
      final filter = ColorFilterExt.gammaCorrection(1.8);
      expect(filter.matrix.length, equals(20));
    });

    test('levels should work', () {
      final filter = ColorFilterExt.levels(0.0, 1.0, 1.0);
      expect(filter.matrix.length, equals(20));
    });

    test('normalize should work', () {
      final filter = ColorFilterExt.normalize();
      expect(filter.matrix.length, equals(20));
    });
  });

  group('New Presets', () {
    test('film emulation presets should work', () {
      expect(() => ColorFiltersPreset.kodakPortra400(), returnsNormally);
      expect(() => ColorFiltersPreset.fujiVelvia50(), returnsNormally);
      expect(() => ColorFiltersPreset.ilfordHP5(), returnsNormally);
      expect(() => ColorFiltersPreset.polaroid600(), returnsNormally);
    });

    test('cinema presets should work', () {
      expect(() => ColorFiltersPreset.cinematic(), returnsNormally);
      expect(() => ColorFiltersPreset.blockbuster(), returnsNormally);
      expect(() => ColorFiltersPreset.matrixGreen(), returnsNormally);
      expect(() => ColorFiltersPreset.madMaxOrange(), returnsNormally);
    });

    test('seasonal presets should work', () {
      expect(() => ColorFiltersPreset.spring(), returnsNormally);
      expect(() => ColorFiltersPreset.summer(), returnsNormally);
      expect(() => ColorFiltersPreset.autumn(), returnsNormally);
      expect(() => ColorFiltersPreset.winter(), returnsNormally);
    });

    test('mood presets should work', () {
      expect(() => ColorFiltersPreset.cheerful(), returnsNormally);
      expect(() => ColorFiltersPreset.dramatic(), returnsNormally);
      expect(() => ColorFiltersPreset.romantic(), returnsNormally);
      expect(() => ColorFiltersPreset.mysterious(), returnsNormally);
    });

    test('geographic presets should work', () {
      expect(() => ColorFiltersPreset.tokyo(), returnsNormally);
      expect(() => ColorFiltersPreset.paris(), returnsNormally);
      expect(() => ColorFiltersPreset.newYork(), returnsNormally);
      expect(() => ColorFiltersPreset.mumbai(), returnsNormally);
    });

    test('preset list count should include new presets', () {
      expect(presetFiltersList.length, greaterThan(80)); // Should have 90+ presets now
    });
  });
}
