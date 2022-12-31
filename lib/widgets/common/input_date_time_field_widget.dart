import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputDateTimeFieldWidget extends StatefulWidget {
  final String label;
  final bool isRequired;
  final DateTime? initialValue;
  final bool? isReadOnly;
  final double? marginBottom;
  final Function(DateTime) onChanged;
  final double? dialogHeight;
  const InputDateTimeFieldWidget(
      {Key? key,
      required this.label,
      this.isRequired = false,
      this.initialValue,
      this.isReadOnly,
      this.marginBottom,
      required this.onChanged,
      this.dialogHeight})
      : super(key: key);

  @override
  State<InputDateTimeFieldWidget> createState() => _InputDateTimeFieldWidgetState();
}

class _InputDateTimeFieldWidgetState extends State<InputDateTimeFieldWidget> {
  TextStyle labelBoldStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
  TextStyle requiredIconBoldStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.red);
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
                _showCupertinoDialog(
                  CupertinoDatePicker(
                    initialDateTime: widget.initialValue ?? DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    onDateTimeChanged: widget.onChanged,
                  ),
                );
              },
              child: Text(
                DateFormat('dd-MM-yyyy').format(widget.initialValue ?? DateTime.now()),
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  height: 16 / 12,
                ),
              ),
            ),
          ),
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
