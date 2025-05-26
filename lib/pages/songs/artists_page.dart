import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/artists_model.dart';
import '../../widget/artist_row.dart';
import 'artist_details_page.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  final artVM = Get.put(ArtistsModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          itemCount: artVM.allList.length,
          itemBuilder: (context, index) {
            var aObj = artVM.allList[index];

            return ArtistRow(
              aObj: aObj,
              onPressed: () {
                Get.to(() => const ArtistDetailsView());
              },
              onPressedMenuSelect: (selectIndex) {},
            );
          },
        ),
      ),
    );
  }
}
