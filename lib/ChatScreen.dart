import 'package:flutter/material.dart';
import 'package:petshelt/MessageModel.dart';
import 'package:petshelt/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? loggedInUser;

class ChatScreen extends StatefulWidget {
  final Userr user;
  ChatScreen({required this.user});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? messageText;
  _chatBubble(Message message, bool isMe, bool isSameUser){
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(// container in container to make the words small
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *0.90,
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(118, 189, 178, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  bottomLeft: Radius.circular(17),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          !isSameUser
              ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                message.time,
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 10,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
          :
          Container(
                child: null,
              ),
        ],
      );
    } else{
      return Column(
        children: <Widget>[
          Container(// container in container to make the words small
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *0.90,
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(237, 237, 237, 5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                  bottomRight: Radius.circular(17),
                ),
                boxShadow: [//read
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(message.text,
                style: TextStyle(
                  fontFamily: "Inter",
                ),),
            ),
          ),
          !isSameUser?
          Row(
            children: [
              Text(message.time,style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 10),)],
          )
              :
              Container(
                child: null,
              )
        ],
      );
    }
  }

  _sendMessageArea(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      color: Color.fromRGBO(237, 237, 237, 5),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.attach_file),
              iconSize: 30,
              color: Colors.black54,
              onPressed: (){},
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.keyboard_voice),
              iconSize: 30,
              color: Colors.black54,
          ),
          Expanded(
            child: TextField(
              onChanged: (value){
                messageText = value;
              },
            ),
          ),
          TextButton(
            onPressed: (){
              _firestore.collection('messages').add({
                'text':messageText,
                'sender':loggedInUser!.email,
              }
              );
            },
            child: Text(
              'Send',
              style: TextStyle(
              color: Colors.black54,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          )
        ],
       ),
    );
  }
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int? prevUserId;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(118, 189, 178, 1),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: widget.user.name,
                  style: TextStyle(fontSize: 25,
                      fontFamily: "Inter",
                  )
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () { // to get back to previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(15),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index ){
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            )
          ),
           _sendMessageArea(),

        ],
      )
    );
  }
}
