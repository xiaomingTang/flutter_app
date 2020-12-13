import 'package:flutter/material.dart';
import 'package:flutter_app/common/themeModel.dart';
import 'package:flutter_app/components/modals/showRadio.dart';
import 'package:flutter_app/components/TextIcon.dart';
import 'package:provider/provider.dart';

class System extends StatefulWidget {
  @override
  _SystemState createState() => _SystemState();
}

class _SystemState extends State<System> {
  @override
  Widget build(BuildContext context) {
    ThemeModel themeModel = Provider.of<ThemeModel>(context, listen: false);
    List<ThemeValues> modes = [
      ThemeValues.light,
      ThemeValues.dark,
      ThemeValues.system,
    ];
    List<String> titles = [
      "浅色",
      "深色",
      "跟随系统",
    ];
    int currentIdx = modes.indexOf(themeModel.mode);

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_4),
            trailing: TextIcon(
              space: 0,
              trailing: Icon(Icons.chevron_right),
              content: Text(titles[currentIdx]),
            ),
            title: Text("深色模式"),
            onTap: () {
              showRadio(
                context: context,
                title: "深色模式",
                options: titles,
                defaultIdx: currentIdx,
                onChanged: (val) {
                  themeModel.mode = modes[val];
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
