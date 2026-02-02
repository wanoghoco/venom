import 'package:flutter/material.dart';

class CurrencyInputField extends StatefulWidget {
  final bool autofocus;
  const CurrencyInputField({super.key, this.autofocus = false});

  @override
  State<CurrencyInputField> createState() => _CurrencyInputFieldState();
}

class _CurrencyInputFieldState extends State<CurrencyInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IntrinsicWidth(
          child: TextField(
            autofocus: widget.autofocus,
            controller: _controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
            decoration: InputDecoration(
              prefixIcon: Text(
                '\$',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),

              suffixIcon: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => _controller.clear(),
                icon: const Icon(Icons.cancel, color: Colors.black26, size: 24),
              ),

              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ),
      ],
    );
  }
}
