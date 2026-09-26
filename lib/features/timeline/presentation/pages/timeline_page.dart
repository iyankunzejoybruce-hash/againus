import 'package:flutter/material.dart';

import '../../domain/entities/memory.dart';

/// Page "Notre Histoire" : ligne du temps verticale des souvenirs du couple.
class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key, this.memories = const []});

  final List<Memory> memories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notre Histoire')),
      body: memories.isEmpty
          ? const Center(child: Text('Votre histoire commence ici 📖'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: memories.length,
              itemBuilder: (context, index) {
                final memory = memories[index];
                final isLast = index == memories.length - 1;
                return _TimelineTile(memory: memory, isLast: isLast);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: ouvrir un formulaire d'ajout de souvenir
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({required this.memory, required this.isLast});

  final Memory memory;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const CircleAvatar(radius: 6),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${memory.date.day}/${memory.date.month}/${memory.date.year}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        memory.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(memory.description),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
