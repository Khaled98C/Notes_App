
import '../Static/link.dart';
import 'crudnew.dart';

class Testdata {
  Crudnew cr;
  Testdata(this.cr);
  getdata(String id_user) async {
    var response = await cr.postdata(home, { "id_user":  id_user});

    return response.fold((l) => l, (r) => r);
  }
}
