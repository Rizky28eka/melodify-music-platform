import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_music_app/models/all_songs_model.dart';
import 'package:slicing_music_app/widget/all_song_row.dart';
import '../../AppStyle.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  final AllSongsModel songsVM = Get.put(AllSongsModel());

  @override
  Widget build(BuildContext context) {
    // Using a subset of all songs as placeholder for downloaded songs
    final downloadedSongs = songsVM.allList.take(5).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        title: const Text('Downloads'),
      ),
      body: downloadedSongs.isEmpty
          ? Center(
              child: Text(
                'No downloaded songs yet.',
                style: TextStyle(color: TColor.primaryText80, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              itemCount: downloadedSongs.length,
              itemBuilder: (context, index) {
                var song = downloadedSongs[index];
                return AllSongRow(
                  sObj: song,
                  onPressed: () {},
                  onPressedPlay: () {},
                  onPressedMenu: (p0) {},
                );
              },
            ),
    );
  }
}
