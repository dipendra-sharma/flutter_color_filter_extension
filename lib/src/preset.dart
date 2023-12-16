import 'package:color_filter_extension/src/extension.dart';

/// Preset filters that can be used directly
class ColorFiltersPreset {
  final List<ColorFilterExt> filters;

  ColorFiltersPreset.create(this.filters);

  /// NoFilter: No filter
  factory ColorFiltersPreset.none() => ColorFiltersPreset.create([]);

  /// Clarendon: adds light to lighter areas and dark to darker areas
  factory ColorFiltersPreset.clarendon() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(.1),
        ColorFilterExt.contrast(.1),
        ColorFilterExt.saturation(.15),
      ]);

  /// Increase red color gradient
  factory ColorFiltersPreset.addictiveRed() => ColorFiltersPreset.create([
        ColorFilterExt.addictiveColor(50, 0, 0),
      ]);

  /// Increase blue color gradient
  factory ColorFiltersPreset.addictiveBlue() => ColorFiltersPreset.create([
        ColorFilterExt.addictiveColor(0, 0, 50),
      ]);

  /// Gingham: Vintage-inspired, taking some color out
  factory ColorFiltersPreset.gingham() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(.04),
        ColorFilterExt.contrast(-.15),
      ]);

  /// Moon: B/W, increase brightness and decrease contrast
  factory ColorFiltersPreset.moon() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(-.04),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Lark: Brightens and intensifies colours but not red hues
  factory ColorFiltersPreset.lark() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.08),
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(-.04),
      ]);

  /// Reyes: a vintage filter, gives your photos a “dusty” look
  factory ColorFiltersPreset.reyes() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.4),
        ColorFilterExt.brightness(0.13),
        ColorFilterExt.contrast(-.05),
      ]);

  /// Juno: Brightens colors, and intensifies red and yellow hues
  factory ColorFiltersPreset.juno() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.01, 1.04, 1),
        ColorFilterExt.saturation(0.3),
      ]);

  /// Slumber: Desaturates the image as well as adds haze for a retro, dreamy look – with an emphasis on blacks and blues
  factory ColorFiltersPreset.slumber() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(.1),
        ColorFilterExt.saturation(-0.5),
      ]);

  /// Crema: Adds a creamy look that both warms and cools the image
  factory ColorFiltersPreset.crema() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.04, 1, 1.02),
        ColorFilterExt.saturation(-0.05),
      ]);

  /// Ludwig: A slight hint of desaturation that also enhances light
  factory ColorFiltersPreset.ludwig() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(.05),
        ColorFilterExt.saturation(-0.03),
      ]);

  /// Aden: This filter gives a blue/pink natural look
  factory ColorFiltersPreset.aden() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(228, 130, 225, 0.13),
        ColorFilterExt.saturation(-0.2),
      ]);

  /// Perpetua: Adding a pastel look, this filter is ideal for portraits
  factory ColorFiltersPreset.perpetua() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.05, 1.1, 1),
      ]);

  /// Amaro: Adds light to an image, with the focus on the centre
  factory ColorFiltersPreset.amaro() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.3),
        ColorFilterExt.brightness(0.15),
      ]);

  /// Mayfair: Applies a warm pink tone, subtle vignetting to brighten the photograph center and a thin black border
  factory ColorFiltersPreset.mayfair() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(230, 115, 108, 0.05),
        ColorFilterExt.saturation(0.15),
      ]);

  /// Rise: Adds a "glow" to the image, with softer lighting of the subject
  factory ColorFiltersPreset.rise() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 170, 0, 0.1),
        ColorFilterExt.brightness(0.09),
        ColorFilterExt.saturation(0.1),
      ]);

  /// Hudson: Creates an "icy" illusion with heightened shadows, cool tint and dodged center
  factory ColorFiltersPreset.hudson() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1, 1, 1.25),
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.brightness(0.15),
      ]);

  /// Valencia: Fades the image by increasing exposure and warming the colors, to give it an antique feel
  factory ColorFiltersPreset.valencia() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 225, 80, 0.08),
        ColorFilterExt.saturation(0.1),
        ColorFilterExt.contrast(0.05),
      ]);

  /// X-Pro II: Increases color vibrance with a golden tint, high contrast and slight vignette added to the edges
  factory ColorFiltersPreset.xProII() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 255, 0, 0.07),
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.contrast(0.15),
      ]);

  /// Sierra: Gives a faded, softer look
  factory ColorFiltersPreset.sierra() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(-0.15),
        ColorFilterExt.saturation(0.1),
      ]);

  /// Willow: A monochromatic filter with subtle purple tones and a translucent white border
  factory ColorFiltersPreset.willow() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.colorOverlay(100, 28, 210, 0.03),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Lo-Fi: Enriches color and adds strong shadows through the use of saturation and "warming" the temperature
  factory ColorFiltersPreset.loFi() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.saturation(0.2),
      ]);

  /// Inkwell: Direct shift to black and white
  factory ColorFiltersPreset.inkwell() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
      ]);

  /// Hefe: Hight contrast and saturation, with a similar effect to Lo-Fi but not quite as dramatic
  factory ColorFiltersPreset.hefe() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.saturation(0.15),
      ]);

  /// Nashville: Warms the temperature, lowers contrast and increases exposure to give a light "pink" tint – making it feel "nostalgic"
  factory ColorFiltersPreset.nashville() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(220, 115, 188, 0.12),
        ColorFilterExt.contrast(-0.05),
      ]);

  /// Stinson: washing out the colors ever so slightly
  factory ColorFiltersPreset.stinson() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.sepia(0.3),
      ]);

  /// Vesper: adds a yellow tint that
  factory ColorFiltersPreset.vesper() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 225, 0, 0.05),
        ColorFilterExt.brightness(0.06),
        ColorFilterExt.contrast(0.06),
      ]);

  /// Earlybird: Gives an older look with a sepia tint and warm temperature
  factory ColorFiltersPreset.earlybird() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 165, 40, 0.2),
        ColorFilterExt.saturation(0.15),
      ]);

  /// Brannan: Increases contrast and exposure and adds a metallic tint
  factory ColorFiltersPreset.brannan() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.colorOverlay(140, 10, 185, 0.1),
      ]);

  /// Sutro: Burns photo edges, increases highlights and shadows dramatically with a focus on purple and brown colors
  factory ColorFiltersPreset.sutro() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(-0.1),
        ColorFilterExt.saturation(-0.1),
      ]);

  /// Toaster: Ages the image by "burning" the centre and adds a dramatic vignette
  factory ColorFiltersPreset.toaster() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.1),
        ColorFilterExt.colorOverlay(255, 145, 0, 0.2),
      ]);

  /// Walden: Increases exposure and adds a yellow tint
  factory ColorFiltersPreset.walden() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.colorOverlay(255, 255, 0, 0.2),
      ]);

  /// 1977: The increased exposure with a red tint gives the photograph a rosy, brighter, faded look.
  factory ColorFiltersPreset.f1977() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 25, 0, 0.15),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Kelvin: Increases saturation and temperature to give it a radiant "glow"
  factory ColorFiltersPreset.kelvin() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 140, 0, 0.1),
        ColorFilterExt.rgbScale(1.15, 1.05, 1),
        ColorFilterExt.saturation(0.35),
      ]);

  /// Maven: darkens images, increases shadows, and adds a slightly yellow tint overal
  factory ColorFiltersPreset.maven() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(225, 240, 0, 0.1),
        ColorFilterExt.saturation(0.25),
        ColorFilterExt.contrast(0.05),
      ]);

  /// Ginza: brightens and adds a warm glow
  factory ColorFiltersPreset.ginza() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.06),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Skyline: brightens to the image pop
  factory ColorFiltersPreset.skyline() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.35),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Dogpatch: increases the contrast, while washing out the lighter colors
  factory ColorFiltersPreset.dogpatch() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Brooklyn
  factory ColorFiltersPreset.brooklyn() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(25, 240, 252, 0.05),
        ColorFilterExt.sepia(0.3),
      ]);

  /// Helena: adds an orange and teal vibe
  factory ColorFiltersPreset.helena() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(208, 208, 86, 0.2),
        ColorFilterExt.contrast(0.15),
      ]);

  /// Ashby: gives images a great golden glow and a subtle vintage feel
  factory ColorFiltersPreset.ashby() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 160, 25, 0.1),
        ColorFilterExt.brightness(0.1),
      ]);

  /// Charmes: a high contrast filter, warming up colors in your image with a red tint
  factory ColorFiltersPreset.charmes() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 50, 80, 0.12),
        ColorFilterExt.contrast(0.05),
      ]);
}

