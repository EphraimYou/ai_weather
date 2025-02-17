class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localTimeEpoch;
  String? localTime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localTimeEpoch,
      this.localTime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = (json['lat'] as num?)?.toDouble();
    lon = (json['lon'] as num?)?.toDouble();
    tzId = json['tz_id'];
    localTimeEpoch = json['localtime_epoch'];
    localTime = json['localtime'];
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelsLikeC;
  double? feelsLikeF;
  double? windchillC;
  double? windchillF;
  double? heatIndexC;
  double? heatIndexF;
  double? dewPointC;
  double? dewPointF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelsLikeC,
    this.feelsLikeF,
    this.windchillC,
    this.windchillF,
    this.heatIndexC,
    this.heatIndexF,
    this.dewPointC,
    this.dewPointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = (json['temp_c'] as num?)?.toDouble();
    tempF = (json['temp_f'] as num?)?.toDouble();
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = (json['wind_mph'] as num?)?.toDouble();
    windKph = (json['wind_kph'] as num?)?.toDouble();
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = (json['pressure_mb'] as num?)?.toDouble();
    pressureIn = (json['pressure_in'] as num?)?.toDouble();
    precipMm = (json['precip_mm'] as num?)?.toDouble();
    precipIn = (json['precip_in'] as num?)?.toDouble();
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelsLikeC = (json['feelslike_c'] as num?)?.toDouble();
    feelsLikeF = (json['feelslike_f'] as num?)?.toDouble();
    windchillC = (json['windchill_c'] as num?)?.toDouble();
    windchillF = (json['windchill_f'] as num?)?.toDouble();
    heatIndexC = (json['heatindex_c'] as num?)?.toDouble();
    heatIndexF = (json['heatindex_f'] as num?)?.toDouble();
    dewPointC = (json['dewpoint_c'] as num?)?.toDouble();
    dewPointF = (json['dewpoint_f'] as num?)?.toDouble();
    visKm = (json['vis_km'] as num?)?.toDouble();
    visMiles = (json['vis_miles'] as num?)?.toDouble();
    uv = (json['uv'] as num?)?.toDouble();
    gustMph = (json['gust_mph'] as num?)?.toDouble();
    gustKph = (json['gust_kph'] as num?)?.toDouble();
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}

class Forecast {
  List<ForecastDay>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <ForecastDay>[];
      json['forecastday'].forEach(
        (v) {
          forecastday!.add(ForecastDay.fromJson(v));
        },
      );
    }
  }
}

class ForecastDay {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  ForecastDay({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  ForecastDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }
}

class Day {
  double? maxTempC;
  double? maxTempF;
  double? minTempC;
  double? minTempF;
  double? avgTempC;
  double? avgTempF;
  double? maxWindMph;
  double? maxWindKph;
  double? totalPrecipMm;
  double? totalPrecipIn;
  double? totalSnowCm;
  double? avgVisKm;
  double? avgVisMiles;
  int? avgHumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxTempC,
    this.maxTempF,
    this.minTempC,
    this.minTempF,
    this.avgTempC,
    this.avgTempF,
    this.maxWindMph,
    this.maxWindKph,
    this.totalPrecipMm,
    this.totalPrecipIn,
    this.totalSnowCm,
    this.avgVisKm,
    this.avgVisMiles,
    this.avgHumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  Day.fromJson(Map<String, dynamic> json) {
    maxTempC = (json['maxtemp_c'] as num?)?.toDouble();
    maxTempF = (json['maxtemp_f'] as num?)?.toDouble();
    minTempC = (json['mintemp_c'] as num?)?.toDouble();
    minTempF = (json['mintemp_f'] as num?)?.toDouble();
    avgTempC = (json['avgtemp_c'] as num?)?.toDouble();
    avgTempF = (json['avgtemp_f'] as num?)?.toDouble();
    maxWindMph = (json['maxwind_mph'] as num?)?.toDouble();
    maxWindKph = (json['maxwind_kph'] as num?)?.toDouble();
    totalPrecipMm = (json['totalprecip_mm'] as num?)?.toDouble();
    totalPrecipIn = (json['totalprecip_in'] as num?)?.toDouble();
    totalSnowCm = (json['totalsnow_cm'] as num?)?.toDouble();
    avgVisKm = (json['avgvis_km'] as num?)?.toDouble();
    avgVisMiles = (json['avgvis_miles'] as num?)?.toDouble();
    avgHumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    uv = (json['uv'] as num?)?.toDouble();
  }
}

class Hour {
  String? time;
  double? tempC;
  double? tempF;
  Condition? condition;

  Hour({this.time, this.tempC, this.tempF, this.condition});

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = (json['temp_c'] as num?)?.toDouble();
    tempF = (json['temp_f'] as num?)?.toDouble();
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }
}
