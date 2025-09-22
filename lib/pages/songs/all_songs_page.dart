import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/all_songs_model.dart';
import '../../widget/all_song_row.dart';
import '../player/main_player_page.dart';

class AllSongsPage extends StatefulWidget {
  const AllSongsPage({super.key});

  @override
  State<AllSongsPage> createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  final allVM = Get.put(AllSongsModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: allVM.allList.length,
          itemBuilder: (context, index) {
            var sObj = allVM.allList[index];

            return AllSongRow(
              sObj: sObj,
              onPressed: () {},
              onPressedPlay: () {
                Get.to(() => const MainPlayerPage());
              },
              onPressedMenu: (p0) {},
            );
          },
        ),
      ),
    );
  }
}
