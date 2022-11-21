import 'package:flutter/material.dart';
import 'package:tpc/screens/home_screen.dart';
import 'package:tpc/screens/reservas_screen.dart';
import 'package:tpc/screens/talleres_screen.dart';
import 'package:tpc/screens/tutorias_screen.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const HomeScreen(),
      const TutoriasScreen(),
      const TalleresScreen(),
      const ReservaScreen()
    ];
    return myList[index];
  }
}
