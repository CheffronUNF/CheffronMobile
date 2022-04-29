import 'package:cheffron_mobile/Style.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  bool obscure;
  late final bool allowObscure = obscure;

  final double height;
  final double width;
  final String? hint;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;

  TextInput({
    Key? key,
    this.hint,
    this.controller,
    this.height = 50,
    this.width = 500,
    this.obscure = false,
    this.textAlign = TextAlign.left,
    this.textAlignVertical = TextAlignVertical.top
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {

  @override
  Widget build(BuildContext context) => _buildContainer();

  _buildContainer() => Container(
    height: widget.height,
    width: widget.width,
    decoration: textBoxDecoration,
    child: _buildFormField()
  );

  _buildFormField() => TextFormField(
    controller: widget.controller,
    obscureText: widget.obscure,
    textAlign: widget.textAlign,
    onEditingComplete: () => FocusScope.of(context).nextFocus(),
    decoration: _buildDecoration(),
  );

  _buildDecoration() => InputDecoration(
    border: InputBorder.none,
    hintText: widget.hint,
    contentPadding: const EdgeInsets.all(15),
    suffixIcon: widget.allowObscure ? _buildIconButton() : null
  );

  _buildIconButton() => IconButton(
    icon: Icon(widget.obscure ? Icons.visibility_off : Icons.visibility),
    onPressed: () => setState(() => widget.obscure = !widget.obscure),
  );
}