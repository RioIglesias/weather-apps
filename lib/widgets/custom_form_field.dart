import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/style/colors.dart';
import 'package:weather_app/style/custom_text.dart';

class CustomizeTextField extends StatelessWidget {
  const CustomizeTextField({
    super.key,
    required TextEditingController textController,
    FormFieldSetter? onSaved,
    String? hintText,
    FormFieldValidator? validator,
    void Function(String newValue)? onChanged,
    bool? autoFocus = false,
    TextInputType? keyboardType,
    List<TextInputFormatter>? formatter,
    String? prefixText,
    Color? colors,
    double? fontSize,
    FontWeight? fontWeight,
    Color? fontColors,
    bool? obscureText = false,
    bool? readOnly = false,
    BorderSide? border,
  })  : _textController = textController,
        _onSaved = onSaved,
        _validator = validator,
        _onChanged = onChanged,
        _hintText = hintText,
        _autoFocus = autoFocus,
        _keyboardType = keyboardType,
        _formatter = formatter,
        _prefixText = prefixText,
        _colors = colors,
        _fontSize = fontSize,
        _fontWeight = fontWeight,
        _fontColors = fontColors,
        _obscureText = obscureText,
        _readOnly = readOnly,
        _border = border;

  final TextEditingController _textController;
  final FormFieldSetter? _onSaved;
  final FormFieldValidator? _validator;
  final void Function(String newValue)? _onChanged;
  final String? _hintText;
  final bool? _autoFocus;
  final TextInputType? _keyboardType;
  final List<TextInputFormatter>? _formatter;
  final String? _prefixText;
  final Color? _colors;
  final double? _fontSize;
  final FontWeight? _fontWeight;
  final Color? _fontColors;
  final bool? _obscureText;
  final bool? _readOnly;
  final BorderSide? _border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: _autoFocus!,
      controller: _textController,
      onChanged: _onChanged,
      readOnly: _readOnly!,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: _obscureText!,
      style: TextStyle(
        fontSize: _fontSize ?? SizeCustomize.setSp(14),
        color: _fontColors ?? AppColors.subtextColor1,
        fontFamily: 'Poppins',
        fontWeight: _fontWeight ?? FontWeight.w400,
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeCustomize.setSp(10))),
            borderSide: _border ?? BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeCustomize.setSp(10))),
            borderSide: _border ?? BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeCustomize.setSp(10))),
            borderSide:
                _border ?? BorderSide(color: Colors.blue), // default focused
          ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeCustomize.setSp(10))),
            borderSide: _border ?? BorderSide(color: Colors.red),
          ),
          // prefixText: _prefixText,
          filled: true,
          fillColor: _colors ?? AppColors.subColor1,
          hintText: _hintText,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          prefixIcon: _prefixText != null
              ? Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: SizeCustomize.setSp(8)),
                  child: SubText(
                    text: _prefixText,
                  ),
                )
              : null,
          errorStyle: TextStyle(),
          hintStyle: TextStyle(
            fontSize: _fontSize ?? SizeCustomize.setSp(14),
            color: _fontColors ?? Colors.grey.shade600,
            fontFamily: 'Poppins',
            fontWeight: _fontWeight ?? FontWeight.w400,
          )),
      keyboardType: _keyboardType ?? TextInputType.text,
      inputFormatters: _formatter,
      onSaved: _onSaved,
      validator: _validator,
    );
  }
}
