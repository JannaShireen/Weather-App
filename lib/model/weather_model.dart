class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var precipe;
  var last_update;

  Weather(
      {required this.cityName,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.wind_dir,
      required this.pressure,
      required this.precipe,
      required this.last_update,
      required this.gust,
      required this.uv});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    pressure = json['current']['precip_mm'];
    last_update = json['current']['last_updated'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
  }
}
