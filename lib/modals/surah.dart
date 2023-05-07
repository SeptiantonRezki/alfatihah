part of './index.dart';

class Surah {
  String? name;
  NameTranslations? nameTranslations;
  int? numberOfAyah;
  int? numberOfSurah;
  String? place;
  List<Recitations>? recitations;
  String? type;
  List<Verses>? verses;

  Surah({this.name, this.nameTranslations, this.numberOfAyah, this.numberOfSurah, this.place, this.recitations, this.type, this.verses});

  Surah.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameTranslations = json['name_translations'] != null ? NameTranslations.fromJson(json['name_translations']) : null;
    numberOfAyah = json['number_of_ayah'];
    numberOfSurah = json['number_of_surah'];
    place = json['place'];
    if (json['recitations'] != null) {
      recitations = <Recitations>[];
      json['recitations'].forEach((v) {
        recitations!.add(Recitations.fromJson(v));
      });
    }
    type = json['type'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (nameTranslations != null) {
      data['name_translations'] = nameTranslations!.toJson();
    }
    data['number_of_ayah'] = numberOfAyah;
    data['number_of_surah'] = numberOfSurah;
    data['place'] = place;
    if (recitations != null) {
      data['recitations'] = recitations!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
