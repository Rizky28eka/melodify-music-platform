import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slicing_music_app/models/all_songs_model.dart';
import 'package:slicing_music_app/models/artists_model.dart';
import 'package:slicing_music_app/widget/all_song_row.dart';
import 'package:slicing_music_app/widget/artist_row.dart';

import '../../AppStyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ArtistsModel artistsVM = Get.put(ArtistsModel());
  final AllSongsModel songsVM = Get.put(AllSongsModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/img/player_image.png",
                ), // Placeholder image
              ),
              const SizedBox(height: 12),
              Text(
                "Rizky 28 Eka", // Placeholder name
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "rizky28eka@gemini.com", // Placeholder email
                style: TextStyle(color: TColor.primaryText80, fontSize: 14),
              ),
              const SizedBox(height: 30),

              // Top Artists Section
              _buildSectionTitle("Top Artists This Month"),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3, // Display top 3
                itemBuilder: (context, index) {
                  var artist = artistsVM.allList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ArtistRow(
                      aObj: artist,
                      onPressed: () {},
                      onPressedMenuSelect: (p0) {},
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Frequently Played Section
              _buildSectionTitle("Frequently Played"),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4, // Display top 4
                itemBuilder: (context, index) {
                  var song = songsVM.allList[index];
                  return AllSongRow(
                    sObj: song,
                    onPressed: () {},
                    onPressedPlay: () {},
                    onPressedMenu: (p0) {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