/// List of filter presets
List<ColorFiltersPreset> presetFiltersList = [
  ColorFiltersPreset.none(),
  ColorFiltersPreset.addictiveBlue(),
  ColorFiltersPreset.addictiveRed(),
  ColorFiltersPreset.aden(),
  ColorFiltersPreset.amaro(),
  ColorFiltersPreset.ashby(),
  ColorFiltersPreset.brannan(),
  ColorFiltersPreset.brooklyn(),
  ColorFiltersPreset.charmes(),
  ColorFiltersPreset.clarendon(),
  ColorFiltersPreset.crema(),
  ColorFiltersPreset.dogpatch(),
  ColorFiltersPreset.earlybird(),
  ColorFiltersPreset.f1977(),
  ColorFiltersPreset.gingham(),
  ColorFiltersPreset.ginza(),
  ColorFiltersPreset.hefe(),
  ColorFiltersPreset.helena(),
  ColorFiltersPreset.hudson(),
  ColorFiltersPreset.inkwell(),
  ColorFiltersPreset.juno(),
  ColorFiltersPreset.kelvin(),
  ColorFiltersPreset.lark(),
  ColorFiltersPreset.loFi(),
  ColorFiltersPreset.ludwig(),
  ColorFiltersPreset.maven(),
  ColorFiltersPreset.mayfair(),
  ColorFiltersPreset.moon(),
  ColorFiltersPreset.nashville(),
  ColorFiltersPreset.perpetua(),
  ColorFiltersPreset.reyes(),
  ColorFiltersPreset.rise(),
  ColorFiltersPreset.sierra(),
  ColorFiltersPreset.skyline(),
  ColorFiltersPreset.slumber(),
  ColorFiltersPreset.stinson(),
  ColorFiltersPreset.sutro(),
  ColorFiltersPreset.toaster(),
  ColorFiltersPreset.valencia(),
  ColorFiltersPreset.vesper(),
  ColorFiltersPreset.walden(),
  ColorFiltersPreset.willow(),
  ColorFiltersPreset.xProII(),
];
