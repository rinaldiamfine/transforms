import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/custom_button.dart';
import 'package:transforms/widgets/input_widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      header: FlexibleSpaceBar(
        title: Text(
        "",
        style: CustomText.appTitle(),
        ),
      ),
      contents: [
        vspace(40),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Material(
            child: SizedBox(
              width: 140,
              height: 140,
              child: Icon(
                Icons.image, 
                color: CustomColor.cardStatusRed,
                size: 120,
              )
            )
          )
        ),
        vspace(20),
        GetBuilder<LoginController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nomor Karyawan",
                  style: CustomText.inputTitle(),
                ),
                vspace(10),
                CustomInputWidget(
                  // validator: (value) => controller.validateEmail(email: value) ? null : "Tuliskan alamat email yang benar",
                  controller: controller.usernameController,
                  focusNode: controller.usernameFocusNode,
                  hintText: "TZ001",
                  onChanged: (value) {
                    // controller.validateEmail(email: controller.emailController.text);
                  },
                ),
                vspace(10),
                Text(
                  "Password",
                  style: CustomText.inputTitle(),
                ),
                vspace(10),
                CustomInputWidget(
                  // validator: (value) => controller.validateEmail(email: value) ? null : "Tuliskan alamat email yang benar",
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocusNode,
                  obscureText: true,
                  hintText: "******",
                  onChanged: (value) {
                    // controller.validateEmail(email: controller.emailController.text);
                  },
                ),
                vspace(30),
                
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: CustomColor.gradientButtonBlue),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: CustomButton(
                    isDisabled: !controller.buttonChecker(),
                    backgroundColor: Colors.transparent,
                    onPressed: () async {
                      controller.authenticate();
                    },
                    buttonName: "Masuk",
                  ),
                ),
              ],
            )
          );
        }),
        vspace(40),
      ]
    );
  }
}