import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuncdating/services/global.dart';

class LikeSentLikeReceived extends StatefulWidget {
  const LikeSentLikeReceived({super.key});

  @override
  State<LikeSentLikeReceived> createState() => _LikeSentLikeReceivedState();
}

class _LikeSentLikeReceivedState extends State<LikeSentLikeReceived> {
  bool isLikeSentClicked = true;
  List<String> likeSentList = [];
  List<String> likeReceivedList = [];
  List likedList = [];

  getLikedListKeys() async {
    if (isLikeSentClicked) {
      var favoriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId.toString())
          .collection("likeSent")
          .get();

      for (int i = 0; i < favoriteSentDocument.docs.length; i++) {
        likeSentList.add(favoriteSentDocument.docs[i].id);
      }

      log("likeSentList = $likeSentList");
      getKeysDataFromUsersCollection(likeSentList);
    } else {
      var favoriteReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId.toString())
          .collection("likeReceived")
          .get();

      for (int i = 0; i < favoriteReceivedDocument.docs.length; i++) {
        likeReceivedList.add(favoriteReceivedDocument.docs[i].id);
      }

      log("likeReceivedList = $likeReceivedList");
      getKeysDataFromUsersCollection(likeReceivedList);
    }
  }

  getKeysDataFromUsersCollection(List<String> keysList) async {
    var allUsersDocument =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < allUsersDocument.docs.length; i++) {
      for (int k = 0; k < keysList.length; k++) {
        if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) ==
            keysList[k]) {
          likedList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      likedList;
    });

    log("likesList = $likedList");
  }

  @override
  void initState() {
    super.initState();

    getLikedListKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                likeSentList.clear();
                likeSentList = [];
                likeReceivedList.clear();
                likeReceivedList = [];
                likedList.clear();
                likedList = [];

                setState(() {
                  isLikeSentClicked = true;
                });

                // getFavoriteListKeys();
              },
              child: Text(
                "My Likes",
                style: TextStyle(
                  color: isLikeSentClicked ? Colors.red[900] : Colors.red[500],
                  fontWeight:
                      isLikeSentClicked ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              "   |   ",
              style: TextStyle(
                color: Colors.red[900]!,
              ),
            ),
            TextButton(
              onPressed: () {
                likeSentList.clear();
                likeSentList = [];
                likeReceivedList.clear();
                likeReceivedList = [];
                likedList.clear();
                likedList = [];

                setState(() {
                  isLikeSentClicked = false;
                });

                // getFavoriteListKeys();
              },
              child: Text(
                "They liked me",
                style: TextStyle(
                  color: !isLikeSentClicked ? Colors.red[900] : Colors.red[500],
                  fontWeight:
                      isLikeSentClicked ? FontWeight.normal : FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: likedList.isEmpty
          ? const Center(
              child: Icon(
                Icons.person_off_sharp,
                color: Colors.white,
                size: 60,
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8),
              children: List.generate(likedList.length, (index) {
                return GridTile(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: Colors.blue.shade200,
                      child: GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                              likedList[index]["imageProfile"],
                            ),
                            fit: BoxFit.cover,
                          )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),

                                  //name - age
                                  Text(
                                    "${likedList[index]["name"]} ◉ ${likedList[index]["age"]}",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 4,
                                  ),

                                  //icon - city - country
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${likedList[index]["city"]}, ${likedList[index]["country"]}",
                                          maxLines: 2,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
