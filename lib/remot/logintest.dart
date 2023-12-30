
import '../Static/link.dart';
import 'crudnew.dart';

class LoginData {
  Crudnew cr;
  LoginData(this.cr);
  getdata(String name_user,String password_user ) async {
    var response = await cr.postdata(linklogin, {
       "name_user": name_user,
       "password_user": password_user,
    });

    return response.fold((l) => l, (r) => r);
  }
}
