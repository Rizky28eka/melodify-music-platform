import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import '../../audio_helpers/page_manager.dart';
import '../../audio_helpers/service_locator.dart';
import '../../AppStyle.dart';

class LyricsPage extends StatelessWidget {
  const LyricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    const lyrics = "\n(Verse 1)\nShe was more like a beauty queen from a movie scene\nI said don\'t mind, but what do you mean, I am the one\nWho will dance on the floor in the round?\nShe said I am the one, who will dance on the floor in the round\n\n(Verse 2)\nShe told me her name was Billie Jean, as she caused a scene\nThen every head turned with eyes that dreamed of being the one\nWho will dance on the floor in the round\n\n(Pre-Chorus)\nPeople always told me, be careful of what you do\nAnd don\'t go around breaking young girls\' hearts\nAnd mother always told me, be careful of who you love\nAnd be careful of what you do, \'cause the lie becomes the truth\n\n(Chorus)\nBillie Jean is not my lover\nShe\'s just a girl who claims that I am the one\nBut the kid is not my son\nShe says I am the one, but the kid is not my son\n";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        title: ValueListenableBuilder<MediaItem?>(
          valueListenable: pageManager.currentSongNotifier,
          builder: (_, mediaItem, __) {
            return Text("Lyrics - ${mediaItem?.title ?? ''}");
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: const SingleChildScrollView(
          child: Text(
            lyrics,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
