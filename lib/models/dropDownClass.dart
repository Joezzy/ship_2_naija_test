import 'dart:convert';

List<DropDownClass> dropDownClassFromJson(String str) =>
    List<DropDownClass>.from(
        json.decode(str).map((x) => DropDownClass.fromJson(x)));

String dropDownClassToJson(List<DropDownClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DropDownClass {
  DropDownClass({
    this.caption,
    this.type,
    this.others,
  });

  String? caption;
  String? type;
  String? others;

  factory DropDownClass.fromJson(Map<String, dynamic> json) => DropDownClass(
        caption: json["caption"],
        type: json["type"],
        others: json["others"],
      );

  Map<String, dynamic> toJson() =>
      {"caption": caption, "type": type, "others": others};
}
