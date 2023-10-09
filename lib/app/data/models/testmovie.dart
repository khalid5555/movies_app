/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Image {
  int? height;
  String? id;
  String? url;
  int? width;
  Image({this.height, this.id, this.url, this.width});
  Image.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }
}

class TestMovie {
  String? body;
  String? head;
  String? id;
  Image? image;
  String? link;
  DateTime? publishDateTime;
  Source? source;
  TestMovie(
      {this.body,
      this.head,
      this.id,
      this.image,
      this.link,
      this.publishDateTime,
      this.source});
  TestMovie.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    head = json['head'];
    id = json['id'];
    image = json['image'] != null ? Image?.fromJson(json['image']) : null;
    link = json['link'];
    publishDateTime = json['publishDateTime'];
    source = json['source'] != null ? Source?.fromJson(json['source']) : null;
  }
}

class Source {
  String? id;
  String? label;
  String? link;
  Source({this.id, this.label, this.link});
  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    link = json['link'];
  }
}
