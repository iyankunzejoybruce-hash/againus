import 'package:flutter/material.dart';

import '../../domain/entities/couple_info.dart';

/// Sous-page pour renseigner/modifier les informations du couple :
/// date de mise en couple et surnom commun.
class CoupleSubpage extends StatefulWidget {
  const CoupleSubpage({super.key, this.coupleInfo});

  final CoupleInfo? coupleInfo;

  @override
  State<CoupleSubpage> createState() => _CoupleSubpageState();
}

class _CoupleSubpageState extends State<CoupleSubpage> {
  DateTime? _togetherSince;
  late final TextEditingController _nicknameController;

  @override
  void initState() {
    super.initState();
    _togetherSince = widget.coupleInfo?.togetherSince;
    _nicknameController =
        TextEditingController(text: widget.coupleInfo?.coupleNickname ?? '');
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _togetherSince ?? now,
      firstDate: DateTime(now.year - 50),
      lastDate: now,
    );
    if (picked != null) {
      setState(() => _togetherSince = picked);
    }
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notre Couple')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Ensemble depuis'),
            subtitle: Text(
              _togetherSince != null
                  ? '${_togetherSince!.day}/${_togetherSince!.month}/${_togetherSince!.year}'
                  : 'Non défini',
            ),
            trailing: const Icon(Icons.calendar_today_outlined),
            onTap: _pickDate,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nicknameController,
            decoration: const InputDecoration(
              labelText: 'Surnom du couple',
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              // TODO: SettingsController.updateCoupleInfo(...)
              Navigator.pop(context);
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
