import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuncdating/controllers/profile_controllers.dart';
import 'package:get/get.dart';
import 'package:tuncdating/services/global.dart';
import 'package:tuncdating/views/screens/screens.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";
  readCurrentUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserId)
        .get()
        .then((dataSnapshot) {
      setState(() {
        senderName = dataSnapshot.data()!["name"].toString();
      });
    });
  }

  @override
  void initState() {
    readCurrentUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageView.builder(
          itemCount: profileController.allUsersProfileList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final eachProfile = profileController.allUsersProfileList[index];
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    eachProfile.imageProfile.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    //Filter Icon Button
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    //User Data,
                    GestureDetector(
                      onTap: () {
                        profileController.viewSentAndViewReceived(
                          toUserId: eachProfile.uid.toString(),
                          senderName: senderName,
                        );
                        //Navigate to UserProfile
                        Get.toNamed(UserDetails.routeName,
                            arguments: eachProfile.uid);
                      },
                      child: Column(
                        children: [
                          Text(
                            eachProfile.name.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 24,
                                    letterSpacing: 4,
                                    color: Colors.white),
                          ),
                          Text(
                            "${eachProfile.age.toString()} /**/ ${eachProfile.city.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 24,
                                    letterSpacing: 4,
                                    color: Colors.white),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          //Profession and Relations
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    )),
                                child: Text(
                                  eachProfile.profession.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  eachProfile.religion.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          //Country and Ethnicity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    )),
                                child: Text(
                                  eachProfile.country.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[900],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  eachProfile.ethnicity.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    //Image Buttons - Fav, Chat, Like
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Fav Button
                        GestureDetector(
                          onTap: () {
                            profileController.favoriteSentAndFavoriteReceived(
                              toUserID: eachProfile.uid.toString(),
                              senderName: senderName,
                            );
                          },
                          child: Image.asset(
                            "assets/favorite.png",
                            width: 60,
                          ),
                        ), //Chat Button
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/chat.png",
                            width: 100,
                          ),
                        ), //Like Button
                        GestureDetector(
                          onTap: () {
                            profileController.likeSentAndLikeReceived(
                              toUserId: eachProfile.uid.toString(),
                              senderName: senderName,
                            );
                          },
                          child: Image.asset(
                            "assets/like.png",
                            width: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
