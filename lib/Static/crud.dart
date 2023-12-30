import 'package:http/http.dart' as http; //مشان اتعامل مع http
import 'dart:convert'; //مشان تحويل من جيسون لدارت

class Crud {
  postdata(String url, Map data) async {
    
      var response = await http.post(Uri.parse(url), body: data);
      var responsbody = jsonDecode(response.body);
     
      return responsbody;
  
  }
}
