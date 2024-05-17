/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class City {
  var id;
  String? name;
  Coord? coord;
  String? country;
  var population;
  var timezone;
  var sunrise;
  var sunset;
  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});
  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord?.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Clouds {
  int? all;
  Clouds({this.all});
  Clouds.fromJson(Map<String, dynamic> json) {
    // all = json['all'];
  }
}

class Coord {
  var lat;
  var lon;
  Coord({this.lat, this.lon});
  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}

class Lista {
  var dt;
  Main? main;
  List<Weather?>? weather;
  Clouds? clouds;
  Wind? wind;
  var visibility;
  var pop;
  Sys? sys;
  String? dttxt;
  Lista(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dttxt});
  Lista.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main?.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds?.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind?.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? Sys?.fromJson(json['sys']) : null;
    dttxt = json['dt_txt'];
  }
}

class Main {
  var temp;
  var feelslike;
  var tempmin;
  var tempmax;
  var pressure;
  var sealevel;
  var grndlevel;
  var humidity;
  var tempkf;
  Main(
      {this.temp,
      this.feelslike,
      this.tempmin,
      this.tempmax,
      this.pressure,
      this.sealevel,
      this.grndlevel,
      this.humidity,
      this.tempkf});
  Main.fromJson(Map<String, dynamic> json) {
    // temp = json['temp'].toInt();
    if (json['temp'].runtimeType == double) {
      temp = json['temp'].toInt();
    } else {
      temp = json['temp'];
    }
    feelslike = json['feels_like'];
    tempmin = json['temp_min'];
    tempmax = json['temp_max'];
    pressure = json['pressure'];
    sealevel = json['sea_level'];
    grndlevel = json['grnd_level'];
    humidity = json['humidity'];
    tempkf = json['temp_kf'];
  }
}

class Root {
  String? cod;
  var message;
  var cnt;
  List<Lista?>? list;
  City? city;
  Root({this.cod, this.message, this.cnt, this.list, this.city});
  Root.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Lista>[];
      json['list'].forEach((v) {
        list!.add(Lista.fromJson(v));
      });
    }
    city = json['city'] != null ? City?.fromJson(json['city']) : null;
  }
}

class Sys {
  String? pod;
  Sys({this.pod});
  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

class Weather {
  var id;
  String? main;
  String? description;
  String? icon;
  Weather({this.id, this.main, this.description, this.icon});
  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Wind {
  var speed;
  var deg;
  var gust;
  Wind({this.speed, this.deg, this.gust});
  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}
/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;
  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});
  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord?.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
class Clouds {
  int? all;
  Clouds({this.all});
  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}
class Coord {
  double? lat;
  double? lon;
  Coord({this.lat, this.lon});
  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
class Lista {
  int? dt;
  Main? main;
  List<Weather?>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  int? pop;
  Sys? sys;
  String? dttxt;
  Lista(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dttxt});
  Lista.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main?.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds?.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind?.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? Sys?.fromJson(json['sys']) : null;
    dttxt = json['dt_txt'];
  }
}
class Main {
  double? temp;
  double? feelslike;
  double? tempmin;
  double? tempmax;
  int? pressure;
  int? sealevel;
  int? grndlevel;
  int? humidity;
  double? tempkf;
  Main(
      {this.temp,
      this.feelslike,
      this.tempmin,
      this.tempmax,
      this.pressure,
      this.sealevel,
      this.grndlevel,
      this.humidity,
      this.tempkf});
  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelslike = json['feels_like'];
    tempmin = json['temp_min'];
    tempmax = json['temp_max'];
    pressure = json['pressure'];
    sealevel = json['sea_level'];
    grndlevel = json['grnd_level'];
    humidity = json['humidity'];
    tempkf = json['temp_kf'];
  }
}
class Root {
  String? cod;
  int? message;
  int? cnt;
  List<Lista?>? list;
  City? city;
  Root({this.cod, this.message, this.cnt, this.list, this.city});
  Root.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Lista>[];
      json['list'].forEach((v) {
        list!.add(Lista.fromJson(v));
      });
    }
    city = json['city'] != null ? City?.fromJson(json['city']) : null;
  }
}
class Sys {
  String? pod;
  Sys({this.pod});
  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;
  Weather({this.id, this.main, this.description, this.icon});
  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}
class Wind {
  double? speed;
  int? deg;
  double? gust;
  Wind({this.speed, this.deg, this.gust});
  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}
*/
