import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitameal/core/theme/app_theme.dart';

class ValidateTextformfield extends HookConsumerWidget {
  const ValidateTextformfield({
    super.key,
    required this.readOnly,
    required this.hintText,
    required this.controller,
    this.validator,
    this.title,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.helperText,
    this.fixHeight,
    this.unit,
  });
  final bool readOnly;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String? title;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? helperText;
  final bool? fixHeight;

  final String? unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = useState<bool?>(null);
    useEffect(() {
      void listener() {
        if (validator == null) return;
        isValid.value = validator!(controller.text) == null;
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.only(top: 20),
                width: 50,
                child: Text(title!, style: TextStyle(fontSize: 12)),
              ),
        Expanded(
          child: TextFormField(
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: hintText,
              hintStyle: TextStyle(color: vrc(context).border),
              errorText: errorText,
              errorStyle: TextStyle(color: fxc(context).secondary400!),
              errorMaxLines: 1,
              helperText: helperText,
              helperStyle: TextStyle(color: fxc(context).textcolor200!),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: vrc(context).border!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: fxc(context).primary400!),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: fxc(context).secondary400!),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: fxc(context).secondary400!),
              ),
              suffixIcon: isValid.value == null
                  ? null
                  : isValid.value!
                  ? Icon(Icons.check, size: 16, color: fxc(context).primary400)
                  : Icon(
                      Icons.clear,
                      size: 16,
                      color: fxc(context).secondary400,
                    ),
            ),
            readOnly: readOnly,
            onTap: onTap,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onFieldSubmitted: (_) {},
          ),
        ),
        unit == null
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                width: 40,
                child: Text(unit!, style: TextStyle(fontSize: 14)),
              ),
      ],
    );
  }
}
