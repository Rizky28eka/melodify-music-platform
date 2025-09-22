import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import '../../audio_helpers/page_manager.dart';
import '../../audio_helpers/service_locator.dart';
import '../../AppStyle.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        title: const Text('Now Playing'),
      ),
      body: ValueListenableBuilder<List<MediaItem>>(
        valueListenable: pageManager.playlistNotifier,
        builder: (context, playlist, _) {
          if (playlist.isEmpty) {
            return const Center(
              child: Text('Queue is empty'),
            );
          }
          return ReorderableListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final mediaItem = playlist[index];
              return Dismissible(
                key: ValueKey(mediaItem.id),
                background: Container(
                  color: Colors.redAccent,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                onDismissed: (direction) {
                  pageManager.removeQueueItemAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${mediaItem.title} removed from queue')),
                  );
                },
                child: ListTile(
                  key: ValueKey(mediaItem.id), // Important for ReorderableListView
                  leading: Image.network(mediaItem.artUri.toString(), width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(mediaItem.title, style: TextStyle(color: TColor.primaryText)),
                  subtitle: Text(mediaItem.artist ?? '', style: TextStyle(color: TColor.primaryText80)),
                  onTap: () => pageManager.skipToQueueItem(index),
                ),
              );
            },
            onReorder: (oldIndex, newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              pageManager.moveMediaItem(oldIndex, newIndex);
            },
          );
        },
      ),
    );
  }
}
