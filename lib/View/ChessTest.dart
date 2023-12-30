import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:get/get.dart';

class ChessTest extends StatefulWidget {
  const ChessTest({Key? key}) : super(key: key);

  @override
  _ChessTestState createState() => _ChessTestState();
}

class _ChessTestState extends State<ChessTest> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Test'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              height: Get.height,
              child: Center(
                child: ListView(reverse: false, children: [
                  ChessBoard(
                    onMove: () {
                      print(controller.getMoveCount());
                    },
                    controller: controller,
                    boardColor: BoardColor.orange,
                    arrows: [
                      BoardArrow(
                        from: 'd2',
                        to: 'd4',
                        color: Colors.red.withOpacity(0.5),
                      ),
                      
                       
                    ],
                    boardOrientation: PlayerColor.white,
                  ),
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (context, game, _) {
                return Text(
                  controller.getSan().fold(
                        '',
                        (previousValue, element) =>
                            previousValue + '\n' + (element ?? ''),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
