part of open_map_weather_api;

int _unpackInt(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      final val = M[k];
      if (val.runtimeType == String) {
        try {
          return int.parse(M[k]);
        } catch (_) {
          return 0;
        }
      } else if (val.runtimeType == int) {
        return M[k];
      }
    }
  }
  return 0;
}

double _unpackDouble(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      final val = M[k];
      if (val.runtimeType == String) {
        try {
          return double.parse(M[k]);
        } catch (_) {
          return 0.0;
        }
      }
      if (val.runtimeType == int || val.runtimeType == double) {
        return M[k] + 0.0;
      }
    }
  }
  return 0.0;
}

String _unpackString(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      final val = M[k];
      if (val.runtimeType == String) {
        return M[k];
      }
    }
  }
  return "";
}

DateTime _unpackDate(Map<String, dynamic> M, String k) {
  if (M != null) {
    if (M.containsKey(k)) {
      final val = M[k];
      if (val.runtimeType == int || val.runtimeType == double) {
        int millis = M[k] * 1000;
        return DateTime.fromMillisecondsSinceEpoch(millis);
      }
    }
  }
  return null;
}

Temperature _unpackTemperature(Map<String, dynamic> M, String k) {
  double kelvin = _unpackDouble(M, k);
  if (kelvin != 0.0) {
    return Temperature(kelvin);
  }
  return Temperature(273.0);
}
