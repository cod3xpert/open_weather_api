import 'package:flutter/material.dart';
import 'package:open_weather_api/open_weather_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Loading { NOT_LOADING, LOADING, LOADED }

class _MyAppState extends State<MyApp> {
  String _key = 'API KEY';
  OpenWeather _openWeather;
  List<Weather> _data = [];
  Loading _state = Loading.NOT_LOADING;
  double _lat, _lon;
  String _cityName;

  @override
  void initState() {
    super.initState();
    _openWeather = new OpenWeather(_key);
  }

  void queryWeather() async {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = Loading.LOADING;
    });

    Weather weather = await _openWeather.currentWeatherByCityName(_cityName);
    setState(() {
      _data = [weather];
      _state = Loading.LOADED;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Open Weather App'),
        ),
        body: Column(
          children: <Widget>[
            _coordinateInputs(),
            _buttons(),
            Text(
              'Output:',
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            Expanded(child: _resultView())
          ],
        ),
      ),
    );
  }

  void _saveCity(String input) {
    _cityName = input;
  }

  void _saveLat(String input) {
    _lat = double.tryParse(input);
  }

  void _saveLon(String input) {
    _lon = double.tryParse(input);
  }

  Widget _coordinateInputs() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter city name'),
                keyboardType: TextInputType.text,
                onChanged: _saveCity,
                onSubmitted: _saveCity),
          ),
        ),
        // Expanded(
        //   child: Container(
        //     margin: EdgeInsets.all(5),
        //     child: TextField(
        //         decoration: InputDecoration(
        //             border: OutlineInputBorder(), hintText: 'Enter longitude'),
        //         keyboardType: TextInputType.number,
        //         onChanged: _saveLon,
        //         onSubmitted: _saveLon),
        //   ),
        // ),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: FlatButton(
            child: Text(
              'Fetch weather',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: queryWeather,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _resultView() => _state == Loading.LOADED
      ? contentFinishedDownload()
      : _state == Loading.LOADING
          ? contentDownloading()
          : contentNotDownloaded();

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index].toString()),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget contentDownloading() {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(children: [
          Text(
            'Fetching Weather...',
            style: TextStyle(fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
        ]));
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press the button to download the Weather forecast',
          ),
        ],
      ),
    );
  }
}
