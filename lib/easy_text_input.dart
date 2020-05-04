library easy_text_input;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({
    @required this.stream,
    @required this.onChanged,
    this.labelText = '',
    this.hintText = '',
    this.counterText = '',
    this.obscureText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.errorIcon = const SizedBox.shrink(),
    this.successIcon = const SizedBox.shrink(),
    this.obscureTextIconOff = const SizedBox.shrink(),
    this.obscureTextIconOn = const SizedBox.shrink(),
    this.borderRadius = 8,
    this.successColor = Colors.green,
    this.errorColor = Colors.red,
  });

  final Stream stream;
  final Function onChanged;
  final String labelText;
  final String hintText;
  final String counterText;
  final bool obscureText;
  final dynamic controller;
  final TextInputType keyboardType;
  final int maxLength;
  final Widget errorIcon;
  final Widget successIcon;
  final Widget obscureTextIconOn;
  final Widget obscureTextIconOff;
  final double borderRadius;
  final Color successColor;
  final Color errorColor;

  @override
  State<StatefulWidget> createState() {
    return InputFieldState(
      obscureText: obscureText,
    );
  }
}

class InputFieldState extends State<InputField> {
  InputFieldState({@required this.obscureText}) {
    inputFieldFocusNode.addListener(_onFocus);
  }

  bool obscureText;
  bool showFieldBorder = false;
  final FocusNode inputFieldFocusNode = FocusNode();

  static bool _isValidSnapshot(
    AsyncSnapshot<String> snapshot, [
    bool showBorder = false,
  ]) {
    if (showBorder) {
      if (snapshot.hasData && !snapshot.hasError) {
        return true;
      }
      if (snapshot.hasError) {
        return false;
      }
    }
    return null;
  }

  void _alternateObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _onFocus() {
    final bool hasFocus = inputFieldFocusNode.hasFocus;
    Scaffold.of(context).removeCurrentSnackBar();
    setState(() {
      showFieldBorder = !hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.stream,
        builder: (
          BuildContext context,
          AsyncSnapshot<String> snapshot,
        ) {
          return Container(
            child: TextField(
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              focusNode: inputFieldFocusNode,
              controller: widget.controller,
              obscureText: obscureText ?? false,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                counterText: widget.counterText,
                labelStyle: _showLabelStyle(snapshot),
                labelText: widget.labelText,
                hintText: widget.hintText,
                errorText: showFieldBorder ? snapshot.error : null,
                suffixIcon: _showIcon(snapshot),
                enabledBorder: _showBorder(snapshot),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _showIcon(AsyncSnapshot<String> snapshot) {
    if (_isValidSnapshot(snapshot, showFieldBorder) == null) {
      if (obscureText == null) {
        return SizedBox.shrink();
      }

      return GestureDetector(
        child:
            obscureText ? widget.obscureTextIconOff : widget.obscureTextIconOn,
        onTap: _alternateObscureText,
      );
    }

    return _isValidSnapshot(snapshot, showFieldBorder)
        ? widget.successIcon
        : widget.errorIcon;
  }

  TextStyle _showLabelStyle(AsyncSnapshot<String> snapshot) {
    if (_isValidSnapshot(snapshot, showFieldBorder) == null) {
      return null;
    }

    return _isValidSnapshot(snapshot, showFieldBorder)
        ? TextStyle(
            color: widget.successColor, //green
          )
        : null;
  }

  OutlineInputBorder _showBorder(AsyncSnapshot<String> snapshot) {
    if (_isValidSnapshot(snapshot, showFieldBorder) == null) {
      return null;
    }
    return _isValidSnapshot(snapshot, showFieldBorder)
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.successColor, //green
              width: 1.0,
            ),
          )
        : OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.errorColor, //red
              width: 1.0,
            ),
          );
  }
}
