import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/blocs/chats_bloc.dart';
import 'package:whatsapp_clone/components/chat_tile.dart';
import 'package:whatsapp_clone/configs/colors.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    /** Configurations for the tab widths */
    double deviceWidth = MediaQuery.of(context).size.width;
    double cameraTabWidth = deviceWidth / 54;
    double myLabelPadding = (deviceWidth - cameraTabWidth) / 5;

    // getting chats from the chats bloc
    final chats = ChatBloc.allChats;

    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          centerTitle: false,
          backgroundColor: AppColors.tealGreenDark,
          actions: const [
            // search icon
            Icon(Icons.search),
            // more icon
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            tabs: [
              // camera tab
              SizedBox(
                width: cameraTabWidth,
                child: Center(
                  child: Icon(CupertinoIcons.camera_fill),
                ),
              ),
              // chats tab
              SizedBox(
                width: myLabelPadding,
                child: Center(
                  child: Row(
                    children: [
                      Text('CHATS'),
                      SizedBox(width: 5),
                      Container(
                        height: 18,
                        width: 18,
                        child: Center(
                          child: Text(
                            chats['all'].length.toString(),
                            style: const TextStyle(
                              color: AppColors.tealGreenDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              // status tab
              SizedBox(
                width: myLabelPadding,
                child: Center(
                  child: Text('STATUS'),
                ),
              ),
              // calls tab
              SizedBox(
                width: myLabelPadding,
                child: Center(
                  child: Text('CALLS'),
                ),
              ),
            ],
            isScrollable: true,
            indicatorColor: AppColors.whiteColor,
            indicatorWeight: 3.0,
            labelPadding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal:
                    (deviceWidth - (cameraTabWidth + myLabelPadding * 3)) / 8),
          ),
        ),
        body: TabBarView(
          children: [
            const Center(child: Text('Camera')),

            // returns all chats
            ListView.builder(
              itemCount: chats['all'].length,
              itemBuilder: (context, index) {
                return ChatTile(event: chats['all'][index]);
              },
            ),
            const Center(child: Text('Status')),
            const Center(child: Text('Calls')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.tealGreen,
          onPressed: () {},
          tooltip: 'New chat',
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
