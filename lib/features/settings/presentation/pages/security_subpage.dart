import 'package:flutter/material.dart';

/// Sous-page de sécurité : activer/désactiver un verrouillage par code
/// pour protéger l'accès à l'application privée du couple.
class SecuritySubpage extends StatefulWidget {
  const SecuritySubpage({super.key, this.initialEnabled = false});

  final bool initialEnabled;

  @override
  State<SecuritySubpage> createState() => _SecuritySubpageState();
}

class _SecuritySubpageState extends State<SecuritySubpage> {
  late bool _lockEnabled;
  final _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _lockEnabled = widget.initialEnabled;
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sécurité')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Verrouillage par code'),
            subtitle: const Text(
              "Demander un code à chaque ouverture de l'application",
            ),
            value: _lockEnabled,
            onChanged: (v) => setState(() => _lockEnabled = v),
          ),
          if (_lockEnabled) ...[
            const SizedBox(height: 16),
            TextField(
              controller: _pinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'Code à 4-6 chiffres',
              ),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              // TODO: SettingsController.toggleAppLock + setAppLockPin
              Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
