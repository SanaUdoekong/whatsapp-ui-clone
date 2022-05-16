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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double cameraTabWidth = deviceWidth / 54;
    double myLabelPadding = (deviceWidth - cameraTabWidth) / 5;
    final chats = ChatBloc.allChats;
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the Chats object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("WhatsApp"),
          centerTitle: false,
          backgroundColor: AppColors.tealGreenDark,
          actions: const [
            Icon(Icons.search),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
            tabs: [
              SizedBox(
                width: cameraTabWidth,
                child: Center(
                  child: Icon(CupertinoIcons.camera_fill),
                ),
              ),
              SizedBox(
                width: myLabelPadding,
                child: Center(
                  child: Text('CHATS'),
                ),
              ),
              SizedBox(
                width: myLabelPadding,
                child: Center(
                  child: Text('STATUS'),
                ),
              ),
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
            Center(child: Text('Camera')),
            ListView.builder(
              itemCount: chats['all'].length,
              itemBuilder: (context, index) {
                return ChatTile(event: chats['all'][index]);
              },
            ),
            Center(child: Text('Status')),
            Center(child: Text('Calls')),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.tealGreen,
          onPressed: _incrementCounter,
          tooltip: 'New chat',
          child: const Icon(Icons.chat),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
