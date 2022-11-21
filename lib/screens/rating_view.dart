import 'dart:math';
import 'package:flutter/material.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final _ratingPageController = PageController();
  var _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
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
                child: Text("Realizado"),
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
          AnimatedPositioned(
            top: 170,
            left: 0,
            right: 0,
            duration: const Duration(
              milliseconds: 300,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => IconButton(
                  icon: index < _rating
                      ? Icon(Icons.star, size: 32)
                      : Icon(
                          Icons.star_border,
                          size: 32,
                        ),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                ),
              ),
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
            "Ayúdanos a mejorar",
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
            "Nos gustaría saber su opinión sobre esta clase",
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
