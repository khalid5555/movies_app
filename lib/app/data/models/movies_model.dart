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

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class SeriesModel {
  String? backdroppath;
  String? firstairdate;
  int? id;
  String? name;
  List<String?>? origincountry;
  String? originallanguage;
  String? originalname;
  String? overview;
  double? popularity;
  String? posterpath;
  double? voteaverage;
  int? votecount;
  SeriesModel(
      {this.backdroppath,
      this.firstairdate,
      this.id,
      this.name,
      this.origincountry,
      this.originallanguage,
      this.originalname,
      this.overview,
      this.popularity,
      this.posterpath,
      this.voteaverage,
      this.votecount});
  SeriesModel.fromJson(Map<String, dynamic> json) {
    backdroppath = json['backdrop_path'];
    firstairdate = json['first_air_date'];
    id = json['id'] ?? '';
    name = json['name'];
    if (json['origin_country'] != null) {
      origincountry = <String>[];
      json['origin_country'].forEach((v) {
        origincountry!.add(v);
      });
    }
    originallanguage = json['original_language'];
    originalname = json['original_name'] ?? '';
    overview = json['overview'] ?? '';
    popularity = json['popularity'] ?? '';
    posterpath = json['poster_path'] ?? '';
    voteaverage = json['vote_average'].toDouble() ?? "";
    votecount = json['vote_count'] ?? '';
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class FinalMoviesModel {
  bool? adult;
  String? backdroppath;
  int? id;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  String? mediatype;
  String? releasedate;
  String? title;
  bool? video;
  double? voteaverage;
  int? votecount;
  FinalMoviesModel(
      {this.adult,
      this.backdroppath,
      this.id,
      this.originallanguage,
      this.originaltitle,
      this.overview,
      this.popularity,
      this.posterpath,
      this.mediatype,
      this.releasedate,
      this.title,
      this.video,
      this.voteaverage,
      this.votecount});
  FinalMoviesModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    id = json['id'] ?? "";
    originallanguage = json['original_language'];
    originaltitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] ?? "";
    posterpath = json['poster_path'] ?? "";
    mediatype = json['media_type'] ?? "";
    releasedate = json['release_date'];
    title = json['title'] ?? '';
    video = json['video'] ?? '';
    voteaverage = json['vote_average'] != null
        ? double.tryParse(json['vote_average'].toString()) ?? 0.0
        : 0.0;
    votecount = json['vote_count'] ?? "";
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class SearchModel {
  bool? adult;
  String? backdroppath;
  int? id;
  String? name;
  String? originallanguage;
  String? originalname;
  String? originalTitle;
  String? overview;
  String? posterpath;
  String? mediatype;
  double? popularity;
  String? firstairdate;
  String? releasedate;
  double? voteaverage;
  int? votecount;
  List<String?>? origincountry;
  SearchModel({
    this.adult,
    this.backdroppath,
    this.id,
    this.name,
    this.originallanguage,
    this.originalname,
    this.originalTitle,
    this.overview,
    this.posterpath,
    this.mediatype,
    this.popularity,
    this.firstairdate,
    this.releasedate,
    this.voteaverage,
    this.votecount,
    this.origincountry,
  });
  SearchModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originallanguage = json['original_language'];
    originalname = json['original_name'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterpath = json['poster_path'];
    mediatype = json['media_type'];
    popularity = json['popularity'];
    firstairdate = json['first_air_date'];
    releasedate = json['release_date'];
    voteaverage = json['vote_average'];
    votecount = json['vote_count'];
    if (json['origin_country'] != null) {
      origincountry = <String>[];
      json['origin_country'].forEach((v) {
        origincountry!.add(v);
      });
    }
  }
}

/* class SearchSeriesModel {
    SearchSeriesModel({
        this.adult,
        this.backdropPath,
        this.id,
        this.name,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.firstAirDate,
        this.voteAverage,
        this.voteCount,
        this.originCountry,
        this.title,
        this.originalTitle,
        this.releaseDate,
        this.video,
        this.gender,
        this.knownForDepartment,
        this.profilePath,
        this.knownFor,
    });
    bool adult;
    String backdropPath;
    int id;
    String name;
    OriginalLanguage originalLanguage;
    String originalName;
    String overview;
    String posterPath;
    MediaType mediaType;
    List<int> genreIds;
    double popularity;
    DateTime firstAirDate;
    double voteAverage;
    int voteCount;
    List<String> originCountry;
    String title;
    String originalTitle;
    String releaseDate;
    bool video;
    int gender;
    String knownForDepartment;
    dynamic profilePath;
    List<KnownFor> knownFor;
}
class KnownFor {
    KnownFor({
        this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
    });
    bool adult;
    String backdropPath;
    int id;
    String title;
    String originalLanguage;
    String originalTitle;
    String overview;
    String posterPath;
    MediaType mediaType;
    List<int> genreIds;
    double popularity;
    DateTime releaseDate;
    bool video;
    int voteAverage;
    int voteCount;
}
enum MediaType { TV, MOVIE, PERSON }
enum OriginalLanguage { EN, JA }
 */
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
  DMoviesModel(
      {this.i,
      this.id,
      this.l,
      this.q,
      this.qid,
      this.rank,
      this.s,
      this.y,
      this.yr});
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
class search2model {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  search2model({this.page, this.results, this.totalPages, this.totalResults});
  search2model.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

// how to search in query in site tmdb in flutter and how change to next page
class Results {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  String? firstAirDate;
  List<String>? originCountry;
  int? gender;
  String? knownForDepartment;
  String? profilePath;
  List<KnownFor>? knownFor;
  Results(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.name,
      this.originalName,
      this.firstAirDate,
      this.originCountry,
      this.gender,
      this.knownForDepartment,
      this.profilePath,
      this.knownFor});
  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    name = json['name'];
    originalName = json['original_name'];
    firstAirDate = json['first_air_date'];
    originCountry = json['origin_country'].cast<String>();
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(KnownFor.fromJson(v));
      });
    }
  }
}

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class KnownFor {
  bool? adult;
  String? backdroppath;
  List<int?>? genreids;
  int? id;
  String? mediatype;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  String? posterpath;
  String? releasedate;
  String? title;
  bool? video;
  double? voteaverage;
  int? votecount;
  String? firstairdate;
  String? name;
  List<String?>? origincountry;
  String? originalname;
  KnownFor(
      {this.adult,
      this.backdroppath,
      this.genreids,
      this.id,
      this.mediatype,
      this.originallanguage,
      this.originaltitle,
      this.overview,
      this.posterpath,
      this.releasedate,
      this.title,
      this.video,
      this.voteaverage,
      this.votecount,
      this.firstairdate,
      this.name,
      this.origincountry,
      this.originalname});
  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    id = json['id'];
    mediatype = json['media_type'];
    originallanguage = json['original_language'];
    originaltitle = json['original_title'];
    overview = json['overview'];
    posterpath = json['poster_path'];
    releasedate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteaverage = json['vote_average'] != null
        ? double.tryParse(json['vote_average'].toString()) ?? 0.0
        : 0.0;
    votecount = json['vote_count'];
    firstairdate = json['first_air_date'];
    name = json['name'];
    originalname = json['original_name'];
  }
}

