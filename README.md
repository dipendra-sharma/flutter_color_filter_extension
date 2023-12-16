# Color Filter Extension

## Overview
The Color Filter Extension library is a comprehensive and versatile tool for applying color transformations to images in Flutter applications. It centers around the `ColorFilterExt` class, which provides a wide array of functionalities to manipulate colors and apply effects to images. This library is perfect for developers looking to add advanced color processing features to their Flutter projects.

## Key Features
- **Versatile Color Manipulation**: Offers methods for brightness, contrast, saturation adjustments, and more.
- **Preset Filters**: Includes a range of pre-defined filters for quick and easy application.
- **Custom Filter Creation**: Enables the combination of various effects to create unique color filters.
- **Extensive Documentation**: Each method is thoroughly documented for ease of use.

## Installation
To start using the Color Filter Extension library, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  color_filter_extension: ^0.0.2
```
Then, run the following command to get the package:

```
flutter pub get
```

## Usage
Begin by importing the package in your Dart file:
```dart
import 'package:color_filter_extension/color_filter_extension.dart';
```

### Applying Custom Color Filters
Use `ColorFilterExt` to create and apply custom filters. Here are some examples:

#### Brightness
```dart
var brightnessFilter = ColorFilterExt.brightness(0.1);
```

#### Contrast
```dart
var contrastFilter = ColorFilterExt.contrast(0.2);
```

#### Saturation
```dart
var saturationFilter = ColorFilterExt.saturation(0.3);
```

#### Custom Composite Filter
Combine multiple effects into a single filter:
```dart
var customFilter = ColorFilterExt.merged([
  ColorFilterExt.brightness(0.1),
  ColorFilterExt.contrast(0.2),
  ColorFilterExt.saturation(0.3),
  // Add other effects as needed
]);
```

### Applying Filters to Images
```dart
import 'package:flutter/material.dart';
import 'package:color_filter_extension/color_filter_extension.dart';

// Adjustments
Widget build(BuildContext context) {
  return ColorFiltered(
    colorFilter: ColorFilterExt.saturation(0.3),
    child: Image.asset('assets/image.png'),
  );
}

// Combination of Filters
Widget build(BuildContext context) {
  return ColorFiltered(
    colorFilter: customFilter,
    child: Image.asset('assets/image.png'),
  );
}

// Presets
Widget build(BuildContext context) {
  return ColorFiltered(
    colorFilter: ColorFilterExt.preset(ColorFiltersPreset.clarendon()),
    child: Image.asset('assets/image.png'),
  );
}

// Creating Presets
Widget build(BuildContext context) {
  return ColorFiltered(
    colorFilter: ColorFilterExt.preset(ColorFiltersPreset.create(
        [
          ColorFilterExt.brightness(0.1),
          ColorFilterExt.contrast(0.2),
          ColorFilterExt.saturation(0.3)
        ])),
    child: Image.asset('assets/image.png'),
  );
}
```

## Preset Filters
In addition to custom filters, the library also includes a set of predefined presets such as `ColorFiltersPreset.clarendon()`, `ColorFiltersPreset.moon()`, etc.

## Documentation
For detailed information on all available methods and their usage, please refer to the inline documentation provided within the library.

## Example Images
![ALT TEXT](example.png)

## Contributions
Your contributions are welcome! Whether it's suggesting new features, improving documentation, or reporting bugs, please feel free to contribute.

## Acknowledgements
A special thanks to everyone who has contributed to this project, provided feedback, or used this library in their applications.

## License
This library is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
