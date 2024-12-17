import 'package:bookticket/Page/home_page.dart';
import 'package:bookticket/Page/search_page.dart';
import 'package:bookticket/Page/ticket_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _seletbodyIndex = 2;
  final List<Widget> _bodyOptions = [
    HomePage(),
    SearchPage(),
    TicketPage(),
    Text('profi'),
  ];
  void _onBottomItemTap(int index){
    setState(() {
      _seletbodyIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _bodyOptions[_seletbodyIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seletbodyIndex,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Style.appSelectItem,
        unselectedItemColor: Style.appUnSelectItem,
        onTap:_onBottomItemTap,
        items:  const [
          BottomNavigationBarItem(icon:Icon(FluentIcons.home_16_regular),label: 'Home',
            activeIcon: Icon(FluentIcons.home_16_filled),
          ),
          BottomNavigationBarItem(icon:Icon(FluentIcons.search_16_regular),label: 'Search',
            activeIcon: Icon(FluentIcons.search_16_filled),
          ),
          BottomNavigationBarItem(icon:Icon(FluentIcons.ticket_diagonal_16_regular),label: 'Ticket',
            activeIcon: Icon(FluentIcons.ticket_diagonal_16_filled),
          ),
          BottomNavigationBarItem(icon:Icon(FluentIcons.person_16_regular),label: 'Home',
            activeIcon: Icon(FluentIcons.person_16_filled),
          ),
        ],

      ),
    );
  }
}
