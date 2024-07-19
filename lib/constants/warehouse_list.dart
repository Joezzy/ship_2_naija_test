import 'dart:convert';

import 'package:ship_to_naija/models/dropDownClass.dart';

List<DropDownClass> wareHouseList = dropDownClassFromJson(json.encode([
  {"caption": "Oshodi", "type": 'oshodi'},
  {"caption": "Ikorodu", "type": 'ikorodu'},
]));

List<DropDownClass> deliveryTypeList = dropDownClassFromJson(json.encode([
  {"caption": "International", "type": 'international'},
  {"caption": "Local", "type": 'local'},
]));

List<DropDownClass> idTypeList = dropDownClassFromJson(json.encode([
  {"caption": "Intl. Password", "type": 'int'},
  {"caption": "NIN", "type": 'nin'},
  {"caption": "Voter's card", "type": 'voters'},
]));
