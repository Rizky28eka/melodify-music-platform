import 'package:flutter/material.dart';
import 'package:slicing_music_app/widget/all_song_row.dart';
import '../../models/all_songs_model.dart';
import 'package:get/get.dart';

import '../../AppStyle.dart';

class ArtistDetailPage extends StatefulWidget {
  final Map artist;

  const ArtistDetailPage({super.key, required this.artist});

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  late final AllSongsModel allSongsModel;
  late List<Map<String, String>> artistSongs;

  @override
  void initState() {
    super.initState();
    allSongsModel = Get.put(AllSongsModel());
    artistSongs = allSongsModel.allList
        .where((song) => song["artists"] == widget.artist["name"])
        .toList();
  }

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
              title: Text(
                widget.artist["name"],
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.asset(
                widget.artist["image"],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.artist["albums"]} • ${widget.artist["songs"]}",
                    style: TextStyle(color: TColor.primaryText80, fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "All Songs",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var song = artistSongs[index];
                              return AllSongRow(
                                sObj: song,
                                onPressed: () {
                                  // TODO: Implement play song functionality
                                },
                                onPressedPlay: () {},
                                onPressedMenu: (item) {
                                  // TODO: Implement song menu functionality
                                },
                              );            }, childCount: artistSongs.length),
          ),
        ],
      ),
    );
  }
}
