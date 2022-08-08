




import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInput extends StatefulWidget {

   final String? hint;
  final String? error;
  final String? label;
  final String? description;
  final String? type;
  final String? value;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(PhoneNumber? email)? onSaved;
  final void Function(String?)? onChanged;
  
  final String? Function(String?)? validator;

  final String text;
  PhoneInput({ required this.text,Key? key,
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
      this.type, this.prefixIcon,}): super (key: key);
  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {},
               // onInputValidated: (bool value) {print(value);},
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                //ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                keyboardType:
                    TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: widget.onSaved,
                //(PhoneNumber number) {
                  //print('On Saved: $number');
                //},
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}