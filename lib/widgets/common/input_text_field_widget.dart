import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_homestay_app/constants/color.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String label;
  final bool isRequired;
  final String? hint;
  final String? initialValue;
  final bool? autoFocus;
  final bool? isReadOnly;
  final bool? moreLines;
  final bool? textUnderline;
  final int? maxLineHintText;
  final double? fontSize;
  final bool? isPassword;
  final double? marginBottom;
  final TextInputType? textInputType;
  final Function(String) onChanged;

  const InputTextFieldWidget(
      {Key? key,
      required this.label,
      this.isRequired = false,
      this.hint,
      this.initialValue,
      this.autoFocus,
      this.isReadOnly,
      this.moreLines,
      this.textUnderline,
      this.maxLineHintText,
      this.fontSize,
      this.isPassword,
      this.marginBottom,
      this.textInputType,
      required this.onChanged})
      : super(key: key);

  @override
  State<InputTextFieldWidget> createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  TextStyle labelBoldStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
  TextStyle requiredIconBoldStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.red);
  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextFormField(
            enabled: widget.isReadOnly == true ? false : true,
            readOnly: widget.isReadOnly ?? false,
            autofocus: widget.autoFocus ?? false,
            initialValue: widget.initialValue,
            maxLines: widget.moreLines == true ? null : 1,
            style: TextStyle(
              fontSize: widget.fontSize ?? 13,
              // height: 16 / 13,
              overflow: TextOverflow.ellipsis,
              decoration: widget.textUnderline == true ? TextDecoration.underline : TextDecoration.none,
            ),
            strutStyle: const StrutStyle(
              fontSize: 12,
              // height: 16 / 13,
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintMaxLines: widget.maxLineHintText,
              hintStyle: TextStyle(
                color: AppColor.hintTextColor,
                fontSize: widget.fontSize ?? 13,
              ),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.isReadOnly == true ? AppColor.hintTextColor : Colors.black, width: 1.0),
              ),
            ),
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.next,
            obscureText: widget.isPassword ?? false,
            keyboardType: widget.textInputType ?? TextInputType.text,
          ),
        ],
      ),
    );
  }
}
