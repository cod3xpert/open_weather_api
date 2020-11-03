# open_weather_api

A new Flutter package project for Fetching weather information.

## Getting Started

```dart
import 'package:open_weather_api/open_weather_api.dart';
```

## Add your api key

If you don't have one, you can get api key by creating account on [openweathermap.org](https://home.openweathermap.org/users/sign_up)

```dart
OpenWeather openWeather = OpenWeather("YOUR API KEY");
```

## Get weather by city name

```dart
Weather weather = await _openWeather.currentWeatherByCityName(cityName: 'cityName');
```

## Get weather by location ( longitude and latitude )

```dart
Weather weather = await _openWeather.currentWeatherByLocation(latitude: 'latitude', longitude: 'longitude');
```
