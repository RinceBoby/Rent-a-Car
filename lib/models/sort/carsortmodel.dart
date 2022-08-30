class SortModel {
  String? place;

  SortModel({this.place});

  SortModel.fromJson(Map<String, dynamic> json) {
    place = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['place'] = this.place;
    return data;
  }
}