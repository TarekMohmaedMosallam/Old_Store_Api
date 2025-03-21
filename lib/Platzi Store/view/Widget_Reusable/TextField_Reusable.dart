import 'package:flutter/material.dart';

class TextfieldReusable extends StatefulWidget {
  const TextfieldReusable({
    super.key,
    required this.textEditingController,
    required this.text,
    required this.hidePassword,
    this.hidePasswordIcon = false, // Default value
  });

  final TextEditingController textEditingController;
  final String text;
  final bool hidePassword;
  final bool hidePasswordIcon;

  @override
  State<TextfieldReusable> createState() => _TextfieldReusableState();
}

class _TextfieldReusableState extends State<TextfieldReusable> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.hidePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: widget.textEditingController,
      style: const TextStyle(fontSize: 25),
      decoration: InputDecoration(
        prefixIcon: widget.hidePasswordIcon
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
        labelText: widget.text,
        labelStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.all(25),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
