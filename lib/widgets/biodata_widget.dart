import 'package:flutter/material.dart';
import 'package:transforms/models/user_model.dart';
import 'package:transforms/styles/colors.dart';
import 'package:transforms/styles/text.dart';
import 'package:transforms/tools/helper.dart';

class BiodataWidget extends StatelessWidget {
  final Function() changeNameAction;
  final Function() changeBadgeAction;
  final Function() changePasswordAction;
  final Function() changePhoneAction;
  final UserModel profile;

  const BiodataWidget({
    super.key,
    required this.changeNameAction,
    required this.changeBadgeAction,
    required this.changePasswordAction,
    required this.changePhoneAction, 
    required this.profile, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: CustomColor.white,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: changeBadgeAction,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor Karyawan",
                              style: CustomText.profileTitle(),
                            ),
                            vspace(3),
                            Text(
                              profile.id,
                              style: CustomText.profileSubtitle(),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: CustomColor.primary,
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
                onTap: changeNameAction,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama",
                              style: CustomText.profileTitle(),
                            ),
                            vspace(3),
                            Text(
                              profile.name,
                              style: CustomText.profileSubtitle(),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: CustomColor.primary,
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
                onTap: changeNameAction,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor Telepon",
                              style: CustomText.profileTitle(),
                            ),
                            vspace(3),
                            Text(
                              profile.phone,
                              style: CustomText.profileSubtitle(),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: CustomColor.primary,
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
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: changePasswordAction,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kata Sandi",
                              style: CustomText.profileTitle(),
                            ),
                            vspace(3),
                            Text(
                              '******',
                              style: CustomText.profileSubtitle(),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: CustomColor.primary,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
