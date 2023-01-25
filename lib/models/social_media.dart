class SocialMedia {
  String? name;
  String? title;
  String? link;

  SocialMedia({this.name, this.title, this.link});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title'] = title;
    data['link'] = link;
    return data;
  }
}
