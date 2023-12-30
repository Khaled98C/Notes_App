
import '../Static/link.dart';
import 'crudnew.dart';

class SingupData {
  Crudnew cr;
  SingupData(this.cr);
  getdata(String name_user,String password_user,String email_user,DateTime dateTime  ) async {
    var response = await cr.postdata(singup2, {
       "name_user": name_user,
       "email_user": email_user,
       "password_user": password_user,
        "Barthday": dateTime.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
