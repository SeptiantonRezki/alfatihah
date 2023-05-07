part of './index.dart';

class Recitations {
  String? name;
  String? audioUrl;

  Recitations({this.name, this.audioUrl});

  Recitations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    audioUrl = json['audio_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['audio_url'] = audioUrl;
    return data;
  }
}
