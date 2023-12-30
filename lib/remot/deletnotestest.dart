import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Static/link.dart';
import 'crudnew.dart';

class deletnotesdata {
  
  Crudnew cr;
  deletnotesdata(this.cr);
  getdata( notesid) async {
    var response = await cr.postdata(deletnotes, {
      "notes_id":notesid

    });

    return response.fold((l) => l, (r) => r);
  }
}
