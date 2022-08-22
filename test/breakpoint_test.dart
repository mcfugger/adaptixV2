import 'package:adaptix/src/models/breakpoint.dart';
import 'package:adaptix/src/extensions/breakpoint.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing breakpoint equality', () {
    const breakpoint = ResponsiveBreakpoint(value: 120, key: 'mobile');
    const same = ResponsiveBreakpoint(value: 120, key: 'mobile');
    const valueDiffers = ResponsiveBreakpoint(value: 121, key: 'mobile');
    const keyDiffers = ResponsiveBreakpoint(value: 120, key: 'tablet');
    const bothDiffers = ResponsiveBreakpoint(value: 121, key: 'tablet');
    expect(breakpoint.isSameAs(valueDiffers), false);
    expect(breakpoint.isSameAs(same), true);
    expect(breakpoint.isSameAs(keyDiffers), false);
    expect(breakpoint.isSameAs(bothDiffers), false);
  });

  test('Test transequality between canonical breakpoint and non-canonical', () {
    final nonCanonical = ResponsiveBreakpoint(
        value: CanonicalResponsiveBreakpoint.small.value,
        key: CanonicalResponsiveBreakpoint.small.key);
    expect(nonCanonical.isSameAs(CanonicalResponsiveBreakpoint.small), true);
  });

  test('Must return only unique elements from iterable', () {
    final breakpoints = [
      const ResponsiveBreakpoint(value: 120, key: 'mobile'),
      const ResponsiveBreakpoint(value: 120, key: 'mobile'),
      const ResponsiveBreakpoint(value: 120, key: 'mobile1'),
      const ResponsiveBreakpoint(value: 121, key: 'mobile'),
      ResponsiveBreakpoint(
          value: CanonicalResponsiveBreakpoint.small.value,
          key: CanonicalResponsiveBreakpoint.small.key),
      CanonicalResponsiveBreakpoint.small
    ].iterableRemoveSame();
    expect(breakpoints.length, 3);
  });
}
