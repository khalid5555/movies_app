// class MoviesModel {
//   MoviesModel({
//     this.title,
//     this.image,
//     this.details,
//   });
//   final String? title;
//   final String? image;
//   final String? details;
//   static MoviesModel fromJson(Map<String, dynamic> json) {
//     return MoviesModel(
//       title: json['title'],
//       image: json['image'],
//       details: json['details'],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'image': image,
//       'details': details,
//     };
//   }
// }
class MoviesModel {
  MoviesModel({
    this.title,
    this.imageUrl,
    this.details,
  });
  final String? title;
  final String? imageUrl;
  final String? details;
  static MoviesModel fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json['l'],
      imageUrl: json['imageUrl'],
      details: json['details'],
    );
  }
}

class SeriesModel {
  SeriesModel({
    this.title,
    this.image,
    this.details,
  });
  final String? title;
  final String? image;
  final String? details;
  static SeriesModel fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      title: json['title'],
      image: json['image'],
      details: json['details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'details': details,
    };
  }
}



/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class DMoviesModel {
    I? i;
    String? id;
    String? l;
    String? q;
    String? qid;
    int? rank;
    String? s;
    int? y;
    String? yr;

    DMoviesModel({this.i, this.id, this.l, this.q, this.qid, this.rank, this.s, this.y, this.yr}); 

    DMoviesModel.fromJson(Map<String, dynamic> json) {
        i = json['i'] != null ? I?.fromJson(json['i']) : null;
        id = json['id'];
        l = json['l'];
        q = json['q'];
        qid = json['qid'];
        rank = json['rank'];
        s = json['s'];
        y = json['y'];
        yr = json['yr'];
    }

}

class I {
    int? height;
    String? imageUrl;
    int? width;

    I({this.height, this.imageUrl, this.width}); 

    I.fromJson(Map<String, dynamic> json) {
        height = json['height'];
        imageUrl = json['imageUrl'];
        width = json['width'];
    }

}

// class Root {
//     List<DMoviesModel?>? d;
//     String? q;
//     int? v;

//     Root({this.d, this.q, this.v}); 

//     Root.fromJson(Map<String, dynamic> json) {
//         if (json['d'] != null) {
//          d = <D>[];
//          json['d'].forEach((v) {
//          d!.add(D.fromJson(v));
//         });
//       }
//         q = json['q'];
//         v = json['v'];
//     }

// }

