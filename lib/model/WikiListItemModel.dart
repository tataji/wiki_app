class WikiListItemModel {
  String title;
  String imageUrl;
  String description;
  WikiListItemModel({
    this.imageUrl,
    this.title,
    this.description,
  });
  String get getTitle {
    return title;
  }
  set setTitle (String name) {
    this.title = name;
  }
  String get getImageUrl {
    return imageUrl;
  }
  set setImageUrl (String name) {
    this.imageUrl = name;
  }
  String get getDescription {
    return description;
  }
  set setDescription (String name) {
    this.description = name;
  }
  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['title'] = title;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }
}