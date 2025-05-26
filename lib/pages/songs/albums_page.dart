import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/albums_model.dart';
import '../../widget/album_cell.dart' show AlbumCell;
import 'album_details_page.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final albumVM = Get.put(AlbumModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    var cellWidth = (media.width - 40.0 - 20.0) * 0.5;

    return Scaffold(
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: cellWidth / (cellWidth + 50),
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: albumVM.allList.length,
          itemBuilder: (context, index) {
            var aObj = albumVM.allList[index];
            return AlbumCell(
              aObj: aObj,
              onPressed: () {
                Get.to(() => const AlbumDetailsPage());
              },
              onPressedMenu: (selectIndex) {
                if (kDebugMode) {
                  print(index);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
