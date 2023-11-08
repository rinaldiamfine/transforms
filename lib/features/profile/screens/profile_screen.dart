import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:transforms/controllers.dart';
import 'package:transforms/layouts/custom_layout.dart';
import 'package:transforms/models/user_model.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';
import 'package:transforms/widgets/biodata_widget.dart';
import 'package:transforms/widgets/custom_button.dart';
import 'package:transforms/widgets/picture_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});


  Widget _skeletonProfileHeader() {
    return Skeletonizer(
      child: Column(
        children: [
          PictureWidget(
            size: 86,
            iconSize: 0,
          ),
          vspace(10),
          Text(
            "Skeleton Name",
            style: CustomText.profileName(),
          )
        ],
      ),
    );
  }
  Widget _profileHeader() {
    return Column(
      children: [
        Center(
          child: PictureWidget(
            size: 86,
            iconSize: 32,
            photo: controller.state != null ? controller.state!.photo!.obs : "".obs,
            action: () {
              // Utils(Get.context!).startLoading();
              // controller.updatePicture().then((value) {
              //   Utils(Get.context!).stopLoading();
              // }).onError((error, stackTrace) {
              //   // return null;
              //   Utils(Get.context!).stopLoading();
              // });
            },
          ),
        ),
        vspace(10),
        Text(
          controller.state != null
              ? controller.state!.name ?? ""
              : "",
          style: CustomText.profileName(),
        )
      ],
    );
  }

  UserModel _skeletonModel() {
    return UserModel(
      id: "Skeleton Badge",
      name: "Skeleton Name",
      photo: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      header: FlexibleSpaceBar(
        title: Text(
        "Akun",
        style: CustomText.appTitle(),
        ),
      ),
      leading: BackButton(
        color: CustomColor.primary,
      ),
      contents: [
        vspace(20),
        GetBuilder<ProfileController>(builder: (_) {
          return Column(
            children: [
              if (controller.status.isLoading)
                _skeletonProfileHeader(),
              if (controller.status.isSuccess)
                _profileHeader(),
            ],
          );
        }),
        vspace(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset("assets/icons/biodata.png")),
              hspace(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biodata",
                    style: CustomText.profileTitleNote(),
                  ),
                  Text(
                    "Data diri anda yang di isi sesuai dengan data asli",
                    style: CustomText.profileSubtitleNote(),
                  ),
                ],
              ),
            ],
          ),
        ),
        vspace(15),
        controller.obx(
          (state) => Column(
            children: [
              GetBuilder<ProfileController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BiodataWidget(
                    changeNameAction: () {
                      // controller.changeNameScreen();
                    },
                    changeBadgeAction: () {
                      
                    },
                    changePhoneAction: () {
                      
                    },
                    changePasswordAction: () {
                      
                    },
                    profile: controller.userModel!.value,
                ));
              }),
            ],
          ),
          onLoading: Skeletonizer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BiodataWidget(
                changeNameAction: () {
                  // controller.changeNameScreen();
                },
                changeBadgeAction: () {
                },
                changePhoneAction: () {
                  
                },
                changePasswordAction: () {
                },
                profile: _skeletonModel()
              )
            ),
          ),
        ),
        vspace(25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset("assets/icons/lainnya.png")),
              hspace(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lainnya",
                    style: CustomText.profileTitleNote(),
                  ),
                  Text(
                    "Dukungan dan bantuan yang anda butuhkan",
                    style: CustomText.profileSubtitleNote(),
                  ),
                ],
              ),
            ],
          ),
        ),
        vspace(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: CustomColor.white,
            child: Column(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      controller.viewSetting();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengaturan",
                                style: CustomText.profileSubtitle(),
                              )
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.settings,
                            color: CustomColor.primary,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        vspace(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: CustomColor.gradientButtonRed),
              borderRadius: BorderRadius.circular(18),
            ),
            child: CustomButton(
              borderColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              onPressed: () {
                return controller.logout();
              },
              buttonName: "Keluar",
              imageRight: SizedBox(
                width: 14,
                height: 14,
                child: Image.asset("assets/icons/ic_exit.png")),
            ),
          ),
        ),
        vspace(40),
      ]
    );
  }
}