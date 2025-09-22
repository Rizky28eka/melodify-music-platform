import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/artists_model.dart';
import '../../widget/album_song_row.dart';
import '../../AppStyle.dart';

class AlbumDetailPage extends StatefulWidget {
  final Map album;

  const AlbumDetailPage({super.key, required this.album});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  // NOTE: The current data model doesn't link songs to albums.
  // This is using a placeholder list of songs for demonstration.
  final ArtistsModel artVM = Get.put(ArtistsModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: TColor.primary,
            expandedHeight: media.width * 0.8,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.album["name"],
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.album["artists"],
                    style: TextStyle(
                      color: TColor.primaryText80,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              background: Image.asset(
                widget.album["image"],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var song = artVM.playedArr[index];
                return AlbumSongRow(
                  sObj: song,
                  isPlay: index == 0, // Example: highlight the first song
                  onPressed: () {
                    // TODO: Implement play song from album
                  },
                  onPressedPlay: () {},
                );
              },
              childCount: artVM.playedArr.length, // Using placeholder data
            ),
          ),
        ],
      ),
    );
  }
}