class FinalMoviesModelTest {
  bool? adult;
  String? backdroppath;
  int? id;
  String? title;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  String? posterpath;
  String? mediatype;
  double? popularity;
  String? releasedate;
  bool? video;
  double? voteaverage;
  int? votecount;
  List<KnownFor?>? knownfor;
  String? knownfordepartment;
  // String? name;
  String? originalname;
  // String? firstairdate;
  FinalMoviesModelTest({
    this.adult,
    this.backdroppath,
    this.id,
    this.title,
    this.originallanguage,
    this.originaltitle,
    this.overview,
    this.posterpath,
    this.mediatype,
    this.popularity,
    this.releasedate,
    this.video,
    this.knownfordepartment,
    this.knownfor,
    this.voteaverage,
    this.votecount,
    // this.name,
    this.originalname,
    // this.firstairdate,
  });
  FinalMoviesModelTest.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];
    id = json['id'];
    if (json['title'] != null) {
      title = json['title'];
    } else {
      title = json['name'];
    }
    // name = json['name'];
    if (json['known_for'] != null) {
      knownfor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownfor!.add(KnownFor.fromJson(v));
      });
    }
    knownfordepartment = json['known_for_department'];
    if (knownfor != null &&
        knownfor!.isNotEmpty &&
        knownfor!.first != null &&
        knownfor!.first!.originallanguage != null) {
      originallanguage = knownfor!.first!.originallanguage;
    } else {
      originallanguage = json['original_language'];
    }
    // originallanguage = json['original_language'];
    originaltitle = json['original_title'];
    if (knownfor != null &&
        knownfor!.isNotEmpty &&
        knownfor!.first != null &&
        knownfor!.first!.overview != null) {
      overview = knownfor!.first!.overview;
    } else {
      overview = json['overview'];
    }
    // overview = json['overview'];
    if (json['poster_path'] != null) {
      posterpath = json['poster_path'];
    } else {
      posterpath = json['profile_path'];
    }
    if (json['media_type'] != null) {
      mediatype = json['media_type'];
    } else {
      mediatype = json['media_type'];
    }
    // mediatype = json['media_type'] ?? '';
    popularity = json['popularity'] ?? '';
    if (json['release_date'] != null) {
      releasedate = json['release_date'];
    } else if (knownfor != null &&
        knownfor!.isNotEmpty &&
        knownfor!.first != null &&
        knownfor!.first!.releasedate != null) {
      releasedate = knownfor!.first!.releasedate;
    } else {
      releasedate = json['first_air_date'];
    }
    if (knownfor != null &&
        knownfor!.isNotEmpty &&
        knownfor!.first != null &&
        knownfor!.first!.voteaverage != null) {
      voteaverage =
          double.tryParse(knownfor!.first!.voteaverage.toString()) ?? 0.0;
    } else {
      voteaverage = json['vote_average'] != null
          ? double.tryParse(json['vote_average'].toString()) ?? 0.0
          : 0.0;
    }
    video = json['video'];
    // voteaverage = json['vote_average'] != null
    //     ? double.tryParse(json['vote_average'].toString()) ?? 0.0
    //     : 0.0;
    if (knownfor != null &&
        knownfor!.isNotEmpty &&
        knownfor!.first != null &&
        knownfor!.first!.votecount != null) {
      votecount = knownfor!.first!.votecount;
    } else {
      votecount = json['vote_count'];
    }
    // votecount = json['vote_count'];
    originalname = json['original_name'];
    // firstairdate = json['first_air_date'];
  }
}

class Root {
  int? page;
  List<FinalMoviesModelTest?>? results;
  int? totalpages;
  int? totalresults;
  Root({this.page, this.results, this.totalpages, this.totalresults});
  Root.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <FinalMoviesModelTest>[];
      json['results'].forEach((v) {
        results!.add(FinalMoviesModelTest.fromJson(v));
      });
    }
    totalpages = json['total_pages'];
    totalresults = json['total_results'];
  }
}
