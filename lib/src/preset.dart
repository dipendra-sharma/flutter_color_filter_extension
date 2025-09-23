import 'package:color_filter_extension/src/extension.dart';

/// Preset filters that can be used directly
class ColorFiltersPreset {
  final List<ColorFilterExt> filters;
  final String name;

  ColorFiltersPreset.create(this.filters, {this.name = 'Custom'});

  /// NoFilter: No filter
  factory ColorFiltersPreset.none() =>
      ColorFiltersPreset.create([], name: 'None');

  /// Clarendon: adds light to lighter areas and dark to darker areas
  factory ColorFiltersPreset.clarendon() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(.1),
        ColorFilterExt.contrast(.1),
        ColorFilterExt.saturation(.15),
      ], name: 'Clarendon');

  /// Increase red color gradient
  factory ColorFiltersPreset.addictiveRed() => ColorFiltersPreset.create([
        ColorFilterExt.addictiveColor(50, 0, 0),
      ], name: 'Addictive Red');

  /// Increase blue color gradient
  factory ColorFiltersPreset.addictiveBlue() => ColorFiltersPreset.create([
        ColorFilterExt.addictiveColor(0, 0, 50),
      ], name: 'Addictive Blue');

  /// Gingham: Vintage-inspired, taking some color out
  factory ColorFiltersPreset.gingham() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(.04),
        ColorFilterExt.contrast(-.15),
      ], name: 'Gingham');

  /// Moon: B/W, increase brightness and decrease contrast
  factory ColorFiltersPreset.moon() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(-.04),
        ColorFilterExt.brightness(0.1),
      ], name: 'Moon');

  /// Lark: Brightens and intensifies colours but not red hues
  factory ColorFiltersPreset.lark() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.08),
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(-.04),
      ], name: 'Lark');

  /// Reyes: a vintage filter, gives your photos a “dusty” look
  factory ColorFiltersPreset.reyes() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.4),
        ColorFilterExt.brightness(0.13),
        ColorFilterExt.contrast(-.05),
      ], name: 'Reyes');

  /// Juno: Brightens colors, and intensifies red and yellow hues
  factory ColorFiltersPreset.juno() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.01, 1.04, 1),
        ColorFilterExt.saturation(0.3),
      ], name: 'Juno');

  /// Slumber: Desaturates the image as well as adds haze for a retro, dreamy look – with an emphasis on blacks and blues
  factory ColorFiltersPreset.slumber() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(.1),
        ColorFilterExt.saturation(-0.5),
      ], name: 'Slumber');

  /// Crema: Adds a creamy look that both warms and cools the image
  factory ColorFiltersPreset.crema() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.04, 1, 1.02),
        ColorFilterExt.saturation(-0.05),
      ], name: 'Crema');

  /// Ludwig: A slight hint of desaturation that also enhances light
  factory ColorFiltersPreset.ludwig() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(.05),
        ColorFilterExt.saturation(-0.03),
      ], name: 'Ludwig');

  /// Aden: This filter gives a blue/pink natural look
  factory ColorFiltersPreset.aden() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(228, 130, 225, 0.13),
        ColorFilterExt.saturation(-0.2),
      ], name: 'Aden');

  /// Perpetua: Adding a pastel look, this filter is ideal for portraits
  factory ColorFiltersPreset.perpetua() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.05, 1.1, 1),
      ], name: 'Perpetua');

  /// Amaro: Adds light to an image, with the focus on the centre
  factory ColorFiltersPreset.amaro() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.3),
        ColorFilterExt.brightness(0.15),
      ], name: 'Amaro');

  /// Mayfair: Applies a warm pink tone, subtle vignetting to brighten the photograph center and a thin black border
  factory ColorFiltersPreset.mayfair() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(230, 115, 108, 0.05),
        ColorFilterExt.saturation(0.15),
      ], name: 'Mayfair');

  /// Rise: Adds a "glow" to the image, with softer lighting of the subject
  factory ColorFiltersPreset.rise() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 170, 0, 0.1),
        ColorFilterExt.brightness(0.09),
        ColorFilterExt.saturation(0.1),
      ], name: 'Rise');

  /// Hudson: Creates an "icy" illusion with heightened shadows, cool tint and dodged center
  factory ColorFiltersPreset.hudson() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1, 1, 1.25),
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.brightness(0.15),
      ], name: 'Hudson');

  /// Valencia: Fades the image by increasing exposure and warming the colors, to give it an antique feel
  factory ColorFiltersPreset.valencia() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 225, 80, 0.08),
        ColorFilterExt.saturation(0.1),
        ColorFilterExt.contrast(0.05),
      ], name: 'Valencia');

  /// X-Pro II: Increases color vibrance with a golden tint, high contrast and slight vignette added to the edges
  factory ColorFiltersPreset.xProII() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 255, 0, 0.07),
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.contrast(0.15),
      ], name: 'X-Pro II');

  /// Sierra: Gives a faded, softer look
  factory ColorFiltersPreset.sierra() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(-0.15),
        ColorFilterExt.saturation(0.1),
      ], name: 'Sierra');

  /// Willow: A monochromatic filter with subtle purple tones and a translucent white border
  factory ColorFiltersPreset.willow() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.colorOverlay(100, 28, 210, 0.03),
        ColorFilterExt.brightness(0.1),
      ], name: 'Willow');

  /// Lo-Fi: Enriches color and adds strong shadows through the use of saturation and "warming" the temperature
  factory ColorFiltersPreset.loFi() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.saturation(0.2),
      ], name: 'Lo-Fi');

  /// Inkwell: Direct shift to black and white
  factory ColorFiltersPreset.inkwell() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
      ], name: 'Inkwell');

  /// Hefe: Hight contrast and saturation, with a similar effect to Lo-Fi but not quite as dramatic
  factory ColorFiltersPreset.hefe() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.saturation(0.15),
      ], name: 'Hefe');

  /// Nashville: Warms the temperature, lowers contrast and increases exposure to give a light "pink" tint – making it feel "nostalgic"
  factory ColorFiltersPreset.nashville() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(220, 115, 188, 0.12),
        ColorFilterExt.contrast(-0.05),
      ], name: 'Nashville');

  /// Stinson: washing out the colors ever so slightly
  factory ColorFiltersPreset.stinson() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.sepia(0.3),
      ], name: 'Stinson');

  /// Vesper: adds a yellow tint that
  factory ColorFiltersPreset.vesper() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 225, 0, 0.05),
        ColorFilterExt.brightness(0.06),
        ColorFilterExt.contrast(0.06),
      ], name: 'Vesper');

  /// Earlybird: Gives an older look with a sepia tint and warm temperature
  factory ColorFiltersPreset.earlybird() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 165, 40, 0.2),
        ColorFilterExt.saturation(0.15),
      ], name: 'Earlybird');

  /// Brannan: Increases contrast and exposure and adds a metallic tint
  factory ColorFiltersPreset.brannan() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.colorOverlay(140, 10, 185, 0.1),
      ], name: 'Brannan');

  /// Sutro: Burns photo edges, increases highlights and shadows dramatically with a focus on purple and brown colors
  factory ColorFiltersPreset.sutro() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(-0.1),
        ColorFilterExt.saturation(-0.1),
      ], name: 'Sutro');

  /// Toaster: Ages the image by "burning" the centre and adds a dramatic vignette
  factory ColorFiltersPreset.toaster() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.1),
        ColorFilterExt.colorOverlay(255, 145, 0, 0.2),
      ], name: 'Toaster');

  /// Walden: Increases exposure and adds a yellow tint
  factory ColorFiltersPreset.walden() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.colorOverlay(255, 255, 0, 0.2),
      ], name: 'Walden');

  /// 1977: The increased exposure with a red tint gives the photograph a rosy, brighter, faded look.
  factory ColorFiltersPreset.f1977() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 25, 0, 0.15),
        ColorFilterExt.brightness(0.1),
      ], name: '1977');

  /// Kelvin: Increases saturation and temperature to give it a radiant "glow"
  factory ColorFiltersPreset.kelvin() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 140, 0, 0.1),
        ColorFilterExt.rgbScale(1.15, 1.05, 1),
        ColorFilterExt.saturation(0.35),
      ], name: 'Kelvin');

  /// Maven: darkens images, increases shadows, and adds a slightly yellow tint overal
  factory ColorFiltersPreset.maven() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(225, 240, 0, 0.1),
        ColorFilterExt.saturation(0.25),
        ColorFilterExt.contrast(0.05),
      ], name: 'Maven');

  /// Ginza: brightens and adds a warm glow
  factory ColorFiltersPreset.ginza() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.06),
        ColorFilterExt.brightness(0.1),
      ], name: 'Ginza');

  /// Skyline: brightens to the image pop
  factory ColorFiltersPreset.skyline() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.35),
        ColorFilterExt.brightness(0.1),
      ], name: 'Skyline');

  /// Dogpatch: increases the contrast, while washing out the lighter colors
  factory ColorFiltersPreset.dogpatch() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.brightness(0.1),
      ], name: 'Dogpatch');

  /// Brooklyn
  factory ColorFiltersPreset.brooklyn() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(25, 240, 252, 0.05),
        ColorFilterExt.sepia(0.3),
      ], name: 'Brooklyn');

  /// Helena: adds an orange and teal vibe
  factory ColorFiltersPreset.helena() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(208, 208, 86, 0.2),
        ColorFilterExt.contrast(0.15),
      ], name: 'Helena');

  /// Ashby: gives images a great golden glow and a subtle vintage feel
  factory ColorFiltersPreset.ashby() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 160, 25, 0.1),
        ColorFilterExt.brightness(0.1),
      ], name: 'Ashby');

  /// Charmes: a high contrast filter, warming up colors in your image with a red tint
  factory ColorFiltersPreset.charmes() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 50, 80, 0.12),
        ColorFilterExt.contrast(0.05),
      ], name: 'Charmes');

  // =================== FILM EMULATION PRESETS ===================

  // Kodak Film Stocks
  /// Kodak Portra 400: Professional portrait film with natural skin tones
  factory ColorFiltersPreset.kodakPortra400() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.05, 1.02, 0.98),
        ColorFilterExt.contrast(0.05),
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.colorOverlay(255, 248, 238, 0.03),
      ], name: 'Kodak Portra 400');

  /// Kodak Ektar 100: Ultra-fine grain with vivid colors
  factory ColorFiltersPreset.kodakEktar100() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.3),
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.rgbScale(1.08, 1.0, 0.95),
      ], name: 'Kodak Ektar 100');

  /// Kodak Gold 200: Classic consumer film with warm tones
  factory ColorFiltersPreset.kodakGold200() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.1, 1.05, 0.9),
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.saturation(0.1),
      ], name: 'Kodak Gold 200');

  /// Kodak Tri-X 400: Legendary black and white film
  factory ColorFiltersPreset.kodakTriX400() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.brightness(-0.05),
      ], name: 'Kodak Tri-X 400');

  // Fujifilm Stocks
  /// Fuji Velvia 50: Ultra-saturated landscape film
  factory ColorFiltersPreset.fujiVelvia50() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.4),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.rgbScale(1.0, 1.05, 1.1),
      ], name: 'Fuji Velvia 50');

  /// Fuji Provia 100: Professional slide film with accurate colors
  factory ColorFiltersPreset.fujiProvia100() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.15),
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.brightness(0.03),
      ], name: 'Fuji Provia 100');

  /// Fuji Astia 100: Portrait slide film with soft skin tones
  factory ColorFiltersPreset.fujiAstia100() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(-0.05),
        ColorFilterExt.rgbScale(1.03, 1.01, 0.98),
        ColorFilterExt.contrast(0.05),
      ], name: 'Fuji Astia 100');

  /// Fuji Superia 400: Popular consumer film
  factory ColorFiltersPreset.fujiSuperia400() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.02, 1.0, 0.95),
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.brightness(0.08),
      ], name: 'Fuji Superia 400');

  /// Fuji Acros 100: Modern black and white with fine grain
  factory ColorFiltersPreset.fujiAcros100() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.brightness(0.02),
      ], name: 'Fuji Acros 100');

  // Ilford Black & White Films
  /// Ilford HP5: Versatile black and white film
  factory ColorFiltersPreset.ilfordHP5() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.brightness(-0.03),
      ], name: 'Ilford HP5');

  /// Ilford Delta 3200: High-speed black and white
  factory ColorFiltersPreset.ilfordDelta3200() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(0.25),
        ColorFilterExt.brightness(-0.1),
      ], name: 'Ilford Delta 3200');

  /// Ilford Pan F 50: Ultra-fine grain black and white
  factory ColorFiltersPreset.ilfordPanF50() => ColorFiltersPreset.create([
        ColorFilterExt.grayscale(),
        ColorFilterExt.contrast(0.08),
        ColorFilterExt.brightness(0.05),
      ], name: 'Ilford Pan F 50');

  // Polaroid Instant Films
  /// Polaroid 600: Classic instant film look
  factory ColorFiltersPreset.polaroid600() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.05, 1.0, 0.95),
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.contrast(-0.1),
        ColorFilterExt.brightness(0.1),
      ], name: 'Polaroid 600');

  /// Polaroid SX-70: Vintage instant film
  factory ColorFiltersPreset.polaroidSX70() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.2),
        ColorFilterExt.brightness(0.15),
        ColorFilterExt.contrast(-0.15),
        ColorFilterExt.saturation(-0.3),
      ], name: 'Polaroid SX-70');

  /// Impossible Project: Modern instant film
  factory ColorFiltersPreset.impossibleProject() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.03, 0.98, 1.02),
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.brightness(0.05),
      ], name: 'Impossible Project');

  // =================== CINEMA/MOVIE LOOK PRESETS ===================

  /// Cinematic: Orange and teal blockbuster look
  factory ColorFiltersPreset.cinematic() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.rgbScale(1.1, 0.95, 0.85),
        ColorFilterExt.colorOverlay(0, 128, 128, 0.05),
      ], name: 'Cinematic');

  /// Blockbuster: High-budget action movie look
  factory ColorFiltersPreset.blockbuster() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.25),
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.rgbScale(1.15, 1.0, 0.8),
        ColorFilterExt.brightness(-0.05),
      ], name: 'Blockbuster');

  /// Matrix Green: Cyberpunk green tint
  factory ColorFiltersPreset.matrixGreen() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(0, 255, 0, 0.15),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.saturation(-0.3),
        ColorFilterExt.brightness(-0.1),
      ], name: 'Matrix Green');

  /// Mad Max Orange: Post-apocalyptic desert look
  factory ColorFiltersPreset.madMaxOrange() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(255, 140, 0, 0.2),
        ColorFilterExt.contrast(0.3),
        ColorFilterExt.saturation(0.1),
        ColorFilterExt.brightness(0.05),
      ], name: 'Mad Max Orange');

  /// Blade Runner 2049: Sci-fi orange and blue
  factory ColorFiltersPreset.bladeRunner2049() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.2, 0.9, 0.7),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.colorOverlay(255, 165, 0, 0.1),
      ], name: 'Blade Runner 2049');

  /// Moonlight: Dreamy blue tone
  factory ColorFiltersPreset.moonlight() => ColorFiltersPreset.create([
        ColorFilterExt.colorOverlay(100, 150, 255, 0.15),
        ColorFilterExt.contrast(-0.1),
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.brightness(0.08),
      ], name: 'Moonlight');

  /// Joker: Dark, desaturated with green highlights
  factory ColorFiltersPreset.joker() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(-0.4),
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.colorOverlay(0, 100, 50, 0.08),
        ColorFilterExt.brightness(-0.08),
      ], name: 'Joker');

  /// Wes Anderson: Pastel symmetrical aesthetic
  factory ColorFiltersPreset.wesAnderson() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.rgbScale(1.05, 1.02, 0.98),
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.contrast(-0.05),
      ], name: 'Wes Anderson');

  /// Marvel: Bright, colorful superhero look
  factory ColorFiltersPreset.marvel() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.3),
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.rgbScale(1.05, 1.0, 1.0),
      ], name: 'Marvel');

  /// DC Dark: Dark, moody superhero aesthetic
  factory ColorFiltersPreset.dcDark() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(-0.3),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.brightness(-0.15),
        ColorFilterExt.colorOverlay(0, 0, 50, 0.1),
      ], name: 'DC Dark');

  // =================== SEASONAL PRESETS ===================

  /// Spring: Fresh, green, vibrant
  factory ColorFiltersPreset.spring() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.rgbScale(0.95, 1.1, 0.95),
        ColorFilterExt.brightness(0.08),
        ColorFilterExt.contrast(0.05),
      ], name: 'Spring');

  /// Summer: Bright, warm, energetic
  factory ColorFiltersPreset.summer() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.15),
        ColorFilterExt.saturation(0.3),
        ColorFilterExt.rgbScale(1.1, 1.05, 0.9),
        ColorFilterExt.contrast(0.1),
      ], name: 'Summer');

  /// Autumn: Warm oranges and browns
  factory ColorFiltersPreset.autumn() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.2, 1.0, 0.8),
        ColorFilterExt.saturation(0.15),
        ColorFilterExt.colorOverlay(255, 140, 0, 0.1),
        ColorFilterExt.contrast(0.05),
      ], name: 'Autumn');

  /// Winter: Cool, crisp, blue-tinted
  factory ColorFiltersPreset.winter() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(0.9, 0.95, 1.15),
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.brightness(-0.05),
        ColorFilterExt.contrast(0.1),
      ], name: 'Winter');

  // =================== TIME OF DAY PRESETS ===================

  /// Sunrise: Soft golden light
  factory ColorFiltersPreset.sunrise() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.15, 1.05, 0.85),
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.saturation(0.1),
        ColorFilterExt.contrast(-0.05),
      ], name: 'Sunrise');

  /// Midday: Bright, neutral lighting
  factory ColorFiltersPreset.midday() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.contrast(0.1),
        ColorFilterExt.saturation(0.05),
      ], name: 'Midday');

  /// Sunset: Warm golden hour
  factory ColorFiltersPreset.sunset() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.2, 1.0, 0.7),
        ColorFilterExt.colorOverlay(255, 140, 0, 0.15),
        ColorFilterExt.saturation(0.15),
        ColorFilterExt.brightness(0.05),
      ], name: 'Sunset');

  /// Twilight: Purple and blue hour
  factory ColorFiltersPreset.twilight() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(0.9, 0.9, 1.2),
        ColorFilterExt.colorOverlay(100, 0, 200, 0.1),
        ColorFilterExt.saturation(0.1),
        ColorFilterExt.brightness(-0.1),
      ], name: 'Twilight');

  /// Midnight: Dark, mysterious blue
  factory ColorFiltersPreset.midnight() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(-0.2),
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.colorOverlay(0, 0, 100, 0.2),
        ColorFilterExt.contrast(0.1),
      ], name: 'Midnight');

  // =================== MOOD PRESETS ===================

  /// Cheerful: Bright and happy
  factory ColorFiltersPreset.cheerful() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(0.15),
        ColorFilterExt.saturation(0.25),
        ColorFilterExt.contrast(0.05),
        ColorFilterExt.rgbScale(1.05, 1.05, 1.0),
      ], name: 'Cheerful');

  /// Moody: Dark and atmospheric
  factory ColorFiltersPreset.moody() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(-0.15),
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.colorOverlay(50, 50, 100, 0.1),
      ], name: 'Moody');

  /// Dramatic: High contrast and intensity
  factory ColorFiltersPreset.dramatic() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.3),
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.brightness(-0.05),
      ], name: 'Dramatic');

  /// Romantic: Soft, warm, dreamy
  factory ColorFiltersPreset.romantic() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.1, 1.0, 0.9),
        ColorFilterExt.brightness(0.08),
        ColorFilterExt.contrast(-0.1),
        ColorFilterExt.saturation(-0.05),
      ], name: 'Romantic');

  /// Mysterious: Dark with selective highlights
  factory ColorFiltersPreset.mysterious() => ColorFiltersPreset.create([
        ColorFilterExt.brightness(-0.2),
        ColorFilterExt.contrast(0.25),
        ColorFilterExt.saturation(-0.3),
        ColorFilterExt.colorOverlay(100, 0, 100, 0.08),
      ], name: 'Mysterious');

  /// Energetic: Vibrant and punchy
  factory ColorFiltersPreset.energetic() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.4),
        ColorFilterExt.contrast(0.2),
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.rgbScale(1.05, 1.0, 0.95),
      ], name: 'Energetic');

  /// Calm: Soft, peaceful, muted
  factory ColorFiltersPreset.calm() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.contrast(-0.1),
        ColorFilterExt.rgbScale(0.98, 1.0, 1.02),
      ], name: 'Calm');

  /// Melancholic: Desaturated with blue tint
  factory ColorFiltersPreset.melancholic() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(-0.3),
        ColorFilterExt.brightness(-0.08),
        ColorFilterExt.colorOverlay(0, 50, 150, 0.1),
        ColorFilterExt.contrast(-0.05),
      ], name: 'Melancholic');

  // =================== GEOGRAPHIC/CULTURAL STYLE PRESETS ===================

  /// Tokyo: Modern, vibrant neon aesthetic
  factory ColorFiltersPreset.tokyo() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.3),
        ColorFilterExt.contrast(0.15),
        ColorFilterExt.colorOverlay(255, 0, 100, 0.08),
        ColorFilterExt.brightness(0.05),
      ], name: 'Tokyo');

  /// Paris: Romantic, soft, classic
  factory ColorFiltersPreset.paris() => ColorFiltersPreset.create([
        ColorFilterExt.sepia(0.1),
        ColorFilterExt.brightness(0.08),
        ColorFilterExt.contrast(-0.05),
        ColorFilterExt.rgbScale(1.05, 1.0, 0.95),
      ], name: 'Paris');

  /// New York: Urban, gritty, high contrast
  factory ColorFiltersPreset.newYork() => ColorFiltersPreset.create([
        ColorFilterExt.contrast(0.25),
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.brightness(-0.05),
        ColorFilterExt.colorOverlay(50, 50, 50, 0.05),
      ], name: 'New York');

  /// Mumbai: Warm, vibrant, colorful
  factory ColorFiltersPreset.mumbai() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.4),
        ColorFilterExt.rgbScale(1.15, 1.05, 0.9),
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.colorOverlay(255, 140, 0, 0.08),
      ], name: 'Mumbai');

  /// Dubai: Luxurious, warm desert tones
  factory ColorFiltersPreset.dubai() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.2, 1.1, 0.8),
        ColorFilterExt.saturation(0.2),
        ColorFilterExt.brightness(0.15),
        ColorFilterExt.colorOverlay(255, 200, 100, 0.1),
      ], name: 'Dubai');

  /// Nordic: Cool, clean, minimalist
  factory ColorFiltersPreset.nordic() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(0.9, 0.95, 1.1),
        ColorFilterExt.saturation(-0.2),
        ColorFilterExt.brightness(0.05),
        ColorFilterExt.contrast(0.05),
      ], name: 'Nordic');

  /// Mediterranean: Warm, sunny, azure blues
  factory ColorFiltersPreset.mediterranean() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.25),
        ColorFilterExt.rgbScale(1.1, 1.0, 1.05),
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.colorOverlay(0, 150, 255, 0.05),
      ], name: 'Mediterranean');

  /// Tropical: Lush greens and vibrant colors
  factory ColorFiltersPreset.tropical() => ColorFiltersPreset.create([
        ColorFilterExt.saturation(0.35),
        ColorFilterExt.rgbScale(0.95, 1.15, 1.0),
        ColorFilterExt.brightness(0.08),
        ColorFilterExt.contrast(0.1),
      ], name: 'Tropical');

  /// Desert: Warm, sandy, earthy tones
  factory ColorFiltersPreset.desert() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(1.25, 1.1, 0.7),
        ColorFilterExt.saturation(-0.1),
        ColorFilterExt.colorOverlay(200, 150, 100, 0.15),
        ColorFilterExt.brightness(0.05),
      ], name: 'Desert');

  /// Arctic: Cold, crisp, blue-white
  factory ColorFiltersPreset.arctic() => ColorFiltersPreset.create([
        ColorFilterExt.rgbScale(0.85, 0.9, 1.2),
        ColorFilterExt.brightness(0.1),
        ColorFilterExt.saturation(-0.15),
        ColorFilterExt.contrast(0.1),
      ], name: 'Arctic');
}

