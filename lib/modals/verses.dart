part of './index.dart';

class Verses {
  int? number;
  String? text;
  String? translationEn;
  String? translationId;

  Verses({this.number, this.text, this.translationEn, this.translationId});

  Verses.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    translationEn = json['translation_en'];
    translationId = json['translation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['text'] = text;
    data['translation_en'] = translationEn;
    data['translation_id'] = translationId;
    return data;
  }
}
