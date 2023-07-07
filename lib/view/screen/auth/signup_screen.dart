import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_finder/controller/auth/signup_controller.dart';
import 'package:home_finder/core/constant/colors.dart';
import 'package:home_finder/core/constant/imageasset.dart';
import 'package:home_finder/core/functions/validinput.dart';
import 'package:home_finder/view/widget/auth/customTextFormAuth.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.assetsImagesFinderIcon,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 48,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Looks Like you don't have an account",
                        style: TextStyle(
                            color: AppColor.secondaryColor, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Let's create a new account or ",
                            style: TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Form(
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextFormAuth(
                                  hinttext: "Enter Your First Name",
                                  labeltext: 'First Name',
                                  iconData: Icons.person_pin,
                                  mycontroller: controller.firstNameController,
                                  valid: (value) {
                                    return validInput(value!, 2, 20, 'name');
                                  },
                                  isNumber: false),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormAuth(
                                  hinttext: "Enter Your Last Name",
                                  labeltext: 'Last Name',
                                  iconData: Icons.person_pin,
                                  mycontroller: controller.lastNameController,
                                  valid: (value) {
                                    return validInput(value!, 2, 20, 'name');
                                  },
                                  isNumber: false),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormAuth(
                                  hinttext: "Enter Your Email",
                                  labeltext: 'Email',
                                  iconData: Icons.email,
                                  mycontroller: controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  valid: (value) {
                                    return validInput(value!, 5, 100, 'email');
                                  },
                                  isNumber: false),
                              const SizedBox(
                                height: 20,
                              ),
                              IntlPhoneField(
                                controller: controller.phoneController,
                                cursorColor: AppColor.primaryColor,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelText: 'Phone Number',
                                  hintText: 'Enter your phone number',
                                  labelStyle: const TextStyle(
                                    color: AppColor.primaryColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                dropdownIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColor.primaryColor,
                                ),
                                pickerDialogStyle: PickerDialogStyle(
                                  listTileDivider: const Divider(
                                    color: AppColor.primaryColor,
                                    thickness: 1,
                                  ),
                                ),
                                initialCountryCode: 'EG',
                                onChanged: (phone) {
                                  controller.phoneCompleteNumber(phone);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormAuth(
                                hinttext: 'Enter your Password',
                                labeltext: 'Password',
                                iconData: Icons.remove_red_eye,
                                mycontroller: controller.passwordController,
                                valid: (value) {
                                  return validInput(value!, 6, 100, 'password');
                                },
                                isNumber: false,
                                obscureText: controller.isPasswordVisible,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormAuth(
                                hinttext: 'Confirm your Password',
                                labeltext: 'Confirm Password',
                                iconData: Icons.remove_red_eye,
                                mycontroller:
                                    controller.confirmPasswordController,
                                valid: (value) {
                                  return validInput(value!, 6, 100, 'password');
                                },
                                isNumber: false,
                                obscureText:
                                    controller.isConfirmPasswordVisible,
                                onTapIcon: () {
                                  controller.showConfirmPassword();
                                },
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.20),
                                child: MaterialButton(
                                  height: 50,
                                  onPressed: () {
                                    controller.goToLoginPage();
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  color: AppColor.primaryColor,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
