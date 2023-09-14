import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:tuncdating/controllers/profile_controllers.dart";
import "package:get/get.dart";
import "package:tuncdating/services/global.dart";
import "package:tuncdating/views/screens/screens.dart";

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  List<String> ageRangeList = [];
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";
  var pageController = PageController(initialPage: 0, viewportFraction: 1);
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

  applyFilter() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: const Text(
                  "Matching Filter",
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("I am looking for a:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        hint: const Text("Select gender"),
                        value: chosenGender,
                        underline: Container(),
                        items: ["Male", "Female", "Others"].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            chosenGender = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("who lives in:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        hint: const Text("Select country"),
                        value: chosenCountry,
                        underline: Container(),
                        items: [
                          "Spain",
                          "France",
                          "Germany",
                          "United Kingdom",
                          "Canada",
                          "USA",
                        ].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            chosenCountry = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("who's age is equal to or above:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        hint: const Text("Select age"),
                        value: chosenAge,
                        underline: Container(),
                        items: ageRangeList.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            chosenAge = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();

                      profileController.getResults();
                    },
                    child: const Text("Done"),
                  ),
                ],
              );
            },
          );
        });
  }

  void ageRange() {
    for (int i = 10; i < 65; i++) {
      ageRangeList.add(i.toString());
    }
  }

  @override
  void initState() {
    readCurrentUserData();
    ageRange();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => PageView.builder(
            pageSnapping: false,
            physics: const ClampingScrollPhysics(),
            itemCount: profileController.allUsersProfileList.length,
            controller: pageController,
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
                            onPressed: () {
                              applyFilter();
                            },
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
                          Get.to(
                            () => UserDetails(
                              userId: eachProfile.uid,
                            ),
                          );
                          // Get.toNamed(UserDetails.routeName,
                          //     arguments: eachProfile.uid);
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
      ),
    );
  }
}
