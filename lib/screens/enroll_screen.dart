import 'package:flutter/material.dart';
import 'package:tpc/screens/enroll_view.dart';
import 'package:tpc/screens/home_screen.dart';

class EnrollDetailScreen extends StatefulWidget {
  const EnrollDetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<EnrollDetailScreen> {
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
                  openEnrollDialog(context),
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 50, bottom: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Color(0xFF5F76DA),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Inscribirme",
                    style: TextStyle(color: Colors.white),
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

  openEnrollDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: EnrollView(),
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
            "Tipo de clase",
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
            "Vacantes",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        courseListItem("3"),
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
