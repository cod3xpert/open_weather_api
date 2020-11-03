import 'package:flutter_test/flutter_test.dart';
import './mockAPI.dart';

void main() {
  test('build url for cityname', () {
    var result = MockAPI.buildUrl('mumbai', null, null);
    expect(result,
        'https://api.openweathermap.org/data/2.5/weather?q=mumbai&appid=123&lang=en');
  });

  test('build url for lat and lon', () {
    var result = MockAPI.buildUrl(null, 1.0, 1.0);
    expect(result,
        'https://api.openweathermap.org/data/2.5/weather?lat=1.0&lon=1.0&appid=123&lang=en');
  });
}
