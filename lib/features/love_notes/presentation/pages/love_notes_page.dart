import 'package:flutter/material.dart';

import '../../domain/entities/love_note.dart';

/// Page listant les petits mots doux échangés, avec possibilité
/// d'en écrire un nouveau via un bouton flottant.
class LoveNotesPage extends StatefulWidget {
  const LoveNotesPage({super.key, this.notes = const []});

  final List<LoveNote> notes;

  @override
  State<LoveNotesPage> createState() => _LoveNotesPageState();
}

class _LoveNotesPageState extends State<LoveNotesPage> {
  Future<void> _openComposer() async {
    final controller = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Écris un petit mot doux...',
                ),
                autofocus: true,
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () {
                  // TODO: LoveNotesRepository.addNote(...)
                  Navigator.pop(context);
                },
                child: const Text('Envoyer'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nos petits mots')),
      body: widget.notes.isEmpty
          ? const Center(
              child: Text('Aucun mot doux pour le moment 💌'),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: widget.notes.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final note = widget.notes[index];
                return Card(
                  child: ListTile(
                    leading: Text(
                      note.emoji ?? '💌',
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(note.content),
                    subtitle: Text(
                      '${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}',
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openComposer,
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }
}
