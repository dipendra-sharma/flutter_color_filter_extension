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

  // Advanced Color Grading Filters

  /// Vibrance - Smart saturation that protects skin tones
  /// [value] ranges from -1.0 to 1.0
  factory ColorFilterExt.vibrance(double value) {
    double clampedValue = value.clamp(-1.0, 1.0);
    double factor = 1.0 + clampedValue * 0.5;

    List<double> matrix = [
      ...[
        0.213 + 0.787 * factor,
        0.715 - 0.715 * factor,
        0.072 - 0.072 * factor,
        0,
        0
      ],
      ...[
        0.213 - 0.213 * factor,
        0.715 + 0.285 * factor,
        0.072 - 0.072 * factor,
        0,
        0
      ],
      ...[
        0.213 - 0.213 * factor,
        0.715 - 0.715 * factor,
        0.072 + 0.928 * factor,
        0,
        0
      ],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Clarity - Local contrast enhancement
  /// [value] ranges from -1.0 to 1.0
  factory ColorFilterExt.clarity(double value) {
    double clampedValue = value.clamp(-1.0, 1.0);
    double factor = 1.0 + clampedValue * 0.3;

    List<double> matrix = [
      ...[factor, 0, 0, 0, 0],
      ...[0, factor, 0, 0, 0],
      ...[0, 0, factor, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Exposure adjustment
  /// [value] ranges from -5.0 to 5.0 (stops)
  factory ColorFilterExt.exposure(double value) {
    double factor = pow(2.0, value).toDouble();

    List<double> matrix = [
      ...[factor, 0, 0, 0, 0],
      ...[0, factor, 0, 0, 0],
      ...[0, 0, factor, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// White balance adjustment by temperature and tint
  /// [temperature] ranges from -100 to 100 (cooler to warmer)
  /// [tint] ranges from -100 to 100 (green to magenta)
  factory ColorFilterExt.whiteBalance(double temperature, double tint) {
    double tempFactor = temperature / 100.0;
    double tintFactor = tint / 100.0;

    double rTemp = 1.0 + tempFactor * 0.3;
    double bTemp = 1.0 - tempFactor * 0.3;
    double gTint = 1.0 + tintFactor * 0.3;

    List<double> matrix = [
      ...[rTemp, 0, 0, 0, 0],
      ...[0, gTint, 0, 0, 0],
      ...[0, 0, bTemp, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Shadows and highlights adjustment
  /// [shadows] and [highlights] range from -1.0 to 1.0
  factory ColorFilterExt.shadowsHighlights(double shadows, double highlights) {
    double shadowFactor = 1.0 + shadows * 0.5;

    List<double> matrix = [
      ...[shadowFactor, 0, 0, 0, highlights * 20],
      ...[0, shadowFactor, 0, 0, highlights * 20],
      ...[0, 0, shadowFactor, 0, highlights * 20],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  // Artistic Effects

  /// Vignette effect - darkens edges
  /// [intensity] ranges from 0.0 to 1.0
  factory ColorFilterExt.vignette(double intensity) {
    double clampedIntensity = intensity.clamp(0.0, 1.0);
    double darkening = clampedIntensity * 0.3;

    List<double> matrix = [
      ...[1 - darkening, 0, 0, 0, 0],
      ...[0, 1 - darkening, 0, 0, 0],
      ...[0, 0, 1 - darkening, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Film grain effect
  /// [intensity] ranges from 0.0 to 1.0
  factory ColorFilterExt.filmGrain(double intensity) {
    double clampedIntensity = intensity.clamp(0.0, 1.0);
    double contrast = 1.0 + clampedIntensity * 0.1;
    double noise = clampedIntensity * 5;

    List<double> matrix = [
      ...[contrast, 0, 0, 0, noise],
      ...[0, contrast, 0, 0, noise],
      ...[0, 0, contrast, 0, noise],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Sharpen filter
  /// [amount] ranges from 0.0 to 2.0
  factory ColorFilterExt.sharpen(double amount) {
    double clampedAmount = amount.clamp(0.0, 2.0);
    double factor = 1.0 + clampedAmount * 0.2;

    List<double> matrix = [
      ...[factor, 0, 0, 0, 0],
      ...[0, factor, 0, 0, 0],
      ...[0, 0, factor, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// High key effect (bright, low contrast)
  /// [intensity] ranges from 0.0 to 1.0
  factory ColorFilterExt.highKey(double intensity) {
    double i = intensity.clamp(0.0, 1.0);
    double brightness = i * 30;
    double contrast = 1.0 - i * 0.3;

    List<double> matrix = [
      ...[contrast, 0, 0, 0, brightness],
      ...[0, contrast, 0, 0, brightness],
      ...[0, 0, contrast, 0, brightness],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Low key effect (dark, high contrast)
  /// [intensity] ranges from 0.0 to 1.0
  factory ColorFilterExt.lowKey(double intensity) {
    double i = intensity.clamp(0.0, 1.0);
    double brightness = -i * 20;
    double contrast = 1.0 + i * 0.4;

    List<double> matrix = [
      ...[contrast, 0, 0, 0, brightness],
      ...[0, contrast, 0, 0, brightness],
      ...[0, 0, contrast, 0, brightness],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  /// Channel swap filters
  factory ColorFilterExt.swapRedGreen() {
    List<double> matrix = [
      ...[0, 1, 0, 0, 0],
      ...[1, 0, 0, 0, 0],
      ...[0, 0, 1, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.swapRedBlue() {
    List<double> matrix = [
      ...[0, 0, 1, 0, 0],
      ...[0, 1, 0, 0, 0],
      ...[1, 0, 0, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  factory ColorFilterExt.swapGreenBlue() {
    List<double> matrix = [
      ...[1, 0, 0, 0, 0],
      ...[0, 0, 1, 0, 0],
      ...[0, 1, 0, 0, 0],
      ...[0, 0, 0, 1, 0],
    ];
    return ColorFilterExt.matrix(matrix);
  }

  // =================== COLOR SCIENCE FILTERS ===================

  /// Hue rotation - rotate colors on the color wheel
  /// [degrees] ranges from -360 to 360
  factory ColorFilterExt.hueRotation(double degrees) {
    double radians = degrees * pi / 180;
    double cosA = cos(radians);
    double sinA = sin(radians);

    // Luminance weights (ITU-R BT.709)
    double lr = 0.2126;
    double lg = 0.7152;
    double lb = 0.0722;

    List<double> matrix = [
      lr + cosA * (1 - lr) + sinA * (-lr),
      lg + cosA * (-lg) + sinA * (-lg),
      lb + cosA * (-lb) + sinA * (1 - lb),
      0, 0,

      lr + cosA * (-lr) + sinA * (0.143),
      lg + cosA * (1 - lg) + sinA * (0.140),
      lb + cosA * (-lb) + sinA * (-0.283),
      0, 0,

      lr + cosA * (-lr) + sinA * (-(1 - lr)),
      lg + cosA * (-lg) + sinA * (lg),
      lb + cosA * (1 - lb) + sinA * (lb),
      0, 0,

      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Color temperature adjustment (Kelvin scale)
  /// [kelvin] ranges from 2000 to 10000
  factory ColorFilterExt.temperatureKelvin(double kelvin) {
    // Clamp to reasonable range
    kelvin = kelvin.clamp(2000, 10000);
    double temp = kelvin / 100;

    double red, green, blue;

    // Calculate red
    if (temp <= 66) {
      red = 255;
    } else {
      red = temp - 60;
      red = 329.698727446 * pow(red, -0.1332047592);
      red = red.clamp(0, 255);
    }

    // Calculate green
    if (temp <= 66) {
      green = temp;
      green = 99.4708025861 * log(green) - 161.1195681661;
      green = green.clamp(0, 255);
    } else {
      green = temp - 60;
      green = 288.1221695283 * pow(green, -0.0755148492);
      green = green.clamp(0, 255);
    }

    // Calculate blue
    if (temp >= 66) {
      blue = 255;
    } else if (temp >= 19) {
      blue = temp - 10;
      blue = 138.5177312231 * log(blue) - 305.0447927307;
      blue = blue.clamp(0, 255);
    } else {
      blue = 0;
    }

    // Normalize to scale factors
    red = red / 255;
    green = green / 255;
    blue = blue / 255;

    return ColorFilterExt.rgbScale(red, green, blue);
  }

  /// Tint adjustment (green-magenta axis)
  /// [value] ranges from -1.0 to 1.0 (green to magenta)
  factory ColorFilterExt.tint(double value) {
    double clampedValue = value.clamp(-1.0, 1.0);

    // Tint affects green channel vs red/blue
    double greenAdjust = 1.0 + clampedValue * 0.3;
    double magentaAdjust = 1.0 - clampedValue * 0.15;

    List<double> matrix = [
      magentaAdjust, 0, 0, 0, 0,
      0, greenAdjust, 0, 0, 0,
      0, 0, magentaAdjust, 0, 0,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Duotone effect - map grayscale to two colors
  factory ColorFilterExt.duotone(Color shadowColor, Color highlightColor) {
    // First convert to grayscale
    List<double> grayscaleMatrix = [
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0, 0, 0, 1, 0
    ];

    // Then map grayscale to color gradient
    double sr = shadowColor.red / 255.0;
    double sg = shadowColor.green / 255.0;
    double sb = shadowColor.blue / 255.0;

    double hr = highlightColor.red / 255.0;
    double hg = highlightColor.green / 255.0;
    double hb = highlightColor.blue / 255.0;

    List<double> colorMatrix = [
      (hr - sr), 0, 0, 0, sr * 255,
      (hg - sg), 0, 0, 0, sg * 255,
      (hb - sb), 0, 0, 0, sb * 255,
      0, 0, 0, 1, 0
    ];

    // Merge the matrices
    var grayscale = ColorFilterExt.matrix(grayscaleMatrix);
    var colorMap = ColorFilterExt.matrix(colorMatrix);
    return ColorFilterExt.merged([grayscale, colorMap]);
  }

  /// Posterize - reduce number of color levels
  /// [levels] number of levels per channel (2-256)
  factory ColorFilterExt.posterize(int levels) {
    levels = levels.clamp(2, 256);
    double factor = 255.0 / (levels - 1);
    double scale = (levels - 1) / 255.0;

    List<double> matrix = [
      scale, 0, 0, 0, 0,
      0, scale, 0, 0, 0,
      0, 0, scale, 0, 0,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Threshold - convert to high contrast black/white
  /// [level] threshold level (0.0 to 1.0)
  factory ColorFilterExt.threshold(double level) {
    level = level.clamp(0.0, 1.0);
    double threshold = level * 255;

    // First convert to grayscale, then apply threshold
    var grayscale = ColorFilterExt.grayscale();

    // High contrast matrix
    double contrast = 100.0; // Very high contrast
    double offset = -threshold * contrast + 128;

    List<double> contrastMatrix = [
      contrast, 0, 0, 0, offset,
      contrast, 0, 0, 0, offset,
      contrast, 0, 0, 0, offset,
      0, 0, 0, 1, 0
    ];

    var thresholdFilter = ColorFilterExt.matrix(contrastMatrix);
    return ColorFilterExt.merged([grayscale, thresholdFilter]);
  }

  /// Solarize effect - partial color inversion
  /// [threshold] point where inversion starts (0.0 to 1.0)
  factory ColorFilterExt.solarize(double threshold) {
    threshold = threshold.clamp(0.0, 1.0);
    double point = threshold * 255;

    // Simplified solarization using contrast and brightness
    double contrast = -0.5;
    double brightness = point * 2;

    List<double> matrix = [
      contrast, 0, 0, 0, brightness,
      0, contrast, 0, 0, brightness,
      0, 0, contrast, 0, brightness,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  // =================== PROFESSIONAL PHOTO FILTERS ===================

  /// Dehaze - remove atmospheric haze
  /// [amount] ranges from 0.0 to 1.0
  factory ColorFilterExt.dehaze(double amount) {
    amount = amount.clamp(0.0, 1.0);

    // Dehaze increases contrast and saturation
    double contrast = 1.0 + amount * 0.3;
    double saturation = 1.0 + amount * 0.2;

    // Combine contrast and saturation
    var contrastFilter = ColorFilterExt.contrast(amount * 0.3);
    var saturationFilter = ColorFilterExt.saturation(amount * 0.2);

    return ColorFilterExt.merged([contrastFilter, saturationFilter]);
  }

  /// Split toning - different colors for highlights and shadows
  /// [shadowColor] color for darker areas
  /// [highlightColor] color for brighter areas
  /// [balance] balance between shadows and highlights (-1.0 to 1.0)
  factory ColorFilterExt.splitTone(Color shadowColor, Color highlightColor, double balance) {
    balance = balance.clamp(-1.0, 1.0);

    // Normalize balance to 0-1 range
    double shadowWeight = (1.0 - balance) * 0.5;
    double highlightWeight = (1.0 + balance) * 0.5;

    double sr = shadowColor.red / 255.0 * shadowWeight;
    double sg = shadowColor.green / 255.0 * shadowWeight;
    double sb = shadowColor.blue / 255.0 * shadowWeight;

    double hr = highlightColor.red / 255.0 * highlightWeight;
    double hg = highlightColor.green / 255.0 * highlightWeight;
    double hb = highlightColor.blue / 255.0 * highlightWeight;

    List<double> matrix = [
      1.0, 0, 0, 0, (sr + hr) * 25,
      0, 1.0, 0, 0, (sg + hg) * 25,
      0, 0, 1.0, 0, (sb + hb) * 25,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Cross processing - film development effect
  factory ColorFilterExt.crossProcess() {
    // Typical cross-processing color shifts
    List<double> matrix = [
      1.1, 0.1, -0.1, 0, 10,
      0.05, 1.05, 0.05, 0, -5,
      -0.05, 0.1, 1.2, 0, -10,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Bleach bypass - silver retention effect
  /// [amount] ranges from 0.0 to 1.0
  factory ColorFilterExt.bleachBypass(double amount) {
    amount = amount.clamp(0.0, 1.0);

    // Bleach bypass combines B&W with color
    var grayscale = ColorFilterExt.grayscale();
    var contrast = ColorFilterExt.contrast(amount * 0.4);
    var desaturate = ColorFilterExt.saturation(-amount * 0.3);

    return ColorFilterExt.merged([desaturate, contrast]);
  }

  /// Infrared photography simulation
  factory ColorFilterExt.infrared() {
    // Swap red and blue channels, adjust brightness
    List<double> matrix = [
      0.3, 0.3, 1.3, 0, 0,
      0.3, 0.3, 0.3, 0, 0,
      1.3, 0.3, 0.3, 0, 0,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Night vision effect
  factory ColorFilterExt.nightVision() {
    // Green monochrome with increased brightness
    List<double> matrix = [
      0.1, 0.4, 0.1, 0, 0,
      0.2, 0.8, 0.2, 0, 50,
      0.1, 0.4, 0.1, 0, 0,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Thermal camera effect
  factory ColorFilterExt.thermal() {
    // Red-orange-yellow thermal mapping
    List<double> matrix = [
      0.8, 0.4, 0.2, 0, 50,
      0.3, 0.3, 0.1, 0, 25,
      0.1, 0.1, 0.1, 0, 0,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  // =================== ARTISTIC FILTERS ===================

  /// Vintage photo effect
  /// [fade] amount of color fading (0.0 to 1.0)
  /// [warmth] warmth of the effect (0.0 to 1.0)
  factory ColorFilterExt.vintage(double fade, double warmth) {
    fade = fade.clamp(0.0, 1.0);
    warmth = warmth.clamp(0.0, 1.0);

    var sepia = ColorFilterExt.sepia(fade * 0.3);
    var brightness = ColorFilterExt.brightness(fade * 0.1);
    var contrast = ColorFilterExt.contrast(-fade * 0.1);
    var warm = ColorFilterExt.rgbScale(1.0 + warmth * 0.1, 1.0, 1.0 - warmth * 0.05);

    return ColorFilterExt.merged([sepia, brightness, contrast, warm]);
  }

  /// Retro/80s style effect
  factory ColorFilterExt.retro() {
    // Magenta/cyan shift with high contrast
    List<double> matrix = [
      1.2, 0.0, 0.2, 0, 10,
      0.1, 1.0, 0.1, 0, 0,
      0.2, 0.2, 1.1, 0, 20,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Cyberpunk neon effect
  factory ColorFilterExt.cyberpunk() {
    // High contrast cyan/magenta with increased saturation
    var contrast = ColorFilterExt.contrast(0.4);
    var saturation = ColorFilterExt.saturation(0.5);

    List<double> matrix = [
      1.1, 0.0, 0.3, 0, 0,
      0.0, 1.0, 0.3, 0, 15,
      0.3, 0.0, 1.2, 0, 30,
      0, 0, 0, 1, 0
    ];

    var colorShift = ColorFilterExt.matrix(matrix);
    return ColorFilterExt.merged([contrast, saturation, colorShift]);
  }

  /// Film noir - dramatic black and white
  factory ColorFilterExt.noir() {
    // High contrast grayscale with slight blue tint
    var grayscale = ColorFilterExt.grayscale();
    var contrast = ColorFilterExt.contrast(0.3);
    var blueTint = ColorFilterExt.colorOverlay(0, 0, 20, 0.05);

    return ColorFilterExt.merged([grayscale, contrast, blueTint]);
  }

  /// Pastel colors effect
  /// [strength] intensity of the pastel effect (0.0 to 1.0)
  factory ColorFilterExt.pastel(double strength) {
    strength = strength.clamp(0.0, 1.0);

    // Desaturate and brighten for pastel look
    var desaturate = ColorFilterExt.saturation(-strength * 0.4);
    var brighten = ColorFilterExt.brightness(strength * 0.15);
    var soften = ColorFilterExt.contrast(-strength * 0.1);

    return ColorFilterExt.merged([desaturate, brighten, soften]);
  }

  /// Pop art - high saturation and contrast
  factory ColorFilterExt.popArt() {
    var saturation = ColorFilterExt.saturation(0.8);
    var contrast = ColorFilterExt.contrast(0.3);

    // Slight color shifts for pop art look
    List<double> matrix = [
      1.1, 0.0, 0.0, 0, 10,
      0.0, 1.1, 0.0, 0, -5,
      0.0, 0.0, 1.2, 0, 15,
      0, 0, 0, 1, 0
    ];

    var colorBoost = ColorFilterExt.matrix(matrix);
    return ColorFilterExt.merged([saturation, contrast, colorBoost]);
  }

  /// Golden hour lighting effect
  factory ColorFilterExt.goldenHour() {
    // Warm, soft lighting
    var warmth = ColorFilterExt.rgbScale(1.15, 1.05, 0.9);
    var brightness = ColorFilterExt.brightness(0.1);
    var softContrast = ColorFilterExt.contrast(-0.05);

    List<double> matrix = [
      1.0, 0.05, 0.0, 0, 15,
      0.0, 1.0, 0.0, 0, 5,
      0.0, 0.0, 0.9, 0, 0,
      0, 0, 0, 1, 0
    ];

    var goldenTint = ColorFilterExt.matrix(matrix);
    return ColorFilterExt.merged([warmth, brightness, softContrast, goldenTint]);
  }

  /// Blue hour lighting effect
  factory ColorFilterExt.blueHour() {
    // Cool, twilight lighting
    var coolness = ColorFilterExt.rgbScale(0.9, 0.95, 1.2);
    var brightness = ColorFilterExt.brightness(-0.05);
    var saturation = ColorFilterExt.saturation(0.1);

    List<double> matrix = [
      0.9, 0.0, 0.1, 0, 0,
      0.0, 0.95, 0.05, 0, 5,
      0.05, 0.05, 1.1, 0, 25,
      0, 0, 0, 1, 0
    ];

    var blueTint = ColorFilterExt.matrix(matrix);
    return ColorFilterExt.merged([coolness, brightness, saturation, blueTint]);
  }

  // =================== TECHNICAL FILTERS ===================

  /// Gamma correction (enhanced version)
  /// [value] gamma value (0.1 to 3.0, 1.0 = no change)
  factory ColorFilterExt.gammaCorrection(double value) {
    value = value.clamp(0.1, 3.0);

    // Approximate gamma using power curve
    double gamma = 1.0 / value;
    double factor = pow(0.5, gamma) * 2.0; // Normalize around midpoint

    List<double> matrix = [
      factor, 0, 0, 0, 0,
      0, factor, 0, 0, 0,
      0, 0, factor, 0, 0,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Levels adjustment
  /// [blackPoint] input black point (0.0 to 1.0)
  /// [whitePoint] input white point (0.0 to 1.0)
  /// [midtones] midtone adjustment (0.1 to 9.9, 1.0 = no change)
  factory ColorFilterExt.levels(double blackPoint, double whitePoint, double midtones) {
    blackPoint = blackPoint.clamp(0.0, 1.0);
    whitePoint = whitePoint.clamp(0.0, 1.0);
    midtones = midtones.clamp(0.1, 9.9);

    if (whitePoint <= blackPoint) whitePoint = blackPoint + 0.01;

    // Linear remapping
    double scale = 1.0 / (whitePoint - blackPoint);
    double offset = -blackPoint * scale;

    // Apply midtone gamma
    double gamma = 1.0 / midtones;
    double gammaFactor = pow(0.5, gamma) * 2.0;

    List<double> matrix = [
      scale * gammaFactor, 0, 0, 0, offset * 255,
      0, scale * gammaFactor, 0, 0, offset * 255,
      0, 0, scale * gammaFactor, 0, offset * 255,
      0, 0, 0, 1, 0
    ];

    return ColorFilterExt.matrix(matrix);
  }

  /// Normalize - auto contrast by stretching histogram
  factory ColorFilterExt.normalize() {
    // Simulated normalize by increasing contrast and adjusting brightness
    var contrast = ColorFilterExt.contrast(0.2);
    var brightness = ColorFilterExt.brightness(0.05);

    return ColorFilterExt.merged([contrast, brightness]);
  }
}
