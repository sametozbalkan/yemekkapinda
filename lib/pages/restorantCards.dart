class restorantDetay {
  final int id;
  final double yildizSayisi;
  final String restorantIsmi, tanimlama, resim;

  restorantDetay(
      {required this.id,
        required this.yildizSayisi,
      required this.restorantIsmi,
      required this.tanimlama,
      required this.resim});

  factory restorantDetay.fromJson(Map<String, dynamic> json) => restorantDetay(
      id: json["id"],
      yildizSayisi: json["yildizSayisi"],
      restorantIsmi: json["restorantIsmi"],
      tanimlama: json["tanimlama"],
      resim: json["resim"],);

  Map<String, dynamic> toJson() => {
        "id": id,
        "yildizSayisi": yildizSayisi,
        "restorantIsmi": restorantIsmi,
        "tanimlama": tanimlama,
        "resim": resim,
      };
}
