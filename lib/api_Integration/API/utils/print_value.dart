import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

void printValue(dynamic value, {String tag = ""}) {
  try {
    var decodedJSON = jsonDecode(value.toString()) as Map<String, dynamic>;
    log("JSON Output ($tag): ${JsonEncoder.withIndent('    ').convert(decodedJSON)}\n");
  } catch (_) {
    if (value is Map) {
      log("JSON Output ($tag): ${JsonEncoder.withIndent('    ').convert(value)}\n");
    } else {
      if (kDebugMode) {
        print("Print Output: $tag $value \n\n");
      }
    }
  }
}
