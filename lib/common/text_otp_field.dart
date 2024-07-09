import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key, this.controller, this.validator});
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      //controller: controller.smsCode,
      length: 6,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      validator: validator,
      isCursorAnimationEnabled: true,
      pinAnimationType: PinAnimationType.fade,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      // listenForMultipleSmsOnAndroid: true,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      animationDuration: Durations.long1,
      // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      controller: controller,
      animationCurve: Curves.bounceOut,
      defaultPinTheme: PinTheme(
        height: 45.0,
        width: 45.0,
        // textStyle: Styles.boldBlue716,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            // color: primary,
            width: 1.0,
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: 45.0,
        width: 45.0,
        // textStyle: Styles.boldBlue716,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            // color: primary,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
