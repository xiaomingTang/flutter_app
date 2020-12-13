import 'package:flutter/material.dart';

import 'package:flutter_app/utils/log.dart';

class Nav {
  IconData icon;
  String title;
  String route;

  Nav({this.icon, this.title, this.route});
}

class BottomBar extends StatefulWidget {
  final int initialIdx;
  final List<Nav> navs;

  @override
  BottomBar({@required this.navs, this.initialIdx = 0});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _curIdx;

  int get curIdx {
    List<Nav> navs = widget.navs;
    if (_curIdx == null || _curIdx < 0 || _curIdx >= navs.length) {
      return widget.initialIdx;
    } else {
      return _curIdx;
    }
  }

  set curIdx(int idx) {
    List<Nav> navs = widget.navs;
    if (idx == null || idx < 0 || idx >= navs.length) {
      _curIdx = widget.initialIdx;
    } else {
      _curIdx = idx;
    }
  }

  void _routeTo(int idx) {
    List<Nav> navs = widget.navs;

    setState(() {
      curIdx = idx;
    });

    String route = navs[idx].route;

    logWarn(route);

    Navigator.pushNamed(context, route);
  }

  @override
  BottomNavigationBar build(BuildContext context) {
    List<Nav> navs = widget.navs;

    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.initialIdx,
      items: navs
          .map(
            (nav) => BottomNavigationBarItem(
              icon: Icon(nav.icon),
              label: nav.title,
            ),
          )
          .toList(),
      onTap: _routeTo,
    );
  }
}
