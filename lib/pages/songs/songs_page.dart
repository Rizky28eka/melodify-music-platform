import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppStyle.dart';
import '../../models/splash_model.dart';
import 'albums_page.dart';
import 'all_songs_page.dart';
import 'artists_page.dart';
import 'genres_page.dart';
import 'playlists_page.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({super.key});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.find<SplashModel>().openDrawer();
          },
          icon: Image.asset(
            "assets/img/menu.png",
            width: 25,
            height: 25,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Songs",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.find<SplashModel>().openDrawer();
            },
            icon: Image.asset(
              "assets/img/search.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: TColor.primaryText35,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight - 15,
            child: TabBar(
              controller: controller,
              indicatorColor: TColor.focus,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              isScrollable: true,
              labelColor: TColor.focus,
              labelStyle: TextStyle(
                color: TColor.focus,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: TColor.primaryText80,
              unselectedLabelStyle: TextStyle(
                color: TColor.primaryText80,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: "All Songs"),
                Tab(text: "Playlists"),
                Tab(text: "Albums"),
                Tab(text: "Artists"),
                Tab(text: "Genres"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                AllSongsPage(),
                PlaylistsPage(),
                AlbumPage(),
                ArtistsPage(),
                GenresPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
