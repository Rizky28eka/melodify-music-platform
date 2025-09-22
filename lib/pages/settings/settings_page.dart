import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_music_app/pages/profile/profile_page.dart';
import '../../AppStyle.dart';
import '../../models/splash_model.dart';

import '../../widget/icon_text_row.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.find<SplashModel>().openDrawer();
          },
          icon: Image.asset(
            "assets/img/menu.png",
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          IconTextRow(
            title: "Profile",
            icon: "assets/img/s_menu.png", // Using a placeholder icon
            onTap: () {
              Get.to(() => const ProfilePage());
            },
          ),
          const Divider(color: Colors.white12, height: 1),
          IconTextRow(
            title: "Display",
            icon: "assets/img/s_display.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Audio",
            icon: "assets/img/s_audio.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Headset",
            icon: "assets/img/s_headset.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Lock Screen",
            icon: "assets/img/s_lock_screen.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Advanced",
            icon: "assets/img/s_menu.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Other",
            icon: "assets/img/s_other.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
