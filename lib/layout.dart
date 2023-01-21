import 'package:flutter/material.dart';
import 'package:naked/posts/posts_screen.dart';

class Layout extends StatefulWidget {
  static const routeName = "Layout";
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PostsScreen(),
    Text(
      'GuardadoScreen',
    ),
    Text(
      'PerfilScreen',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(_selectedIndex),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: getBottomNavBar(_selectedIndex, _onItemTapped),
      ),
    );
  }

  AppBar getAppBar(int index) {
    return AppBar(
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset('images/yb-icon.png'),
      ),
      leadingWidth: 70,
      actions: [
        index == 0
            ? InkWell(
                onTap: () {
                  print('belu');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.refresh_sharp),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

BottomNavigationBar getBottomNavBar(_selectedIndex, _onItemTapped) {
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: "Inicio",
        icon: Icon(Icons.home_outlined),
      ),
      BottomNavigationBarItem(
        label: "Guardado",
        icon: Icon(Icons.save_alt_outlined),
      ),
      BottomNavigationBarItem(
        label: "Perfil",
        icon: Icon(Icons.person_outline),
      ),
    ],
    currentIndex: _selectedIndex,
    unselectedItemColor: const Color.fromARGB(255, 159, 159, 159),
    selectedItemColor: const Color(0xff053568),
    onTap: _onItemTapped,
  );
}
