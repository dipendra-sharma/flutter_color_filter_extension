# Color Filter Extension

**Comprehensive Flutter color filter library with 50+ professional filters & 95+ presets**

Transform images with Lightroom-quality filters including film emulation, cinema looks, artistic effects, and technical adjustments.

## 🎯 30-Second Start

```dart
import 'package:color_filter_extension/color_filter_extension.dart';

// Basic filter
ColorFiltered(
  colorFilter: ColorFilterExt.brightness(0.2),
  child: Image.asset('assets/image.jpg'),
)

// Film emulation
ColorFiltered(
  colorFilter: ColorFilterExt.preset(ColorFiltersPreset.kodakPortra400()),
  child: Image.asset('assets/image.jpg'),
)

// Artistic effect
ColorFiltered(
  colorFilter: ColorFilterExt.cyberpunk(),
  child: Image.asset('assets/image.jpg'),
)
```

## 🚀 Key Features

- **53 Professional Filters** - From basic adjustments to advanced effects
- **95+ Stunning Presets** - Film emulation, cinema looks, moods, and more
- **Matrix-Based Performance** - Optimized for smooth real-time filtering
- **Zero Dependencies** - Pure Flutter implementation
- **Type Safe** - Full Dart type safety with comprehensive testing

## 📦 Installation

```yaml
dependencies:
  color_filter_extension: ^1.0.0
```

```bash
flutter pub get
```

## 🎨 Filter Categories

### Basic Adjustments
```dart
ColorFilterExt.brightness(0.2)    // Adjust brightness
ColorFilterExt.contrast(0.3)      // Modify contrast
ColorFilterExt.saturation(0.4)    // Change saturation
ColorFilterExt.hueRotation(45)    // Rotate hue
```

### Professional Photo Filters
```dart
ColorFilterExt.vintage(0.7, 0.5)     // Vintage effect with fade/warmth
ColorFilterExt.splitTone(Colors.blue, Colors.orange, 0.3)  // Split toning
ColorFilterExt.temperatureKelvin(5500)  // Color temperature
ColorFilterExt.dehaze(0.6)           // Remove atmospheric haze
```

### Artistic Effects
```dart
ColorFilterExt.cyberpunk()        // High-contrast neon
ColorFilterExt.noir()             // Dramatic black & white
ColorFilterExt.goldenHour()       // Warm sunset lighting
ColorFilterExt.infrared()         // Infrared photography
```

### Technical Adjustments
```dart
ColorFilterExt.gammaCorrection(1.8)       // Gamma correction
ColorFilterExt.levels(0.0, 1.0, 1.2)     // Levels adjustment
ColorFilterExt.duotone(Colors.blue, Colors.orange)  // Two-color mapping
```

## 🎬 Preset Collections

### Film Emulation (15 presets)
Perfect reproductions of classic film stocks:
```dart
// Kodak films
ColorFiltersPreset.kodakPortra400()   // Professional portraits
ColorFiltersPreset.kodakEktar100()    // Vivid landscapes
ColorFiltersPreset.kodakGold200()     // Warm consumer film

// Fujifilm stocks
ColorFiltersPreset.fujiVelvia50()     // Ultra-saturated colors
ColorFiltersPreset.fujiProvia100()    // Accurate slide film

// Black & white classics
ColorFiltersPreset.kodakTriX400()     // Legendary B&W
ColorFiltersPreset.ilfordHP5()        // Versatile monochrome
```

### Cinema Looks (10 presets)
Movie-grade color grading:
```dart
ColorFiltersPreset.cinematic()        // Orange & teal blockbuster
ColorFiltersPreset.bladeRunner2049()  // Sci-fi orange/blue
ColorFiltersPreset.matrixGreen()      // Cyberpunk green tint
ColorFiltersPreset.joker()            // Dark, desaturated mood
```

### Seasonal & Moods (21 presets)
Capture the perfect atmosphere:
```dart
// Seasons
ColorFiltersPreset.autumn()          // Warm oranges and browns
ColorFiltersPreset.winter()          // Cool, crisp blues

// Times of day
ColorFiltersPreset.sunrise()         // Soft golden light
ColorFiltersPreset.twilight()        // Purple-blue hour

// Emotional tones
ColorFiltersPreset.romantic()        // Soft, warm, dreamy
ColorFiltersPreset.dramatic()        // High contrast intensity
```

### Geographic Styles (10 presets)
Location-inspired looks:
```dart
ColorFiltersPreset.tokyo()           // Modern neon aesthetic
ColorFiltersPreset.paris()           // Romantic, classic tones
ColorFiltersPreset.mediterranean()   // Sunny, azure blues
ColorFiltersPreset.nordic()          // Cool, clean minimalism
```

## 🛠 Advanced Usage

### Combining Multiple Filters
```dart
final customFilter = ColorFilterExt.merged([
  ColorFilterExt.brightness(0.1),
  ColorFilterExt.contrast(0.2),
  ColorFilterExt.vintage(0.3, 0.4),
]);

ColorFiltered(
  colorFilter: customFilter,
  child: Image.asset('assets/image.jpg'),
)
```

### Creating Custom Presets
```dart
final myPreset = ColorFiltersPreset.create([
  ColorFilterExt.temperatureKelvin(5500),
  ColorFilterExt.tint(0.1),
  ColorFilterExt.saturation(0.2),
], name: 'My Custom Look');

ColorFiltered(
  colorFilter: ColorFilterExt.preset(myPreset),
  child: Image.asset('assets/image.jpg'),
)
```

### Performance Tips
```dart
// Pre-create filters for better performance
class MyWidget extends StatelessWidget {
  static final _filter = ColorFilterExt.cinematic();

  Widget build(context) => ColorFiltered(
    colorFilter: _filter,
    child: Image.asset('assets/image.jpg'),
  );
}
```

## 📊 Complete Filter Reference

| Category | Count | Examples |
|----------|-------|----------|
| **Basic Adjustments** | 8 | brightness, contrast, saturation, hue |
| **Color Science** | 7 | temperature, tint, duotone, posterize |
| **Professional Photo** | 7 | dehaze, split tone, cross process |
| **Artistic Effects** | 8 | vintage, cyberpunk, noir, pop art |
| **Technical** | 23 | gamma, levels, channel swaps |
| **Total Filters** | **53** | All with full documentation |
| **Total Presets** | **95** | Organized in 5 categories |

## 📱 Example App

The package includes a comprehensive example app showcasing all filters with categorized tabs:

```bash
cd example
flutter run
```

Features:
- **Tabbed Interface** - Browse filters by category
- **Live Preview** - See effects applied in real-time
- **Tap for Details** - Full-screen preview with filter info
- **Responsive Design** - Works on mobile and tablet

## 🔧 Requirements

- **Flutter**: `>=3.10.0`
- **Dart**: `>=3.0.0 <4.0.0`
- **Platform**: iOS, Android, Web, Desktop

## 🤝 Contributing

Contributions welcome! Whether it's:
- 🐛 Bug reports
- 💡 Feature requests
- 📖 Documentation improvements
- 🧪 New filter algorithms

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.
