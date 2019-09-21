// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nuxyoung/Pages/chat/realtimeChat.dart';
// import 'package:nuxyoung/Pages/chat/chat.dart';

class Customcard extends StatefulWidget {
  Customcard({
    @required this.photoUser,
    @required this.username,
    @required this.email,
    @required this.uid,
  });

  final photoUser;
  final username;
  final email;
  final uid;

  @override
  _CustomcardState createState() => _CustomcardState(
        email: email,
        photoUser: photoUser,
        username: username,
        uid: uid,
      );
}

class _CustomcardState extends State<Customcard> {
  FirebaseUser currentUser;
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.currentUser = user;
      });
    });
  }

  _CustomcardState({
    @required this.photoUser,
    @required this.username,
    @required this.email,
    @required this.uid,
  });

  final photoUser;
  final username;
  final email;
  final uid;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              offset: Offset(0, 0),
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        //

        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      // Chat(
                      //       peerAvatar: photoUser,
                      //       peerId: uid,
                      //     )
                      ChatReal(
                        photoUser: photoUser,
                        username: username,
                        uid: uid,
                      )
                  // // Chat(
                  //   photoUser: photoUser,
                  //   username: username,
                  //   user: currentUser,
                  // ),
                  ),
            );
          },
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Material(
                    child: (photoUser != "")
                        ? CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.0,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blueGrey),
                              ),
                              width: 50.0,
                              height: 50.0,
                              padding: EdgeInsets.all(15.0),
                            ),
                            imageUrl: (photoUser),
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.account_circle,
                            size: 58.0,
                            color: Colors.grey,
                          ),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    clipBehavior: Clip.hardEdge,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      username,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.chevron_right,
                      size: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
