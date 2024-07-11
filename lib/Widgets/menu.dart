import 'package:flutter/material.dart';
import 'package:flutter01/screens/ui.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class hidden_drawer extends StatefulWidget {
  const hidden_drawer({super.key});

  @override
  State<hidden_drawer> createState() => _hidden_drawerState();
}

class _hidden_drawerState extends State<hidden_drawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Interview Task-Jewellery',
          baseStyle: TextStyle(),
          selectedStyle: TextStyle(),
        ),
        First(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Refresh",
          baseStyle: TextStyle(),
          selectedStyle: TextStyle(),
        ),
        First(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        screens: _pages,
        //  initPositionSelected: 0,
        backgroundColorMenu: Colors.grey.shade700);
  }
}
