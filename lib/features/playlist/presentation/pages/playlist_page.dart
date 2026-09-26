import 'package:flutter/material.dart';

import '../../domain/entities/song.dart';

/// Page "Notre Playlist" : liste des chansons partagées par le couple,
/// stockées et lues localement (aucun streaming externe).
class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key, this.songs = const []});

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notre Playlist')),
      body: songs.isEmpty
          ? const Center(child: Text('Ajoutez votre première chanson 🎵'))
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: song.coverImagePath != null
                        ? AssetImage(song.coverImagePath!)
                        : null,
                    child: song.coverImagePath == null
                        ? const Icon(Icons.music_note)
                        : null,
                  ),
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      // TODO: brancher un lecteur audio local (just_audio...)
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: sélectionner un fichier audio local à ajouter
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
