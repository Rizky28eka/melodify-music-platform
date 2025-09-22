import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './playlist_detail_page.dart';
import '../../models/playlists_model.dart';
import '../../widget/my_playlist_cell.dart';
import '../../widget/playlist_songs_cell.dart';
import '../../widget/view_all_section.dart';
import '../../AppStyle.dart';

class PlaylistsPage extends StatefulWidget {
  const PlaylistsPage({super.key});

  @override
  State<PlaylistsPage> createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  final plVM = Get.put(PlaylistsModel());
  final TextEditingController _playlistNameController = TextEditingController();

  void _showCreatePlaylistDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff383B49),
          title: const Text('Create New Playlist', style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: _playlistNameController,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter playlist name',
              hintStyle: TextStyle(color: Colors.white54)
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            TextButton(
              onPressed: () {
                if (_playlistNameController.text.isNotEmpty) {
                  // TODO: Add logic to actually create the playlist
                  plVM.myPlaylistArr.add({
                    "image": "assets/img/mp_3.png", // Placeholder image
                    "name": _playlistNameController.text,
                  });
                  _playlistNameController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Create', style: TextStyle(color: TColor.primary)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff23273B),
        onPressed: _showCreatePlaylistDialog,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset("assets/img/add.png"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: plVM.playlistArr.length,
                itemBuilder: (context, index) {
                  var pObj = plVM.playlistArr[index];
                  return PlaylistSongsCell(
                    pObj: pObj,
                    onPressed: () {},
                    onPressedPlay: () {},
                  );
                },
              ),
            ),
            ViewAllSection(title: "My Playlists", onPressed: () {}),
            SizedBox(
              height: 150,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: plVM.myPlaylistArr.length,
                  itemBuilder: (context, index) {
                    var pObj = plVM.myPlaylistArr[index];

                    return MyPlaylistCell(pObj: pObj, onPressed: () {
                       Get.to(() => PlaylistDetailPage(playlist: pObj));
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
