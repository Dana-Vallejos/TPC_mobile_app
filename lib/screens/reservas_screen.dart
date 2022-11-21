import 'package:flutter/material.dart';
import 'package:tpc/screens/enroll_screen.dart';
import 'package:tpc/screens/talleres_screen.dart';

class ReservaScreen extends StatefulWidget {
  const ReservaScreen({Key? key}) : super(key: key);

  @override
  State<ReservaScreen> createState() => InitState();
}

class InitState extends State<ReservaScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: reservaWidget(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            BottomNavItem(
              title: "Inicio",
              iconScr: Icons.home,
            ),
            BottomNavItem(title: "Tutorías", iconScr: Icons.book_rounded),
            BottomNavItem(title: "Talleres", iconScr: Icons.calendar_month),
            BottomNavItem(
              title: "Reservas",
              iconScr: Icons.computer_rounded,
              isActive: true,
            ),
            BottomNavItem(title: "Perfil", iconScr: Icons.person),
          ],
        ),
      ),
    );
  }

  Widget reservaWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10, bottom: 15),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Reservas",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          buildReservas(),
          const SizedBox(
            height: 30,
          ),
        ]);
  }

  Widget buildReservas() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                buildNewReserva(
                  "Taller de emprendimiento",
                  "Hora 19:00",
                ),
                buildNewReserva(
                  "Taller de programación",
                  "Hora 17:00",
                ),
                buildNewReserva(
                  "Taller de matemática básica",
                  "Hora 16:00",
                ),
                buildNewReserva(
                  "Taller de matemática básica",
                  "Hora 16:00",
                ),
                buildNewReserva(
                  "Taller de programación",
                  "Hora 17:00",
                ),
                buildNewReserva(
                  "Taller de matemática básica",
                  "Hora 16:00",
                ),
                buildNewReserva(
                  "Taller de programación",
                  "Hora 17:00",
                ),
                buildNewReserva(
                  "Taller de matemática básica",
                  "Hora 16:00",
                ),
                buildNewReserva(
                  "Taller de programación",
                  "Hora 17:00",
                ),
                buildNewReserva(
                  "Taller de matemática básica",
                  "Hora 16:00",
                ),
                buildNewReserva(
                  "Taller de programación",
                  "Hora 17:00",
                ),
                buildNewReserva(
                  "Taller de matemática básica",
                  "Hora 16:00",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewReserva(String title, String hour) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  hour,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnrollDetailScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.arrow_circle_right_rounded,
                color: Color(0xFF5F76DA),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData iconScr;
  final String title;
  final Function? press;
  final bool isActive;

  const BottomNavItem({
    Key? key,
    required this.iconScr,
    required this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TalleresScreen())),
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(iconScr, color: isActive ? Color(0xFF5F76DA) : Colors.grey),
          Text(
            title,
            style: TextStyle(color: isActive ? Color(0xFF5F76DA) : Colors.grey),
          ),
        ],
      ),
    );
  }
}
