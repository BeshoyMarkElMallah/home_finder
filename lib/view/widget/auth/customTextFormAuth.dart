import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_finder/core/constant/colors.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    Key? key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    this.valid,
    required this.isNumber,
    this.obscureText = false,
    this.onTapIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        cursorColor: AppColor.primaryColor,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : keyboardType,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labeltext,
              style: TextStyle(color: AppColor.primaryColor),
            ),
          ),
          suffixIcon: InkWell(
              onTap: onTapIcon,
              child: iconData == Icons.remove_red_eye
                  ? obscureText == false
                      ? Icon(
                          Icons.remove_red_eye,
                          color: AppColor.primaryColor,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: AppColor.primaryColor,
                        )
                  : Icon(
                      iconData,
                      color: AppColor.primaryColor,
                    )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
          focusColor: AppColor.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
