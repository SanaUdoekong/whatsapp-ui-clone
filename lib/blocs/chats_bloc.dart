import 'dart:async';
import 'package:flutter/material.dart';

enum ChatAction { read, unread, archive, star, delete }

class ChatsBloc {
  final _stateChatStreamBuilder = StreamController();
  StreamSink get ChatSink => _stateChatStreamBuilder.sink;
  Stream get ChatStream => _stateChatStreamBuilder.stream;

  final _ChatChatStreamBuilder = StreamController<ChatAction>();
  StreamSink<ChatAction> get ChatActionSink => _ChatChatStreamBuilder.sink;
  Stream<ChatAction> get ChatActionStream => _ChatChatStreamBuilder.stream;

  // stringified event metadata
  final Map allChats = {
    "all": [
      {
        'sender': 'John Dee',
        'sener_img': 'assets/images/dummy_peron.png',
        'msg': 'Hello John',
        'time': '12:00',
        'no': 1,
        'action': ChatAction.unread,
      },
      {
        'sender': 'Sana U.',
        'msg': 'What are you up to?',
        'time': '09:00',
        'no': 3,
        'action': ChatAction.unread,
      },
      {
        'sender': 'purplejuice29',
        'msg': 'Thanks @purplejuice29?',
        'time': '12:09',
        'no': 2,
        'action': ChatAction.read,
      },
      {
        'sender': 'Emmanuella',
        'sener_img': 'assets/images/dummy_peron.png',
        'msg': 'Hello John',
        'time': '12:00',
        'no': 1,
        'action': ChatAction.unread,
      },
      {
        'sender': 'Sana U.',
        'msg': 'What are you up to?',
        'time': '09:00',
        'no': 3,
        'action': ChatAction.unread,
      },
      {
        'sender': 'purplejuice29',
        'msg': 'Thanks @purplejuice29?',
        'time': '12:09',
        'no': 3,
        'action': ChatAction.read,
      },
    ],
    'starred': [],
    'archived': [],
  };

  void markAsRead(chat) {
    chat['action'] = ChatAction.read;
    ChatSink.add(allChats);
  }

  void markAsUnread(chat) {
    chat['action'] = ChatAction.unread;
    ChatSink.add(allChats);
  }

  void archive(chat) {
    allChats['archived'].add(chat);
    allChats['all'].remove(chat);
    chat['action'] = ChatAction.archive;
    ChatSink.add(allChats);
  }

  void star(chat) {
    allChats['starred'].add(chat);
    chat['action'] = ChatAction.star;
    ChatSink.add(allChats);
  }

  void delete(chat) {
    allChats['all'].remove(chat);
    chat['action'] = ChatAction.delete;
    ChatSink.add(allChats);
  }

  // void action
}

final ChatBloc = ChatsBloc();
