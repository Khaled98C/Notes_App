import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Static/link.dart';
import 'crudnew.dart';

class Editnotesdata {
  
  Crudnew cr;
  Editnotesdata(this.cr);
  getdata(String notes_title, String notes_content, notes_id) async {
    var response = await cr.postdata(editnotes, {
      "notes_title": notes_title,
      "notes_content": notes_content,
      "notes_id": notes_id,
    });

    return response.fold((l) => l, (r) => r);
  }
}
