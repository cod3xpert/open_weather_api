part of open_map_weather_api;

class APIException implements Exception {
  String _cause;

  APIException(this._cause);

  String toString() => '${this.runtimeType} - $_cause';
}
