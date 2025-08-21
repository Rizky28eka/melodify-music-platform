import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppStyle.dart';
import '../../models/splash_model.dart';
import '../../widget/icon_text_row.dart';
import '../home/home_page.dart';
import '../settings/settings_page.dart';
import '../songs/songs_page.dart';

class SlideTabPage extends StatefulWidget {
  const SlideTabPage({super.key});

  @override
  State<SlideTabPage> createState() => _SlideTabPageState();
}

class _SlideTabPageState extends State<SlideTabPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);

    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    var splashVM = Get.find<SplashModel>();

    return Scaffold(
      key: splashVM.scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xff10121D),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 260,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: TColor.primaryText.withOpacity(0.03),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/img/app_logo.png",
                      width: media.width * 0.17,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "323\nSongs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffC1C0C0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "52\nAlbums",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffC1C0C0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "87\nArtists",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffC1C0C0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IconTextRow(
              title: "Themes",
              icon: "assets/img/m_theme.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Ringtone Cutter",
              icon: "assets/img/m_ring_cut.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Sleep Timer",
              icon: "assets/img/m_sleep_timer.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Equalizer",
              icon: "assets/img/m_eq.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Driver Mode",
              icon: "assets/img/m_driver_mode.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Hidden Folders",
              icon: "assets/img/m_hidden_folder.png",
              onTap: () {},
            ),
            IconTextRow(
              title: "Scan Media",
              icon: "assets/img/m_scan_media.png",
              onTap: () {},
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [HomePage(), SongsPage(), SettingsPage()],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: TColor.bg,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: TColor.primary,
            labelStyle: const TextStyle(fontSize: 10),
            unselectedLabelColor: TColor.primaryText28,
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            tabs: [
              Tab(
                text: "Home",
                icon: Image.asset(
                  selectTab == 0
                      ? "assets/img/home_tab.png"
                      : "assets/img/home_tab_un.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Tab(
                text: "Songs",
                icon: Image.asset(
                  selectTab == 1
                      ? "assets/img/songs_tab.png"
                      : "assets/img/songs_tab_un.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Tab(
                text: "Settings",
                icon: Image.asset(
                  selectTab == 2
                      ? "assets/img/songs_tab.png"
                      : "assets/img/setting_tab_un.png",
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
