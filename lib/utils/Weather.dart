class Weather {
  final String name;
  final double temp;
  final String mainWeather;
  final String description;
  final double humidity;
  final Object coord;

  Weather(
      {this.name,
      this.temp,
      this.mainWeather,
      this.description,
      this.humidity,
      this.coord});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        name: json['name'],
        temp: double.parse((json['main']['temp'] - 273.15).toStringAsFixed(2)),
        mainWeather: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        humidity: json['main']['temp'],
        coord: json['coord']);
  }
}
