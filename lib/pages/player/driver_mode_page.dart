import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppStyle.dart';
import 'play_playlist_page.dart';

class DriverModePage extends StatefulWidget {
  const DriverModePage({super.key});

  @override
  State<DriverModePage> createState() => _DriverModePageState();
}

class _DriverModePageState extends State<DriverModePage> {
  var silderVal = 0.7;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "assets/img/close.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Driver Mode",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const PlayPlayListPage());
            },
            icon: Image.asset(
              "assets/img/playlist.png",
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(media.width * 0.2),
                  child: Image.asset(
                    "assets/img/player_image.png",
                    width: media.width * 0.4,
                    height: media.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: media.width * 0.4,
                  height: media.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColor.primaryText28, width: 2),
                    borderRadius: BorderRadius.circular(media.width * 0.2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              "Black or White",
              style: TextStyle(
                color: TColor.primaryText.withOpacity(0.9),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Michael Jackson • Album - Dangerous",
              style: TextStyle(color: TColor.primaryText60, fontSize: 12),
            ),
            const SizedBox(height: 20),
            Text(
              "232/327",
              style: TextStyle(color: TColor.primaryText60, fontSize: 12),
            ),
            const SizedBox(height: 60),
            Slider(
              value: silderVal,
              activeColor: TColor.focus,
              inactiveColor: TColor.primaryText28,
              onChanged: (newVal) {
                setState(() {
                  silderVal = newVal;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "3:35",
                    style: TextStyle(color: TColor.primaryText60, fontSize: 12),
                  ),
                  Text(
                    "4:26",
                    style: TextStyle(color: TColor.primaryText60, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/previous_song.png"),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/play.png"),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/next_song.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
