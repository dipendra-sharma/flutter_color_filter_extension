import 'dart:math';

import 'package:color_filter_extension/src/preset.dart';
import 'package:flutter/material.dart';

import 'matrix.dart';

class ColorFilterExt extends ColorFilter {
  // | R' |   | a00 a01 a02 a03 a04 |   | R |
  // | G' |   | a10 a11 a22 a33 a44 |   | G |
  // | B' | = | a20 a21 a22 a33 a44 | * | B |
  // | A' |   | a30 a31 a22 a33 a44 |   | A |
  // | 1  |   |  0   0   0   0   1  |   | 1 |

  final List<double> matrix;

  ColorMatrix get colorMatrix => ColorMatrix.filled(values: matrix);

  const ColorFilterExt.matrix(this.matrix) : super.matrix(matrix);

  // ColorFilterExt.mode(Color color, BlendMode blendMode,
  //     {this.matrix = emptyMatrix})
  //     : super.mode(color, blendMode);
  //
  // const ColorFilterExt.linearToSrgbGamma({this.matrix = emptyMatrix})
  //     : super.linearToSrgbGamma();
  //
  // const ColorFilterExt.srgbToLinearGamma({this.matrix = emptyMatrix})
  //     : super.srgbToLinearGamma();

  factory ColorFilterExt.colorOverlay(
      double red, double green, double blue, double scale) {
    List<double> matrix = [
      ...[(1 - scale), 0, 0, 0, red * scale],
      ...[0, (1 - scale), 0, 0, green * scale],
      ...[0, 0, (1 - scale), 0, blue * scale],
      ...[0, 0, 0, 1, 0]
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.rgbScale(double r, double g, double b) {
    List<double> matrix = [
      ...[r, 0, 0, 0, 0],
      ...[0, g, 0, 0, 0],
      ...[0, 0, b, 0, 0],
      ...[0, 0, 0, 1, 0]
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.addictiveColor(double r, double g, double b) {
    List<double> matrix = [
      ...[1, 0, 0, 0, r],
      ...[0, 1, 0, 0, g],
      ...[0, 0, 1, 0, b],
      ...[0, 0, 0, 1, 0]
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.grayscale() {
    List<double> matrix = [
      ...[0.2126, 0.7152, 0.0722, 0, 0],
      ...[0.2126, 0.7152, 0.0722, 0, 0],
      ...[0.2126, 0.7152, 0.0722, 0, 0],
      ...[0, 0, 0, 1, 0]
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.sepia(double value) {
    List<double> matrix = [
      ...[(1 - (0.607 * value)), 0.769 * value, 0.189 * value, 0, 0],
      ...[0.349 * value, (1 - (0.314 * value)), 0.168 * value, 0, 0],
      ...[0.272 * value, 0.534 * value, (1 - (0.869 * value)), 0, 0],
      ...[0, 0, 0, 1, 0]
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.invert() {
    List<double> matrix = [
      ...[-1, 0, 0, 0, 255],
      ...[0, -1, 0, 0, 255],
      ...[0, 0, -1, 0, 255],
      ...[0, 0, 0, 1, 0]
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.contrast(double value) {
    double adj = value * 255;
    double factor = (259 * (adj + 255)) / (255 * (259 - adj));
    List<double> matrix = [
      ...[factor, 0, 0, 0, 128 * (1 - factor)],
      ...[0, factor, 0, 0, 128 * (1 - factor)],
      ...[0, 0, factor, 0, 128 * (1 - factor)],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.brightness(double value) {
    List<double> matrix = [];
    if (value <= 0) {
      value = value * 255;
    } else {
      value = value * 100;
    }

    if (value == 0) {
      matrix = ColorMatrix.empty().values;
    }

    matrix = List<double>.from(<double>[
      ...[1, 0, 0, 0, value],
      ...[0, 1, 0, 0, value],
      ...[0, 0, 1, 0, value],
      ...[0, 0, 0, 1, 0]
    ]).map((i) => i.toDouble()).toList();
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.hue(double value) {
    List<double> matrix = [];
    value = value * pi;

    if (value == 0) {
      matrix = ColorMatrix.empty().values;
    }

    var cosVal = cos(value);
    var sinVal = sin(value);
    var lumR = 0.213;
    var lumG = 0.715;
    var lumB = 0.072;

    matrix = List<double>.from(<double>[
      ...[
        (lumR + (cosVal * (1 - lumR))) + (sinVal * (-lumR)),
        (lumG + (cosVal * (-lumG))) + (sinVal * (-lumG)),
        (lumB + (cosVal * (-lumB))) + (sinVal * (1 - lumB)),
        0,
        0
      ],
      ...[
        (lumR + (cosVal * (-lumR))) + (sinVal * 0.143),
        (lumG + (cosVal * (1 - lumG))) + (sinVal * 0.14),
        (lumB + (cosVal * (-lumB))) + (sinVal * (-0.283)),
        0,
        0
      ],
      ...[
        (lumR + (cosVal * (-lumR))) + (sinVal * (-(1 - lumR))),
        (lumG + (cosVal * (-lumG))) + (sinVal * lumG),
        (lumB + (cosVal * (1 - lumB))) + (sinVal * lumB),
        0,
        0
      ],
      ...[0, 0, 0, 1, 0],
    ]).map((i) => i.toDouble()).toList();
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.saturation(double value) {
    List<double> matrix = [];
    value = value * 100;
    if (value == 0) {
      matrix = ColorMatrix.empty().values;
    }

    var x =
        ((1 + ((value > 0) ? ((3 * value) / 100) : (value / 100)))).toDouble();
    var lumR = 0.3086;
    var lumG = 0.6094;
    var lumB = 0.082;

    matrix = List<double>.from(<double>[
      ...[(lumR * (1 - x)) + x, lumG * (1 - x), lumB * (1 - x), 0, 0],
      ...[lumR * (1 - x), (lumG * (1 - x)) + x, lumB * (1 - x), 0, 0],
      ...[lumR * (1 - x), lumG * (1 - x), (lumB * (1 - x)) + x, 0, 0],
      ...[0, 0, 0, 1, 0],
    ]).map((i) => i.toDouble()).toList();
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.temperature(double value) {
    List<double> matrix = [
      ...[1, 0, 0, 0, 128 * value],
      ...[0, 1, 0, 0, 0],
      ...[0, 0, 1, 0, -128 * value],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  // Need to test
  factory ColorFilterExt.gamma(double gamma) {
    List<double> matrix = [
      ...[pow(255, 1 - 1 / gamma).toDouble(), 0, 0, 0, 0],
      ...[0, pow(255, 1 - 1 / gamma).toDouble(), 0, 0, 0],
      ...[0, 0, pow(255, 1 - 1 / gamma).toDouble(), 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.opacity(double opacity) {
    List<double> matrix = [
      ...[1, 0, 0, 0, 0],
      ...[0, 1, 0, 0, 0],
      ...[0, 0, 1, 0, 0],
      ...[0, 0, 0, opacity, 0], // Adjust alpha channel
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.merged(List<ColorFilterExt> colorFilters) {
    if (colorFilters.isEmpty) {
      return ColorFilterExt.matrix(ColorMatrix.empty().values);
    }
    ColorMatrix outputColorMatrix = colorFilters
        .map((filter) => filter.colorMatrix)
        .reduce((result, matrix) => result.merge(matrix));
    List<double> matrix = outputColorMatrix.values;
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.preset(ColorFiltersPreset preset) {
    return ColorFilterExt.merged(preset.filters);
  }
}
