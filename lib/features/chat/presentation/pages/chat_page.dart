import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool senderIsHim = true;
  final TextEditingController _controller = TextEditingController();

  final List<Message> messages = [
    Message(text: 'Bonjour mon amour 🌸', time: '09:12', isMe: false),
    Message(text: 'Bonjour ma chérie, tu as bien dormi ? 💕', time: '09:15', isMe: true),
    Message(text: 'Oui ! J\'ai rêvé de toi encore haha ✨', time: '09:16', isMe: false),
    Message(text: 'Comme toutes les nuits pour moi 💖', time: '09:18', isMe: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          children: [
            Text('Conversation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Notre fil de messages privés', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Align(
                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: msg.isMe ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAlignment: msg.isMe ? CrossAlignment.end : CrossAlignment.start,
                      children: [
                        Text(
                          msg.text,
                          style: TextStyle(color: msg.isMe ? Colors.white : AppColors.textDark, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg.time,
                          style: TextStyle(color: msg.isMe ? Colors.white70 : AppColors.textMuted, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    ChoiceChip(
                      label: const Text('Lui'),
                      selected: senderIsHim,
                      selectedColor: AppColors.primaryLight,
                      onSelected: (val) => setState(() => senderIsHim = true),
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('Elle'),
                      selected: !senderIsHim,
                      selectedColor: AppColors.primaryLight,
                      onSelected: (val) => setState(() => senderIsHim = false),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Écris un message...',
                          filled: true,
                          fillColor: AppColors.background,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white, size: 18),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              messages.add(Message(text: _controller.text, time: '09:20', isMe: senderIsHim));
                              _controller.clear();
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}