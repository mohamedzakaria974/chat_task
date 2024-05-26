import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  group('Bites icons should be', () {
    String iconsFontFamily = 'Bites';

    test('`BitesIcons.clock` ', () {
      var testData = BitesIcons.clock;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe800));
    });

    test('`BitesIcons.clean` ', () {
      var testData = BitesIcons.clean;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe802));
    });

    test('`BitesIcons.openEye` ', () {
      var testData = BitesIcons.openEye;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe803));
    });

    test('`BitesIcons.send` ', () {
      var testData = BitesIcons.send;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe804));
    });

    test('`BitesIcons.star` ', () {
      var testData = BitesIcons.star;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe805));
    });

    test('`BitesIcons.user` ', () {
      var testData = BitesIcons.user;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe808));
    });

    test('`BitesIcons.notification` ', () {
      var testData = BitesIcons.notification;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe811));
    });

    test('`BitesIcons.addPlus` ', () {
      var testData = BitesIcons.addPlus;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe812));
    });

    test('`BitesIcons.calendar` ', () {
      var testData = BitesIcons.calendar;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe813));
    });

    test('`BitesIcons.arrow` ', () {
      var testData = BitesIcons.arrow;
      expect(testData, isA<IconData>());
      expect(testData.fontFamily, equals(iconsFontFamily));
      expect(testData.codePoint, equals(0xe80a));
    });
  });
}
