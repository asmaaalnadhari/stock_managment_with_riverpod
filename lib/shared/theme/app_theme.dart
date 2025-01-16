import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006a63),
      surfaceTint: Color(0xff006a63),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9df2e8),
      onPrimaryContainer: Color(0xff00201d),
      secondary: Color(0xff4a6360),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcce8e4),
      onSecondaryContainer: Color(0xff051f1d),
      tertiary: Color(0xff47617a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcfe5ff),
      onTertiaryContainer: Color(0xff001d33),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff4fbf9),
      onSurface: Color(0xff161d1c),
      onSurfaceVariant: Color(0xff3f4947),
      outline: Color(0xff6f7977),
      outlineVariant: Color(0xffbec9c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3231),
      inversePrimary: Color(4286698956),
      primaryFixed: Color(4288541416),
      onPrimaryFixed: Color(4278198301),
      primaryFixedDim: Color(4286698956),
      onPrimaryFixedVariant: Color(4278210635),
      secondaryFixed: Color(4291619044),
      onSecondaryFixed: Color(4278525725),
      secondaryFixedDim: Color(4289842376),
      onSecondaryFixedVariant: Color(4281486152),
      tertiaryFixed: Color(4291814911),
      onTertiaryFixed: Color(4278197555),
      tertiaryFixedDim: Color(4289710567),
      onTertiaryFixedVariant: Color(4281289057),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245369),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916147),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126631),
      surfaceContainerHighest: Color(4292732130),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209607),
      surfaceTint: Color(4278217315),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280713594),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281222980),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284512886),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281025885),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284381074),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245369),
      onSurface: Color(4279639324),
      onSurfaceVariant: Color(4282074435),
      outline: Color(4283916639),
      outlineVariant: Color(4285758843),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020977),
      inversePrimary: Color(4286698956),
      primaryFixed: Color(4280713594),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216545),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284512886),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282868062),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284381074),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282736248),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245369),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916147),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126631),
      surfaceContainerHighest: Color(4292732130),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200100),
      surfaceTint: Color(4278217315),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209607),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278986276),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281222980),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278592571),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281025885),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245369),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280034852),
      outline: Color(4282074435),
      outlineVariant: Color(4282074435),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020977),
      inversePrimary: Color(4289133554),
      primaryFixed: Color(4278209607),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203183),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281222980),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279775534),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281025885),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279447366),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245369),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916147),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126631),
      surfaceContainerHighest: Color(4292732130),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286698956),
      surfaceTint: Color(4286698956),
      onPrimary: Color(4278204211),
      primaryContainer: Color(4278210635),
      onPrimaryContainer: Color(4288541416),
      secondary: Color(4289842376),
      onSecondary: Color(4280038706),
      secondaryContainer: Color(4281486152),
      onSecondaryContainer: Color(4291619044),
      tertiary: Color(4289710567),
      onTertiary: Color(4279710282),
      tertiaryContainer: Color(4281289057),
      onTertiaryContainer: Color(4291814911),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112980),
      onSurface: Color(4292732130),
      onSurfaceVariant: Color(4290693574),
      outline: Color(4287206289),
      outlineVariant: Color(4282337607),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732130),
      inversePrimary: Color(4278217315),
      primaryFixed: Color(4288541416),
      onPrimaryFixed: Color(4278198301),
      primaryFixedDim: Color(4286698956),
      onPrimaryFixedVariant: Color(4278210635),
      secondaryFixed: Color(4291619044),
      onSecondaryFixed: Color(4278525725),
      secondaryFixedDim: Color(4289842376),
      onSecondaryFixedVariant: Color(4281486152),
      tertiaryFixed: Color(4291814911),
      onTertiaryFixed: Color(4278197555),
      tertiaryFixedDim: Color(4289710567),
      onTertiaryFixedVariant: Color(4281289057),
      surfaceDim: Color(4279112980),
      surfaceBright: Color(4281612857),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286962129),
      surfaceTint: Color(4286698956),
      onPrimary: Color(4278196760),
      primaryContainer: Color(4283014806),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290105548),
      onSecondary: Color(4278262296),
      secondaryContainer: Color(4286289554),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289973739),
      onTertiary: Color(4278196267),
      tertiaryContainer: Color(4286223279),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112980),
      onSurface: Color(4294376698),
      onSurfaceVariant: Color(4290956747),
      outline: Color(4288390563),
      outlineVariant: Color(4286285187),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732130),
      inversePrimary: Color(4278210892),
      primaryFixed: Color(4288541416),
      onPrimaryFixed: Color(4278195219),
      primaryFixedDim: Color(4286698956),
      onPrimaryFixedVariant: Color(4278206009),
      secondaryFixed: Color(4291619044),
      onSecondaryFixed: Color(4278195219),
      secondaryFixedDim: Color(4289842376),
      onSecondaryFixedVariant: Color(4280433464),
      tertiaryFixed: Color(4291814911),
      onTertiaryFixed: Color(4278194723),
      tertiaryFixedDim: Color(4289710567),
      onTertiaryFixedVariant: Color(4280170576),
      surfaceDim: Color(4279112980),
      surfaceBright: Color(4281612857),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293656571),
      surfaceTint: Color(4286698956),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4286962129),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293656571),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290105548),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294638335),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289973739),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112980),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294180346),
      outline: Color(4290956747),
      outlineVariant: Color(4290956747),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732130),
      inversePrimary: Color(4278202413),
      primaryFixed: Color(4288804589),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4286962129),
      onPrimaryFixedVariant: Color(4278196760),
      secondaryFixed: Color(4291882472),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290105548),
      onSecondaryFixedVariant: Color(4278262296),
      tertiaryFixed: Color(4292274687),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289973739),
      onTertiaryFixedVariant: Color(4278196267),
      surfaceDim: Color(4279112980),
      surfaceBright: Color(4281612857),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
