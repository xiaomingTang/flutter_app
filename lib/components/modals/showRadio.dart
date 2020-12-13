import 'package:flutter/material.dart';
import 'package:flutter_app/components/modals/DialogBox.dart';
import 'package:flutter_app/utils/widget.dart';

class _RadioGroup extends StatefulWidget {
  final List<String> options;
  final int defaultIdx;
  final void Function(int val) onChanged;

  _RadioGroup({
    @required this.options,
    this.defaultIdx,
    this.onChanged,
  });

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<_RadioGroup> {
  int currentIdx;

  @override
  void initState() {
    super.initState();
    currentIdx = widget.defaultIdx;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> radios = widget.options.asMap().entries.map((entry) {
      int idx = entry.key;
      String val = entry.value;
      return RadioListTile<int>(
        title: Text(val),
        dense: true,
        groupValue: currentIdx,
        value: idx,
        onChanged: (int newVal) {
          setState(() {
            currentIdx = newVal;
          });
          if (widget.onChanged != null) {
            widget.onChanged(newVal);
          }
        },
      );
    }).toList();
    return SingleChildScrollView(
      child: Column(
        children: joinWith(
          list: radios,
          joined: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(height: 2),
          ),
        ),
      ),
    );
  }
}

void showRadio({
  @required BuildContext context,
  @required List<String> options,
  String title,
  int defaultIdx,
  void Function(int val) onChanged,
}) {
  assert(context != null);
  assert(options != null && options.length > 0);

  showDialog(
    context: context,
    builder: (context) => DialogBox(
      title: (title == null || title.isEmpty)
          ? null
          : Text(
              title,
              textAlign: TextAlign.center,
            ),
      content: _RadioGroup(
        options: options,
        defaultIdx: defaultIdx,
        onChanged: onChanged,
      ),
    ),
  );
}
