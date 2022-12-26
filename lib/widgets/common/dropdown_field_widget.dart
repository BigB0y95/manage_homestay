import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownFieldWidget extends StatefulWidget {
  final String label;
  final bool isRequired;
  final dynamic initialValue;
  final bool? isReadOnly;
  final Map<String, int> listItems;
  final double? marginBottom;
  final Function(int) onChanged;
  final int selectedIndex;
  final double? dialogHeight;
  const DropdownFieldWidget(
      {Key? key,
      required this.label,
      this.isRequired = false,
      this.initialValue,
      this.isReadOnly,
      this.marginBottom,
      required this.onChanged,
      required this.listItems,
      required this.selectedIndex,
      this.dialogHeight})
      : super(key: key);

  @override
  State<DropdownFieldWidget> createState() => _DropdownFieldWidgetState();
}

class _DropdownFieldWidgetState extends State<DropdownFieldWidget> {
  TextStyle labelBoldStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
  TextStyle requiredIconBoldStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.red);
  final double _kItemExtent = 32.0;
  final _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: widget.marginBottom ?? 15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Text(widget.label, style: labelBoldStyle),
                Text(widget.isRequired ? ' *' : '', style: requiredIconBoldStyle),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.black),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                // if (_selectedSexValue.value == '') {
                //   _selectedSexValue.value = Strings.sexNames.values.first;
                //   _selectedSexLabel = Strings.sexNames.keys.first;
                //   _selectedIndex.value = 0;
                // }
                _showCupertinoDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    scrollController: FixedExtentScrollController(initialItem: widget.selectedIndex),
                    onSelectedItemChanged: widget.onChanged,
                    children: widget.listItems.keys.map((e) => Center(child: Text(e))).toList(),
                  ),
                );
              },
              child: Text(
                widget.listItems.keys.elementAt(widget.selectedIndex),
                style: const TextStyle(fontSize: 13, height: 16 / 13, color: Colors.black),
              ),
            ),
          ),

          // DropdownButton(
          //   value: widget.initialValue ?? widget.listItems.first,
          //   items: widget.listItems.map((String item) {
          //     return DropdownMenuItem(
          //       value: item,
          //       child: Text(item),
          //     );
          //   }).toList(),
          //   onChanged: widget.onChanged,
          // ),
        ],
      ),
    );
  }

  void _showCupertinoDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: widget.dialogHeight ?? 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
