import 'package:flutter/material.dart';
import 'dart:math';

class EnrollView extends StatefulWidget {
  const EnrollView({Key? key}) : super(key: key);

  @override
  State<EnrollView> createState() => _EnrollViewState();
}

class _EnrollViewState extends State<EnrollView> {
  final _cancelPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: max(200, MediaQuery.of(context).size.height * 0.3),
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
                child: Text("Inscribirme"),
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
            "¿Quieres inscribirte a esta tutoría?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
