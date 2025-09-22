import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_service/audio_service.dart';
import 'package:slicing_music_app/audio_helpers/page_manager.dart';
import 'package:slicing_music_app/audio_helpers/service_locator.dart';
import '../../AppStyle.dart';

class BehindTheSongPage extends StatelessWidget {
  const BehindTheSongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: TColor.primary.withOpacity(0.8),
            expandedHeight: 250.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: ValueListenableBuilder<MediaItem?>(
                valueListenable: pageManager.currentSongNotifier,
                builder: (_, mediaItem, __) {
                  return Text(
                    mediaItem?.title ?? "Behind the Song",
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              background: ValueListenableBuilder<MediaItem?>(
                valueListenable: pageManager.currentSongNotifier,
                builder: (_, mediaItem, __) {
                  return mediaItem?.artUri != null
                      ? Image.network(
                          mediaItem!.artUri.toString(),
                          fit: BoxFit.cover,
                        )
                      : Container(color: TColor.primary);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Tentang Lagu Ini"),
                  _buildBodyText(
                    "'Billie Jean' adalah lagu oleh penyanyi Amerika Michael Jackson, dirilis oleh Epic Records pada 2 Januari 1983, sebagai single kedua dari album studio keenamnya, Thriller (1982). Lagu ini ditulis dan dikomposisikan oleh Jackson dan diproduksi oleh Jackson dan Quincy Jones.",
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Kredit Penulis"),
                  _buildBodyText(
                    "Michael Jackson, Quincy Jones, Leon 'Ndugu' Chancler",
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Fakta Menarik"),
                  _buildFactItem(
                    "Bassline ikonik lagu ini dimainkan oleh Louis Johnson.",
                  ),
                  _buildFactItem(
                    "Video musiknya, yang disutradarai oleh Steve Barron, adalah video pertama oleh artis kulit hitam yang ditayangkan secara besar-besaran di MTV.",
                  ),
                  _buildFactItem(
                    "Jackson menampilkan 'moonwalk' untuk pertama kalinya saat membawakan lagu ini di acara TV Motown 25: Yesterday, Today, Forever.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: TColor.primary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBodyText(String text) {
    return Text(
      text,
      style: TextStyle(color: TColor.primaryText80, fontSize: 16, height: 1.5),
    );
  }

  Widget _buildFactItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0, right: 8.0),
            child: Icon(Icons.music_note, color: TColor.primary, size: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
