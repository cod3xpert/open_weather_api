part of open_map_weather_api;

int _unpackInt(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      final val = M[k];
      if (val.runtimeType == String) {
        return int.parse(M[k]) ?? -1;
      } else if (val.runtimeType == int) {
        return M[k];
      }
      return -1;
    }
  }
  return 0;
}

double _unpackDouble(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      return M[k] + 0.0;
    }
  }
  return 0.0;
}

String _unpackString(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      return M[k];
    }
  }
  return "";
}

DateTime _unpackDate(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      int millis = M[k] * 1000;
      return DateTime.fromMillisecondsSinceEpoch(millis);
    }
  }
  return null;
}

Temperature _unpackTemperature(Map<String, dynamic> M, String k) {
  double kelvin = _unpackDouble(M, k);
  return Temperature(kelvin);
}
