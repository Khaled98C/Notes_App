import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../remot/crudnew.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crudnew());
  }
}
