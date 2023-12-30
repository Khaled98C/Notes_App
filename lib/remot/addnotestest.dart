import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Static/link.dart';
import 'crudnew.dart';

class Addnotedata {
  
  Crudnew cr;
  Addnotedata(this.cr);
  getdata(String notes_title, String notes_content, notes_user) async {
    var response = await cr.postdata(addnotes, {
      "notes_title": notes_title,
      "notes_content": notes_content,
      "notes_user": notes_user,
    });

    return response.fold((l) => l, (r) => r);
  }
}
