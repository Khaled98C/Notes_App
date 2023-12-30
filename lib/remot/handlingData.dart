import 'package:get/get.dart';

import 'Statusrequest.dart';


handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
