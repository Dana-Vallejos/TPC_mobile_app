import 'package:flutter/material.dart';
import 'dart:math';

class CancelView extends StatefulWidget {
  const CancelView({Key? key}) : super(key: key);

  @override
  State<CancelView> createState() => _CancelViewState();
}

class _CancelViewState extends State<CancelView> {
  final _cancelPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: max(250, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _cancelPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildThanksNotes(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFF5F76DA),
              child: MaterialButton(
                onPressed: _hideDialog,
                child: Text("Cancelar tutoría"),
                textColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: MaterialButton(
              onPressed: _hideDialog,
              child: Text("salir"),
            ),
          ),
        ],
      ),
    );
  }

  _buildThanksNotes() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 70),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "¿Quieres cancelar esta tutoría?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "No podrá revertir esta acción ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
