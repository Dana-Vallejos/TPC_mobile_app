import 'package:flutter/material.dart';
import 'package:tpc/screens/cancel_view.dart';
import 'package:tpc/screens/home_screen.dart';
import 'package:tpc/screens/login_screen.dart';
import 'package:tpc/screens/rating_view.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color(0xFF5F76DA),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 50),
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          "Detalle del curso",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildItems(),
              GestureDetector(
                onTap: () => {
                  openRatingDialog(context),
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5F76DA),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Calificar tutoría",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {
                  openCancelDialog(context),
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E7FF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Cancelar tutoría",
                    style: TextStyle(color: const Color(0xFF5F76DA)),
                  ),
                ),
              )
            ],
          ),
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
            BottomNavItem(
              title: "Talleres",
              iconScr: Icons.calendar_month,
              isActive: true,
            ),
            BottomNavItem(
              title: "Reservas",
              iconScr: Icons.computer_rounded,
            ),
            BottomNavItem(title: "Perfil", iconScr: Icons.person),
          ],
        ),
      ),
    );
  }

  openRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: RatingView(),
        );
      },
    );
  }

  openCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: CancelView(),
        );
      },
    );
  }
}

Widget buildItems() {
  return Container(
    child: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          child: const Text(
            "Tipo de reserva",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        courseListItem("Tutoría"),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 15),
          child: const Text(
            "Curso",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        courseListItem("Programación"),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 15),
          child: const Text(
            "Tutor",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        courseListItem("Arturo Obregón"),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 15),
          child: const Text(
            "Enlace de sesión",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        courseListItem("meet.google.com/pprr-sshh"),
      ],
    ),
  );
}

Widget courseListItem(String title) {
  return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
      ),
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: TextStyle(
            color: Colors.grey,
          )));
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
            MaterialPageRoute(builder: (context) => const HomeScreen())),
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
