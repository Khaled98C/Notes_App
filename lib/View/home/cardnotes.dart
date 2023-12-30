import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flip_card/flip_card.dart';

import 'package:http/http.dart';

import '../../Model/Notes model.dart';

class Cardnotes extends StatelessWidget {
  Cardnotes({
    Key? key,
    required this.notemodel,
  }) : super(key: key);
  final NotesModels notemodel;

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}
