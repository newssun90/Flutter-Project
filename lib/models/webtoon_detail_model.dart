class WebtoonDetailModel {
  final String about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
