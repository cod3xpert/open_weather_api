import 'package:flutter_test/flutter_test.dart';
import 'package:open_map_weather_api/open_map_weather_api.dart';
import 'mockAPI.dart';

void main() {
  final res = Weather(MockAPI.mockResData);
  final testRes = Weather(MockAPI.mockTestResData);
  group('weatherDescription tests', () {
    test('pass str into str', () {
      expect(res.weatherDescription, 'smoke');
    });
    test('pass int into str', () {
      expect(testRes.weatherDescription, '');
    });
  });

  group('weatherConditionCode tests', () {
    test('pass int into int', () {
      expect(res.weatherConditionCode, 711);
    });
    test('pass str into int', () {
      expect(testRes.weatherConditionCode, 0);
    });
  });

  group('cloudiness tests', () {
    test('pass double into double', () {
      expect(res.cloudiness, 20.0);
    });
    test('pass str into double', () {
      expect(testRes.cloudiness, 0.0);
    });
  });

  group('Temperature tests', () {
    test('pass Temperature into Temperature', () {
      expect(res.temperature.toString(), Temperature(303.66).toString());
    });
    test('pass str into Temperature', () {
      expect(testRes.temperature.toString(), Temperature(273.0).toString());
    });
  });

  group('date tests', () {
    test('pass Date into Date', () {
      expect(res.date, DateTime.fromMillisecondsSinceEpoch(1604378832 * 1000));
    });
    test('pass str into Date', () {
      expect(testRes.date, null);
    });
  });
}
