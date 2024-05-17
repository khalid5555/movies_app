/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? articleUrl;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  NewsModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.articleUrl,
      this.urlToImage,
      this.publishedAt,
      this.content});
  NewsModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source?.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    articleUrl = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = DateTime.tryParse(json['publishedAt']);
    content = json['content'];
  }
  /*  Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['source'] = source!.toJson();
        data['author'] = author;
        data['title'] = title;
        data['description'] = description;
        data['url'] = url;
        data['urlToImage'] = urlToImage;
        data['publishedAt'] = publishedAt;
        data['content'] = content;
        return data;
    } */
}

class Source {
  String? id;
  String? name;
  Source({this.id, this.name});
  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  /*  Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        return data;
    } */
}
