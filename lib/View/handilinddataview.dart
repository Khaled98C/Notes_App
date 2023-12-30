import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../remot/Statusrequest.dart';

class HandilingdataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandilingdataView({Key? key,required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(child: Center(child: Lottie.asset("lot/loading.json"),  ))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child:Lottie.asset("lot/offline.json"))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset("lot/Error.json"),)
                : statusRequest == StatusRequest.Nodata
                    ? Center(child: Lottie.asset("lot/nodata.json"))
                    : widget;
  }
}
