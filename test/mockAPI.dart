class MockAPI {
  static final api = '123';
  static final language = 'en';

  static Map<String, dynamic> mockResData = {
    'coord': {'lon': 72.85, 'lat': 19.01},
    'weather': [
      {'id': 711, 'main': "Smoke", 'description': "smoke", 'icon': "50d"}
    ],
    'base': "stations",
    'main': {
      'temp': 303.66,
      'feels_like': 303.96,
      'temp_min': 303.15,
      'temp_max': 304.15,
      'pressure': 1013,
      'humidity': 45
    },
    'visibility': 2500,
    'wind': {'speed': 3.1, 'deg': 110},
    'clouds': {'all': 20},
    'dt': 1604378832,
    'sys': {
      'type': 1,
      'id': 9052,
      'country': "IN",
      'sunrise': 1604365792,
      'sunset': 1604406863
    },
    'timezone': 19800,
    'id': 1275339,
    'name': "Mumbai",
    'cod': 200
  };
  static Map<String, dynamic> mockTestResData = {
    'coord': {'lon': 72.85, 'lat': 19.01},
    'weather': [
      {'id': 'some', 'main': "Smoke", 'description': 123, 'icon': "50d"}
    ],
    'base': "stations",
    'main': {
      'temp': 'some',
      'feels_like': 303.96,
      'temp_min': 303.15,
      'temp_max': 304.15,
      'pressure': 1013,
      'humidity': 45
    },
    'visibility': 2500,
    'wind': {'speed': 3.1, 'deg': 110},
    'clouds': {'all': 'sos'},
    'dt': 'some',
    'sys': {
      'type': 1,
      'id': 9052,
      'country': "IN",
      'sunrise': 1604365792,
      'sunset': 1604406863
    },
    'timezone': 19800,
    'id': 1275339,
    'name': "Mumbai",
    'cod': 200
  };

  static String buildUrl(String cityName, double lat, double lon) {
    String url = 'https://api.openweathermap.org/data/2.5/weather?';

    if (cityName != null) {
      url += 'q=$cityName&';
    } else {
      url += 'lat=$lat&lon=$lon&';
    }

    url += 'appid=$api&';
    url += 'lang=$language';
    return url;
  }
}
