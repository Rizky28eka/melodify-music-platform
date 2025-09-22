import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/all_songs_model.dart';
import '../../widget/all_song_row.dart';
import '../../AppStyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final AllSongsModel _allSongsModel = Get.put(AllSongsModel());
  List<Map<String, String>> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchResults = _allSongsModel.allList;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _searchResults = _allSongsModel.allList;
      } else {
        _searchResults = _allSongsModel.allList.where((song) {
          final name = song['name']?.toLowerCase() ?? '';
          final artists = song['artists']?.toLowerCase() ?? '';
          return name.contains(query) || artists.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg, 
        elevation: 0,
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: TColor.primaryText),
          decoration: InputDecoration(
            hintText: 'Search for songs, artists...',
            hintStyle: TextStyle(color: TColor.primaryText80),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: TColor.primaryText80),
          ),
        ),
      ),
      body: _searchResults.isEmpty
          ? Center(
              child: Text(
                'No results found',
                style: TextStyle(color: TColor.primaryText80, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                var song = _searchResults[index];
                return AllSongRow(
                  sObj: song,
                  onPressed: () {
                    // TODO: Implement play song
                  },
                  onPressedPlay: () {},
                  onPressedMenu: (item) {
                    // TODO: Implement song menu
                  },
                );
              },
            ),
    );
  }
}
