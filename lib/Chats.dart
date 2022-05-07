import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:petshelt/MessageModel.dart';
import 'package:petshelt/ChatScreen.dart';

class Chats extends StatefulWidget {
  static const String routeName = 'Chats';

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(118, 189, 178, 1),
              title: const Text(
                'Chats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Inter",
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index){
                final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(//push another screen .. provide route here
                  builder: (_) => ChatScreen(
                    user: chat.sender,

                  )
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(padding: EdgeInsets.all(2),
                        decoration: chat.unread //if message unread use this box
                            ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(
                            width: 2,
                            color: Color.fromRGBO(118, 189, 178, 1),
                          ),
                          // shape: BoxShape.circle,
                          boxShadow: [//unread
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],// otherwise use this shape
                        )
                            : BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [//read
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(chat.sender.imageUrl),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75, //define the width of the container
                        padding: EdgeInsets.only(left: 20,),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(chat.sender.name, style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter",
                                ),),
                                Text(chat.time, style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Inter",
                                  color: Colors.black54,
                                ),)
                              ],
                            ),
                            SizedBox(
                              height:5, //space between name and message
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(chat.text,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Inter",
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            )
        )
    );
  }
}

