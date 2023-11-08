import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      header: FlexibleSpaceBar(
        title: Text(
        "Pengaturan",
        style: CustomText.appTitle(),
        ),
      ),
      leading: BackButton(
        color: CustomColor.primary,
      ),
      contents: [
        vspace(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Image.asset("assets/icons/setting.png")
              ),
              hspace(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan",
                    style: CustomText.profileTitleNote(),
                  ),
                  Text(
                    "Pengaturan Aplikasi, Akun, Notifikasi",
                    style: CustomText.profileSubtitleNote(),
                  ),
                ],
              ),
            ],
          ),
        ),
        vspace(15),
        GetBuilder<SettingController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), ),
              color: CustomColor.white,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Model Perangkat",
                                    style: CustomText.profileSubtitle(),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(
                                controller.appInfo?.deviceInfo ?? "",
                                style: CustomText.settingValue(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ClipRRect(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Versi Aplikasi",
                                    style: CustomText.profileSubtitle(),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(
                                controller.appInfo?.version ?? "",
                                style: CustomText.settingValue(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ClipRRect(
                    child: Material(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                    ),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nomor Build",
                                    style: CustomText.profileSubtitle(),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(
                                controller.appInfo?.buildNumber ?? "",
                                style: CustomText.settingValue(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          );
        }),
        vspace(40),
      ]
    );
  }
}