import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/artists_model.dart';
import '../../widget/all_song_row.dart';
import '../../AppStyle.dart';

class PlaylistDetailPage extends StatefulWidget {
  final Map playlist;

  const PlaylistDetailPage({super.key, required this.playlist});

  @override
  State<PlaylistDetailPage> createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlaylistDetailPage> {
  // NOTE: Using placeholder data
  final ArtistsModel artVM = Get.put(ArtistsModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        title: Text(widget.playlist["name"]),
      ),
      body: ListView.builder(
        itemCount: artVM.playedArr.length, // Placeholder
        itemBuilder: (context, index) {
          var song = artVM.playedArr[index];
          return AllSongRow(
            sObj: song,
            onPressed: () {},
            onPressedPlay: () {},
            onPressedMenu: (p) {},
          );
        },
      ),
    );
  }
}
