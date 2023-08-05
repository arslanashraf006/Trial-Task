class WeatherClass {
  String? status;
  Data? data;

  WeatherClass({this.status, this.data});

  WeatherClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? aqi;
  int? idx;
  List<Attributions>? attributions;
  City? city;
  String? dominentpol;
 // Iaqi? iaqi;
  Time? time;
  Forecast? forecast;
  Debug? debug;

  Data(
      {this.aqi,
        this.idx,
        this.attributions,
        this.city,
        this.dominentpol,
       // this.iaqi,
        this.time,
        this.forecast,
        this.debug});

  Data.fromJson(Map<String, dynamic> json) {
    aqi = json['aqi'];
    idx = json['idx'];
    if (json['attributions'] != null) {
      attributions = <Attributions>[];
      json['attributions'].forEach((v) {
        attributions!.add(Attributions.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    dominentpol = json['dominentpol'];
    //iaqi = json['iaqi'] != null ? Iaqi.fromJson(json['iaqi']) : null;
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
    debug = json['debug'] != null ? Debug.fromJson(json['debug']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aqi'] = aqi;
    data['idx'] = idx;
    if (attributions != null) {
      data['attributions'] = attributions!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['dominentpol'] = dominentpol;
    // if (iaqi != null) {
    //   data['iaqi'] = iaqi!.toJson();
    // }
    if (time != null) {
      data['time'] = time!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    if (debug != null) {
      data['debug'] = debug!.toJson();
    }
    return data;
  }
}

class Attributions {
  String? url;
  String? name;
  String? logo;

  Attributions({this.url, this.name, this.logo});

  Attributions.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}

class City {
  List<double>? geo;
  String? name;
  String? url;
  String? location;

  City({this.geo, this.name, this.url, this.location});

  City.fromJson(Map<String, dynamic> json) {
    geo = json['geo'].cast<double>();
    name = json['name'];
    url = json['url'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['geo'] = geo;
    data['name'] = name;
    data['url'] = url;
    data['location'] = location;
    return data;
  }
}

// class Iaqi {
//   Dew? dew;
//   Dew? h;
//   Dew? p;
//   O3? pm25;
//   Dew? t;
//   Dew? w;
//   Wg? wg;
//
//   Iaqi({this.dew, this.h, this.p, this.pm25, this.t, this.w, this.wg});
//
//   Iaqi.fromJson(Map<String, dynamic> json) {
//     dew = json['dew'] != null ? new Dew.fromJson(json['dew']) : null;
//     h = json['h'] != null ? new Dew.fromJson(json['h']) : null;
//     p = json['p'] != null ? new Dew.fromJson(json['p']) : null;
//     pm25 = json['pm25'] != null ? new O3.fromJson(json['pm25']) : null;
//     t = json['t'] != null ? new Dew.fromJson(json['t']) : null;
//     w = json['w'] != null ? new Dew.fromJson(json['w']) : null;
//     wg = json['wg'] != null ? new Wg.fromJson(json['wg']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dew != null) {
//       data['dew'] = this.dew!.toJson();
//     }
//     if (this.h != null) {
//       data['h'] = this.h!.toJson();
//     }
//     if (this.p != null) {
//       data['p'] = this.p!.toJson();
//     }
//     if (this.pm25 != null) {
//       data['pm25'] = this.pm25!.toJson();
//     }
//     if (this.t != null) {
//       data['t'] = this.t!.toJson();
//     }
//     if (this.w != null) {
//       data['w'] = this.w!.toJson();
//     }
//     if (this.wg != null) {
//       data['wg'] = this.wg!.toJson();
//     }
//     return data;
//   }
// }

// class Dew {
//   int? v;
//
//   Dew({this.v});
//
//   Dew.fromJson(Map<String, dynamic> json) {
//     v = json['v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['v'] = this.v;
//     return data;
//   }
// }

class Wg {
  double? v;

  Wg({this.v});

  Wg.fromJson(Map<String, dynamic> json) {
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['v'] = this.v;
    return data;
  }
}

class Time {
  String? s;
  String? tz;
  int? v;
  String? iso;

  Time({this.s, this.tz, this.v, this.iso});

  Time.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    tz = json['tz'];
    v = json['v'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['tz'] = this.tz;
    data['v'] = this.v;
    data['iso'] = this.iso;
    return data;
  }
}

class Forecast {
  Daily? daily;

  Forecast({this.daily});

  Forecast.fromJson(Map<String, dynamic> json) {
    daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.daily != null) {
      data['daily'] = this.daily!.toJson();
    }
    return data;
  }
}

class Daily {
  List<O3>? o3;
  // List<Pm10>? pm10;
  // List<Pm25>? pm25;

  Daily({this.o3,
    // this.pm10,
    // this.pm25
  });

  Daily.fromJson(Map<String, dynamic> json) {
    if (json['o3'] != null) {
      o3 = <O3>[];
      json['o3'].forEach((v) {
        o3!.add(new O3.fromJson(v));
      });
    }
    if (json['pm10'] != null) {
     // pm10 = <Pm10>[];
     //  json['pm10'].forEach((v) {
     //    pm10!.add(new Pm10.fromJson(v));
     //  });
    }
    if (json['pm25'] != null) {
      // pm25 = <Pm25>[];
      // json['pm25'].forEach((v) {
      //   pm25!.add(new Pm25.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.o3 != null) {
      data['o3'] = this.o3!.map((v) => v.toJson()).toList();
    }
    // if (this.pm10 != null) {
    //   data['pm10'] = this.pm10!.map((v) => v.toJson()).toList();
    // // }
    // if (this.pm25 != null) {
    //   data['pm25'] = this.pm25!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class O3 {
  int? avg;
  String? day;
  int? max;
  int? min;

  O3({this.avg, this.day, this.max, this.min});

  O3.fromJson(Map<String, dynamic> json) {
    avg = json['avg'];
    day = json['day'];
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avg'] = this.avg;
    data['day'] = this.day;
    data['max'] = this.max;
    data['min'] = this.min;
    return data;
  }
}

class Debug {
  String? sync;

  Debug({this.sync});

  Debug.fromJson(Map<String, dynamic> json) {
    sync = json['sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sync'] = this.sync;
    return data;
  }
}
