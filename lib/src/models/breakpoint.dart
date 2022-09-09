import 'package:adaptix/src/models/generic_switch.dart';
import 'package:adaptix/src/utils/comparable.dart';
import 'package:meta/meta.dart';

enum CanonicalResponsiveBreakpoint implements ResponsiveBreakpoint {
  xSmall(280, xSmallKey),
  small(320, smallKey),
  medium(414, mediumKey),
  tablet(720, tabletKey),
  desktop(1020, desktopKey);

  static const xSmallKey = 'xSmall';
  static const smallKey = 'small';
  static const mediumKey = 'medium';
  static const tabletKey = 'tablet';
  static const desktopKey = 'desktop';

  static const xSmallPixelScale = 1.0;
  static const smallPixelScale = 1.1;
  static const mediumPixelScale = 1.15;
  static const tabletPixelScale = 1.2;
  static const desktopPixelScale = 1.25;

  static GenericResponsiveSwitchArgs<T> createCanonicalSwitchArguments<T>({
    required T defaultValue,
    T? xSmall,
    T? small,
    T? medium,
    T? tablet,
    T? desktop,
  }) {
    return GenericResponsiveSwitchArgs<T>(
      defaultValue: defaultValue,
      rules: [
        GenericResponsiveRule(xSmallKey, xSmall ?? defaultValue),
        GenericResponsiveRule(smallKey, small ?? defaultValue),
        GenericResponsiveRule(mediumKey, medium ?? defaultValue),
        GenericResponsiveRule(tabletKey, tablet ?? defaultValue),
        GenericResponsiveRule(desktopKey, desktop ?? defaultValue)
      ],
    );
  }

  @visibleForTesting
  static const canonicalPixelScales = [
    xSmallPixelScale,
    smallPixelScale,
    mediumPixelScale,
    tabletPixelScale,
    desktopPixelScale,
  ];

  @visibleForTesting
  static const canonicalBreakpointKeys = [
    xSmallKey,
    smallKey,
    mediumKey,
    tabletKey,
    desktopKey
  ];

  static const canonicalPixelScaleRules = [
    GenericResponsiveRule(xSmallKey, xSmallPixelScale),
    GenericResponsiveRule(smallKey, smallPixelScale),
    GenericResponsiveRule(mediumKey, mediumPixelScale),
    GenericResponsiveRule(tabletKey, tabletPixelScale),
    GenericResponsiveRule(desktopKey, desktopPixelScale)
  ];

  static const canonicalRulesRaw = <String, double>{
    xSmallKey: xSmallPixelScale,
    smallKey: smallPixelScale,
    mediumKey: mediumPixelScale,
    tabletKey: tabletPixelScale,
    desktopKey: desktopPixelScale
  };

  @override
  final double value;

  @override
  final String key;

  @override
  bool isSameAs(ArgsComparisonMixin other) {
    return other is ResponsiveBreakpoint &&
        other.value == value &&
        other.key == key;
  }

  @override
  bool hasSameValueAs(ResponsiveBreakpoint other) => other.value == value;

  @override
  String get debugLabel => name;

  const CanonicalResponsiveBreakpoint(this.value, this.key);
}

@immutable
class ResponsiveBreakpoint with ArgsComparisonMixin {
  static const ResponsiveBreakpoint none =
      ResponsiveBreakpoint(value: 0, key: noneResponsiveBreakpointKey);

  static const noneResponsiveBreakpointKey = 'none';
  final double value;
  final String? debugLabel;
  final String key;

  const ResponsiveBreakpoint({
    required this.value,
    required this.key,
    this.debugLabel,
  });

  @override
  int get hashCode => Object.hashAll([value.hashCode, key.hashCode]);

  @override
  bool isSameAs(ArgsComparisonMixin other) {
    return other is ResponsiveBreakpoint &&
        other.value == value &&
        other.key == key;
  }

  @override
  bool operator ==(other) =>
      other is ResponsiveBreakpoint && hashCode == other.hashCode;

  bool hasSameValueAs(ResponsiveBreakpoint other) => other.value == value;
}