/// List of filter presets
List<ColorFiltersPreset> presetFiltersList = [
  // Original presets
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

  // Film Emulation presets
  ColorFiltersPreset.kodakPortra400(),
  ColorFiltersPreset.kodakEktar100(),
  ColorFiltersPreset.kodakGold200(),
  ColorFiltersPreset.kodakTriX400(),
  ColorFiltersPreset.fujiVelvia50(),
  ColorFiltersPreset.fujiProvia100(),
  ColorFiltersPreset.fujiAstia100(),
  ColorFiltersPreset.fujiSuperia400(),
  ColorFiltersPreset.fujiAcros100(),
  ColorFiltersPreset.ilfordHP5(),
  ColorFiltersPreset.ilfordDelta3200(),
  ColorFiltersPreset.ilfordPanF50(),
  ColorFiltersPreset.polaroid600(),
  ColorFiltersPreset.polaroidSX70(),
  ColorFiltersPreset.impossibleProject(),

  // Cinema/Movie Look presets
  ColorFiltersPreset.cinematic(),
  ColorFiltersPreset.blockbuster(),
  ColorFiltersPreset.matrixGreen(),
  ColorFiltersPreset.madMaxOrange(),
  ColorFiltersPreset.bladeRunner2049(),
  ColorFiltersPreset.moonlight(),
  ColorFiltersPreset.joker(),
  ColorFiltersPreset.wesAnderson(),
  ColorFiltersPreset.marvel(),
  ColorFiltersPreset.dcDark(),

  // Seasonal presets
  ColorFiltersPreset.spring(),
  ColorFiltersPreset.summer(),
  ColorFiltersPreset.autumn(),
  ColorFiltersPreset.winter(),

  // Time of day presets
  ColorFiltersPreset.sunrise(),
  ColorFiltersPreset.midday(),
  ColorFiltersPreset.sunset(),
  ColorFiltersPreset.twilight(),
  ColorFiltersPreset.midnight(),

  // Mood presets
  ColorFiltersPreset.cheerful(),
  ColorFiltersPreset.moody(),
  ColorFiltersPreset.dramatic(),
  ColorFiltersPreset.romantic(),
  ColorFiltersPreset.mysterious(),
  ColorFiltersPreset.energetic(),
  ColorFiltersPreset.calm(),
  ColorFiltersPreset.melancholic(),

  // Geographic/Cultural presets
  ColorFiltersPreset.tokyo(),
  ColorFiltersPreset.paris(),
  ColorFiltersPreset.newYork(),
  ColorFiltersPreset.mumbai(),
  ColorFiltersPreset.dubai(),
  ColorFiltersPreset.nordic(),
  ColorFiltersPreset.mediterranean(),
  ColorFiltersPreset.tropical(),
  ColorFiltersPreset.desert(),
  ColorFiltersPreset.arctic(),
];
