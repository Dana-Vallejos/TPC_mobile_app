import 'package:flutter/material.dart';
import 'package:tpc/screens/course_datails.dart';
import 'package:tpc/screens/enroll_screen.dart';
import 'package:tpc/screens/reservas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: homeWidget(context),
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
              isActive: true,
            ),
            BottomNavItem(title: "Tutorías", iconScr: Icons.book_rounded),
            BottomNavItem(title: "Talleres", iconScr: Icons.calendar_month),
            BottomNavItem(title: "Reservas", iconScr: Icons.computer_rounded),
            BottomNavItem(title: "Perfil", iconScr: Icons.person),
          ],
        ),
      ),
    );
  }
}

Widget homeWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20, top: 10, bottom: 15),
        alignment: Alignment.bottomLeft,
        child: const Text(
          "Encuentra tu taller ideal",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, top: 10),
        alignment: Alignment.bottomLeft,
        child: const Text(
          "Mis cursos",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      buildClasses(context),
      const SizedBox(
        height: 30,
      ),
      buildTalleres(context),
      const SizedBox(
        height: 30,
      ),
      buildTutorias(context),
    ],
  );
}

Widget buildTutorias(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                "Tutorías recomendadas",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                "Ver más",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffad98c4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              buildNewTutoria(
                  "Tutoría de emprendimiento", "Hora 19:00", context),
              buildNewTutoria("Tutoría de programación", "Hora 17:00", context),
              buildNewTutoria(
                  "Tutoría de matemática básica", "Hora 16:00", context),
              buildNewTutoria(
                  "Tutoría de matemática básica", "Hora 16:00", context)
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildNewTutoria(String title, String hour, BuildContext context) {
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
                hour,
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
                title,
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
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnrollDetailScreen())),
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

Widget buildTalleres(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                "Talleres recomendados",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                "Ver más",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffad98c4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              buildNewTaller("Taller de emprendimiento", "Hora 19:00", context),
              buildNewTaller("Taller de programación", "Hora 17:00", context),
              buildNewTaller(
                  "Taller de matemática básica", "Hora 16:00", context),
              buildNewTaller(
                  "Taller de matemática básica", "Hora 16:00", context)
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildNewTaller(String title, String hour, BuildContext context) {
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
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnrollDetailScreen())),
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

Widget buildClasses(BuildContext context) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        classListItem("15:00", "Programación 1", context),
        classListItem("15:00", "Programación 2", context),
        classListItem("15:00", "Seminario 1", context),
        classListItem("15:00", "CPL 2", context),
      ],
    ),
  );
}

Widget classListItem(String hour, String title, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        color: Color(0xFF5F76DA), borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Container(
          child: Text(
            hour,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CourseDetailScreen())),
          },
          child: Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );
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
            MaterialPageRoute(builder: (context) => const ReservaScreen())),
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
