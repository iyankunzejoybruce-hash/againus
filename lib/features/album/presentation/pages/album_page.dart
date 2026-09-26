import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/utils/image_picker_helper.dart';
import '../../domain/entities/photo_item.dart';

/// Page "Notre Album" : grille de photos privées stockées localement.
class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key, this.photos = const []});

  final List<PhotoItem> photos;

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late List<PhotoItem> _photos;

  @override
  void initState() {
    super.initState();
    _photos = List.of(widget.photos);
  }

  Future<void> _addPhotos() async {
    final files = await ImagePickerHelper.pickMultipleFromGallery();
    if (files.isEmpty) return;
    setState(() {
      _photos.addAll(files.map(
        (f) => PhotoItem(
          id: f.path,
          filePath: f.path,
          addedAt: DateTime.now(),
        ),
      ));
    });
    // TODO: AlbumRepository.addPhoto(...) pour chaque fichier
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notre Album')),
      body: _photos.isEmpty
          ? const Center(child: Text('Ajoutez vos premiers souvenirs 📷'))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: _photos.length,
              itemBuilder: (context, index) {
                final photo = _photos[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.file(
                    File(photo.filePath),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPhotos,
        child: const Icon(Icons.add_photo_alternate_outlined),
      ),
    );
  }
}
