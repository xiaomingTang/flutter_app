import 'package:flutter/material.dart';
import 'package:flutter_app/components/modals/DialogBox.dart';
import 'package:flutter_app/utils/widget.dart';

class _CheckboxGroup extends StatefulWidget {
  final List<String> options;
  final Set<int> defaultSelected;
  final void Function(Set<int> selected) onChanged;

  _CheckboxGroup({
    @required this.options,
    this.defaultSelected,
    this.onChanged,
  });

  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<_CheckboxGroup> {
  Set<int> _currentSelected;

  @override
  void initState() {
    super.initState();
    _currentSelected = widget.defaultSelected;
  }

  void _toggleIndex({
    @required int idx,
    bool forcedValue,
  }) {
    if (forcedValue == null) {
      if (_currentSelected.contains(idx)) {
        _currentSelected.remove(idx);
      } else {
        _currentSelected.add(idx);
      }
    } else if (forcedValue) {
      _currentSelected.add(idx);
    } else {
      _currentSelected.remove(idx);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> checkboxes = widget.options.asMap().entries.map((entry) {
      int idx = entry.key;
      String val = entry.value;
      return CheckboxListTile(
        title: Text(val),
        dense: true,
        value: _currentSelected.contains(idx),
        onChanged: (bool newVal) {
          _toggleIndex(idx: idx, forcedValue: newVal);
          if (widget.onChanged != null) {
            widget.onChanged(_currentSelected);
          }
        },
      );
    }).toList();
    return SingleChildScrollView(
      child: Column(
        children: joinWith(
          list: checkboxes,
          joined: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(height: 2),
          ),
        ),
      ),
    );
  }
}

void showCheckbox({
  @required BuildContext context,
  @required List<String> options,
  String title,
  Set<int> defaultSelected,
  void Function(Set<int> selected) onChanged,
  void Function(Set<int> selected) onPop,
}) {
  assert(context != null);
  assert(options != null && options.length > 0);

  Set<int> finalSelected = defaultSelected;

  showDialog(
    context: context,
    builder: (context) => DialogBox(
      title: (title == null || title.isEmpty)
          ? null
          : Text(
              title,
              textAlign: TextAlign.center,
            ),
      content: _CheckboxGroup(
        options: options,
        defaultSelected: defaultSelected,
        onChanged: (selected) {
          finalSelected = selected;
          if (onChanged != null) {
            onChanged(selected);
          }
        },
      ),
      onOk: () {
        if (onPop != null) {
          onPop(finalSelected);
        }
      },
    ),
  );
}
