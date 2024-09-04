import 'package:flutter/material.dart';

/// StatelessWidget that implements the custom
/// style for a [TextFormField]
class CustomNumberFormField extends StatefulWidget {
  final String? value;
  final String? labelText;
  final String? suffix;
  final bool decimal;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const CustomNumberFormField({
    super.key,
    this.labelText,
    this.suffix,
    this.decimal = false,
    this.value,
    this.onSaved,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomNumberFormField> createState() => _CustomNumberFormFieldState();
}

class _CustomNumberFormFieldState extends State<CustomNumberFormField> {
  final controller = TextEditingController();

  @override
  void didUpdateWidget(covariant CustomNumberFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      controller.text = widget.value ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      borderRadius: BorderRadius.circular(9),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: TextFormField(
          controller: controller,
          keyboardType:
              TextInputType.numberWithOptions(decimal: widget.decimal),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.labelText,
            suffixText: widget.suffix,
            hintStyle: const TextStyle(
              color: Color(0xFFBFBFBF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            suffixStyle: const TextStyle(
              color: Color(0xFFBFBFBF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: const TextStyle(
            color: Color(0xFFBFBFBF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          autocorrect: false,
          onChanged: (newValue) => widget.onChanged?.call(newValue),
          validator: widget.validator,
          onSaved: widget.onSaved,
        ),
      ),
    );
  }
}
