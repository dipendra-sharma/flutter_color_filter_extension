# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter package called `color_filter_extension` that provides comprehensive color transformation capabilities for images. The package centers around the `ColorFilterExt` class which offers various methods for manipulating colors and applying Instagram-style filter effects.

## Core Architecture

### Main Components

- **`ColorFilterExt`** (lib/src/extension.dart) - Main class extending Flutter's `ColorFilter`, providing factory methods for creating color transformations
- **`ColorMatrix`** (lib/src/matrix.dart) - Handles 4x5 matrix operations for color transformations with merge functionality
- **`ColorFiltersPreset`** (lib/src/preset.dart) - Pre-defined Instagram-style filters (Clarendon, Moon, Lark, etc.)

### Package Structure
```
lib/
├── color_filter_extension.dart  # Main export file
└── src/
    ├── extension.dart           # ColorFilterExt class with all filter methods
    ├── matrix.dart             # ColorMatrix class and merge operations
    └── preset.dart             # Predefined filter presets
```

### Color Matrix System

The package uses 4x5 color matrices for transformations:
- First 4 columns: Color transformation (RGBA scaling/rotation)
- 5th column: Translation vector (additive component)
- Matrix merging combines multiple filters sequentially using proper matrix multiplication

## Common Development Commands

### Package Management
```bash
flutter pub get                    # Install dependencies
flutter pub upgrade                # Upgrade dependencies
```

### Testing
```bash
flutter test                       # Run all tests
flutter test test/color_filter_extension_test.dart  # Run specific test file
```

### Analysis & Linting
```bash
flutter analyze                    # Static analysis
dart format .                      # Format code
```

### Example App
```bash
cd example
flutter run                       # Run example app
```

### Publishing (Package Maintainer)
```bash
dart pub publish --dry-run         # Test package publishing
dart pub publish                   # Publish to pub.dev
```

## Filter Types Available

- **Adjustments**: brightness, contrast, saturation, hue, temperature, opacity
- **Effects**: grayscale, sepia, invert, gamma correction
- **Color Overlays**: addictive colors, RGB scaling
- **Presets**: 40+ Instagram-style filters (Clarendon, Moon, Valencia, etc.)
- **Custom**: Merge multiple filters using `ColorFilterExt.merged()`

## Usage Patterns

### Basic Filter Application
```dart
ColorFiltered(
  colorFilter: ColorFilterExt.brightness(0.1),
  child: Image.asset('image.png'),
)
```

### Combining Multiple Filters
```dart
ColorFilterExt.merged([
  ColorFilterExt.brightness(0.1),
  ColorFilterExt.contrast(0.2),
  ColorFilterExt.saturation(0.3),
])
```

### Using Presets
```dart
ColorFilterExt.preset(ColorFiltersPreset.clarendon())
```

## Development Notes

- Package supports Flutter >=1.17.0 and Dart >=3.2.3
- Uses `flutter_lints` for code quality
- Matrix operations are performance-critical - test thoroughly when modifying matrix.dart
- All filter values are typically in range -1.0 to 1.0 (some exceptions for specific effects)
- Example app demonstrates all preset filters in a grid layout