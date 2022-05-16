import 'package:flutter/material.dart';
import 'package:whatsapp_clone/blocs/chats_bloc.dart';
import 'package:whatsapp_clone/configs/colors.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({required this.event});

  final dynamic event;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  final bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.event['action'] = ChatAction.read;
        });
      },
      title: Text(widget.event['sender'] ?? 'Lorem ipsum dolor'),
      subtitle: Text(widget.event['msg'] ?? 'Lorem ipsum dolor sit amet ...'),
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          widget.event['sender_img'] ?? 'assets/images/dummy_peron.png',
        ),
      ),
      trailing: widget.event['action'] == ChatAction.read
          ? Text(
              widget.event['time'].toString(),
              style: const TextStyle(fontSize: 11),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.event['time'] ?? '00:00',
                  style: TextStyle(
                    color: AppColors.tealGreen,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  child: Center(
                    child: Text(
                      widget.event['no'].toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGreen,
                  ),
                ),
              ],
            ),
    );
  }
}
