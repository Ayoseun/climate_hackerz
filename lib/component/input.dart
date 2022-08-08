


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class Field extends StatefulWidget {
  final String? hint;
  final String? error;
  final String? label;
  final String? description;
  final String? type;
  final String? value;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(String? email)? onSaved;
  final void Function(String?)? onChanged;

  final String? Function(String?)? validator;

  final String text;
  Field({
    required this.text,
    Key? key,
    this.hint,
    this.error,
    this.label,
    this.description,
    this.value,
    this.suffixIcon,
    this.enabled,
    this.obsecure = false,
    required this.onSaved,
    this.onChanged,
    this.validator,
    this.type,
  }) : super(key: key);

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text,
            textAlign: TextAlign.center,
            style: AppFonts.body1.copyWith(color: Colors.black87,fontSize: 12)),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          obscureText: widget.obsecure!,
          keyboardType: widget.type == 'number'
              ? const TextInputType.numberWithOptions(
                  signed: true, decimal: true)
              : TextInputType.emailAddress,
          maxLength: widget.type == 'number' ? 13 : 100,
          controller: controller,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          validator: widget.validator,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top:8,left: 8),
            suffixIcon: widget.suffixIcon,
            errorMaxLines: 1,
            counterText: '',
            filled: true,
            errorText: widget.error,
            hintStyle: AppFonts.body1,
            hintText: widget.hint,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Pallete.khint.withOpacity(0.2),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Pallete.kPrimaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.transparent)),
            labelText: widget.label,
            labelStyle: AppFonts.body.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}





class CustomTextSpan extends StatelessWidget {
  /*
  variables to hold the strings*/
  final String text;
  final String text2;
  final String text3;
  //this calls the onpressed widget
  final String onPressed;
  //this is to set color
  final Color color;
  //here we pass the sttring to the constructor
 CustomTextSpan(
    this.color,
    this.onPressed,
    this.text,
    this.text2,
    this.text3,
  );

  @override
  Widget build(BuildContext context) {
    //this class returns a Richtext widget
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: AppFonts.body1.copyWith(color: Pallete.kText),
            ),
            TextSpan(
                text: text2,
                style: AppFonts.body1.copyWith(
                    color: Pallete.kPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),

                /* style: TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: color),*/

                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context)
                        .pushNamed(onPressed,);
                  }),
            TextSpan(
              text: text3,
              style: AppFonts.body1.copyWith(
                color: Pallete.kText,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}





class BioField extends StatefulWidget {
  final String? hint;
  final String? error;
  final String? label;
  final String? description;
  final String? type;
  final String? value;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(String? email)? onSaved;
  final void Function(String?)? onChanged;

  final String? Function(String?)? validator;

 
  BioField({
   
    Key? key,
    this.hint,
    this.error,
    this.label,
    this.description,
    this.value,
    this.suffixIcon,
    this.enabled,
    this.obsecure = false,
    required this.onSaved,
    this.onChanged,
    this.validator,
    this.type,
  }) : super(key: key);

  @override
  State<BioField> createState() => _BioFieldState();
}

class _BioFieldState extends State<BioField> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obsecure!,
      keyboardType: widget.type == 'number'
          ? const TextInputType.numberWithOptions(
              signed: true, decimal: true)
          : TextInputType.datetime,
      maxLength: widget.type == 'number' ?2  : 4,
      controller: controller,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top:8,left: 8),
        suffixIcon: widget.suffixIcon,
        errorMaxLines: 1,
        counterText: '',
        errorText: widget.error,
        filled: true,
        hintStyle: AppFonts.body1,
        hintText: widget.hint,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Pallete.khint.withOpacity(0.2),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Pallete.kPrimaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.transparent)),
       // labelText: widget.error,
        labelStyle: AppFonts.body.copyWith(fontSize: 12),
      ),
    );
  }
}
