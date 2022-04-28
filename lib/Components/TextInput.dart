import 'package:cheffron_mobile/Style.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  bool obscure;
  late final bool allowObscure;

  final String? hint;
  final TextEditingController? controller;

  TextInput({Key? key, this.hint, this.controller, this.obscure = false}) : super(key: key) {
    allowObscure = obscure;
  }

  @override
  State<StatefulWidget> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {

  @override
  Widget build(BuildContext context) => _buildContainer();

  _buildContainer() => Container(
      height: 50,
      width: 530,
      decoration: textBoxDecoration,
      child: _buildFormField()
  );

  _buildFormField() => TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: _buildDecoration()
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