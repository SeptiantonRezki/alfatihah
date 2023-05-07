part of './index.dart';

class NameTranslations {
  String? ar;
  String? en;
  String? id;

  NameTranslations({this.ar, this.en, this.id});

  NameTranslations.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    data['id'] = id;
    return data;
  }
}
