import 'package:flutter/material.dart';

import '../../../../core/utils/image_picker_helper.dart';
import '../../domain/entities/user_profile.dart';

/// Sous-page permettant à chaque partenaire de modifier
/// son propre profil (nom, surnom, photo, date de naissance).
class ProfilesSubpage extends StatefulWidget {
  const ProfilesSubpage({super.key, this.profile});

  final UserProfile? profile;

  @override
  State<ProfilesSubpage> createState() => _ProfilesSubpageState();
}

class _ProfilesSubpageState extends State<ProfilesSubpage> {
  late final TextEditingController _nameController;
  late final TextEditingController _nicknameController;
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.profile?.displayName ?? '');
    _nicknameController =
        TextEditingController(text: widget.profile?.nickname ?? '');
    _avatarPath = widget.profile?.avatarPath;
  }

  Future<void> _pickAvatar() async {
    final file = await ImagePickerHelper.pickFromGallery();
    if (file != null) {
      setState(() => _avatarPath = file.path);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon profil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: GestureDetector(
              onTap: _pickAvatar,
              child: CircleAvatar(
                radius: 48,
                backgroundImage:
                    _avatarPath != null ? AssetImage(_avatarPath!) : null,
                child: _avatarPath == null
                    ? const Icon(Icons.add_a_photo_outlined, size: 32)
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nom affiché'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nicknameController,
            decoration: const InputDecoration(labelText: 'Petit surnom'),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              // TODO: sauvegarder via SettingsController.updateProfile
              Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
