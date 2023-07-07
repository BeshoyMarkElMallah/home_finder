import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:home_finder/controller/auth/login_controller.dart';
import 'package:home_finder/core/constant/colors.dart';
import 'package:home_finder/core/constant/imageasset.dart';
import 'package:home_finder/core/functions/validinput.dart';
import 'package:home_finder/view/widget/auth/customTextFormAuth.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: GetBuilder<LoginControllerImp>(builder: (controller) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(Assets.assetsImagesFinderIcon),
                ),
                Column(
                  children: [
                    const Text(
                      'WELCOME!',
                      style: TextStyle(
                          color: AppColor.secondaryColor, fontSize: 48),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nice to see you!',
                      style: TextStyle(
                          color: AppColor.secondaryColor, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Please Login here or ",
                          style: const TextStyle(
                              color: AppColor.secondaryColor, fontSize: 24),
                        ),
                        InkWell(
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: AppColor.primaryColor, fontSize: 24),
                          ),
                          onTap: () {
                            controller.goToSignupPage();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Form(
                        child: ListView(
                          children: [
                            CustomTextFormAuth(
                                hinttext: 'Enter your Email',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.20),
                              child: MaterialButton(
                                height: 50,
                                onPressed: () {},
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 24),
                                ),
                                color: AppColor.primaryColor,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Or \n\nLogin with',
                              style: TextStyle(
                                  color: AppColor.secondaryColor, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SocialLoginButton(
                                        buttonType: SocialLoginButtonType.apple,
                                        mode: SocialLoginButtonMode.single,
                                        onPressed: () {},
                                      )),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SocialLoginButton(
                                      buttonType: SocialLoginButtonType.google,
                                      mode: SocialLoginButtonMode.single,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SocialLoginButton(
                                      buttonType:
                                          SocialLoginButtonType.facebook,
                                      mode: SocialLoginButtonMode.single,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
