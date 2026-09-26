import 'package:flutter/material.dart';

/// Sous-page permettant de choisir le thème : clair, sombre ou système.
class AppearanceSubpage extends StatefulWidget {
  const AppearanceSubpage({super.key, this.initialMode = 'system'});

  final String initialMode;

  @override
  State<AppearanceSubpage> createState() => _AppearanceSubpageState();
}

class _AppearanceSubpageState extends State<AppearanceSubpage> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apparence')),
      body: Column(
        children: [
          RadioListTile<String>(
            title: const Text('Clair'),
            value: 'light',
            groupValue: _selected,
            onChanged: (v) => setState(() => _selected = v!),
          ),
          RadioListTile<String>(
            title: const Text('Sombre'),
            value: 'dark',
            groupValue: _selected,
            onChanged: (v) => setState(() => _selected = v!),
          ),
          RadioListTile<String>(
            title: const Text('Automatique (système)'),
            value: 'system',
            groupValue: _selected,
            onChanged: (v) => setState(() => _selected = v!),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: () {
                // TODO: SettingsController.updateThemeMode(_selected)
                Navigator.pop(context, _selected);
              },
              child: const Text('Appliquer'),
            ),
          ),
        ],
      ),
    );
  }
}
