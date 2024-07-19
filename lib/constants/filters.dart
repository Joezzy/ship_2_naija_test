import 'dart:convert';

import 'package:ship_to_naija/models/dropDownClass.dart';

List<DropDownClass> shipmentFilterList = dropDownClassFromJson(json.encode([
  {"caption": "Pending", "type": "pending"},
  {"caption": "Shipped", "type": 'shipped'},
  {"caption": "Delivered", "type": 'delivered'},
  {"caption": "Returned", "type": 'returned'},
  {"caption": "Cancelled", "type": 'cancelled'},
  {"caption": "All", "type": 'all'}
]));

List<DropDownClass> sortFilter = dropDownClassFromJson(json.encode([
  {"caption": "Ascending", "type": "ascending"},
  {"caption": "Descending", "type": "descending"},
]));
