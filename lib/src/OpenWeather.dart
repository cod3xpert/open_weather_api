part of open_weather_api;

class OpenWeather {
  String _apiKey;
  Language language = Language.english;
  static const String CURRENT_WEATHER = 'weather';
  static const int STATUS_OK = 200;

  OpenWeather(this._apiKey, {this.language});

  Future<Weather> currentWeatherByLocation(
      double latitude, double longitude) async {
    try {
      Map<String, dynamic> currentWeather =
          await _sendRequest(CURRENT_WEATHER, lat: latitude, lon: longitude);
      return Weather(currentWeather);
    } catch (exception) {
      print(exception);
    }
    return null;
  }

  Future<Weather> currentWeatherByCityName(String cityName) async {
    try {
      Map<String, dynamic> currentWeather =
          await _sendRequest(CURRENT_WEATHER, cityName: cityName);
      return Weather(currentWeather);
    } catch (exception) {
      print(exception);
    }
    return null;
  }

  Future<Map<String, dynamic>> _sendRequest(String tag,
      {double lat, double lon, String cityName}) async {
    String url = _buildUrl(tag, cityName, lat, lon);

    http.Response response = await http.get(url);

    if (response.statusCode == STATUS_OK) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      return jsonBody;
    } else {
      throw APIException("The API threw an exception: ${response.body}");
    }
  }

  String _buildUrl(String tag, String cityName, double lat, double lon) {
    String url = 'https://api.openweathermap.org/data/2.5/' + '$tag?';

    if (cityName != null) {
      url += 'q=$cityName&';
    } else {
      url += 'lat=$lat&lon=$lon&';
    }

    url += 'appid=$_apiKey&';
    url += 'lang=${_languageCode[language]}';
    return url;
  }
}
