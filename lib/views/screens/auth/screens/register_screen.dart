import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuncdating/controllers/auth_controller.dart';
import 'package:tuncdating/views/screens/auth/screens/screens.dart';
import 'package:tuncdating/views/screens/auth/widgets/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = "/register";
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController =
      TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController =
      TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController =
      TextEditingController();
  TextEditingController haveChildrenTextEditingController =
      TextEditingController();
  TextEditingController noOfChildrenTextEditingController =
      TextEditingController();
  TextEditingController professionTextEditingController =
      TextEditingController();
  TextEditingController employmentStatusTextEditingController =
      TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController =
      TextEditingController();
  TextEditingController willingToRelocateTextEditingController =
      TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController =
      TextEditingController();

  //Connections
  TextEditingController linkedInTextEditingController = TextEditingController();
  TextEditingController instagramTextEditingController =
      TextEditingController();
  TextEditingController githubTextEditingController = TextEditingController();

  //Background - Cultural Values
  TextEditingController nationalityTextEditingController =
      TextEditingController();
  TextEditingController educationTextEditingController =
      TextEditingController();
  TextEditingController languageSpokenTextEditingController =
      TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController =
      TextEditingController();

  bool showProgressBar = false;

  //Auth Control
  AuthenticationController authenticationController =
      AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "to get Started Now.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //choose image circle avatar
              authenticationController.imageFile == null
                  ? const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/profile_avatar.jpg"),
                      backgroundColor: Colors.black,
                    )
                  : Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: FileImage(
                              File(
                                authenticationController.imageFile!.path,
                              ),
                            ),
                          )),
                    ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      await authenticationController
                          .captureImageFromPhoneCamera();

                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              //personal info
              const Text(
                "Personal Info:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              //Gender
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: genderTextEditingController,
                  labelText: "Gender",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: phoneNoTextEditingController,
                  labelText: "Phone",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: profileHeadingTextEditingController,
                  labelText: "Profile Heading",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //lookingForInaPartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController:
                      lookingForInaPartnerTextEditingController,
                  labelText: "What you're looking for in a partner",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Appearance
              const Text(
                "Appearance:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //height
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: weightTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //bodyType
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Life style
              const Text(
                "Life style:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //drink
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: drinkTextEditingController,
                  labelText: "Drink",
                  iconData: Icons.local_drink_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //smoke
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: smokeTextEditingController,
                  labelText: "Smoke",
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //martialStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: martialStatusTextEditingController,
                  labelText: "Martial Status",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //haveChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: haveChildrenTextEditingController,
                  labelText: "Do you have Children?",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //noOfChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: noOfChildrenTextEditingController,
                  labelText: "Number of Children",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //profession
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: professionTextEditingController,
                  labelText: "Profession",
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //employmentStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: employmentStatusTextEditingController,
                  labelText: "Employment Status",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //income
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: incomeTextEditingController,
                  labelText: "Income",
                  iconData: CupertinoIcons.money_dollar_circle,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //livingSituation
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: livingSituationTextEditingController,
                  labelText: "Living Situation",
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //willingToRelocate
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: willingToRelocateTextEditingController,
                  labelText: "Are you willing to Relocate?",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //relationshipYouAreLookingFor
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController:
                      relationshipYouAreLookingForTextEditingController,
                  labelText: "What relationship you are looking for?",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Background - Cultural Values
              const Text(
                "Background - Cultural Values:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //nationality
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //education
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: educationTextEditingController,
                  labelText: "Education",
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //languageSpoken
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: languageSpokenTextEditingController,
                  labelText: "Language Spoken",
                  iconData: CupertinoIcons.person_badge_plus_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //religion
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: religionTextEditingController,
                  labelText: "Religion",
                  iconData: CupertinoIcons.checkmark_seal_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: ethnicityTextEditingController,
                  labelText: "Ethnicity",
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Background - Cultural Values
              const Text(
                "Connections:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ), //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: linkedInTextEditingController,
                  labelText: "LinkedIn",
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ), //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: instagramTextEditingController,
                  labelText: "Instagram",
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ), //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTField(
                  textEditingController: githubTextEditingController,
                  labelText: "GitHub",
                  iconData: CupertinoIcons.eye,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //create account button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                child: InkWell(
                  onTap: () async {
                    await formValidation()
                        .whenComplete(
                          () => Get.snackbar(
                              "Successful", "User has been created"),
                        )
                        .then((value) => Get.toNamed(LoginScreen.routeName));
                  },
                  child: const Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              //already have an account login here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              showProgressBar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> formValidation() async {
    if (authenticationController.imageFile != null) {
      if (
          //personal info
          nameTextEditingController.text.trim().isNotEmpty &&
              emailTextEditingController.text.trim().isNotEmpty &&
              passwordTextEditingController.text.trim().isNotEmpty &&
              ageTextEditingController.text.trim().isNotEmpty &&
              phoneNoTextEditingController.text.trim().isNotEmpty &&
              cityTextEditingController.text.trim().isNotEmpty &&
              countryTextEditingController.text.trim().isNotEmpty &&
              profileHeadingTextEditingController.text.trim().isNotEmpty &&
              lookingForInaPartnerTextEditingController.text
                  .trim()
                  .isNotEmpty &&
              genderTextEditingController.text.trim().isNotEmpty &&

              //Appearance
              heightTextEditingController.text.trim().isNotEmpty &&
              weightTextEditingController.text.trim().isNotEmpty &&
              bodyTypeTextEditingController.text.trim().isNotEmpty &&

              //Life style
              drinkTextEditingController.text.trim().isNotEmpty &&
              smokeTextEditingController.text.trim().isNotEmpty &&
              martialStatusTextEditingController.text.trim().isNotEmpty &&
              haveChildrenTextEditingController.text.trim().isNotEmpty &&
              noOfChildrenTextEditingController.text.trim().isNotEmpty &&
              professionTextEditingController.text.trim().isNotEmpty &&
              employmentStatusTextEditingController.text.trim().isNotEmpty &&
              incomeTextEditingController.text.trim().isNotEmpty &&
              livingSituationTextEditingController.text.trim().isNotEmpty &&
              willingToRelocateTextEditingController.text.trim().isNotEmpty &&
              relationshipYouAreLookingForTextEditingController.text
                  .trim()
                  .isNotEmpty &&

              //Connections
              githubTextEditingController.text.trim().isNotEmpty &&
              instagramTextEditingController.text.trim().isNotEmpty &&
              linkedInTextEditingController.text.trim().isNotEmpty &&
              //Background - Cultural Values
              nationalityTextEditingController.text.trim().isNotEmpty &&
              educationTextEditingController.text.trim().isNotEmpty &&
              languageSpokenTextEditingController.text.trim().isNotEmpty &&
              religionTextEditingController.text.trim().isNotEmpty &&
              ethnicityTextEditingController.text.trim().isNotEmpty) {
        setState(() {
          showProgressBar = true;
        });

        await authenticationController.createNewUserAccount(
          //personal info
          imageProfile: authenticationController.profileImage!,
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
          name: nameTextEditingController.text.trim(),
          age: int.parse(ageTextEditingController.text.trim()),
          phoneNo: phoneNoTextEditingController.text.trim(),
          city: cityTextEditingController.text.trim(),
          country: countryTextEditingController.text.trim(),
          profileHeading: profileHeadingTextEditingController.text.trim(),
          lookingForInaPartner:
              lookingForInaPartnerTextEditingController.text.trim(),
          publishedDateTime: DateTime.now().millisecondsSinceEpoch,
          gender: genderTextEditingController.text.trim(),

          //Appearance
          height: heightTextEditingController.text.trim(),
          weight: weightTextEditingController.text.trim(),
          bodyType: bodyTypeTextEditingController.text.trim(),

          //Life style
          drink: drinkTextEditingController.text.trim(),
          smoke: smokeTextEditingController.text.trim(),
          martialStatus: martialStatusTextEditingController.text.trim(),
          haveChildren: haveChildrenTextEditingController.text.trim(),
          noOfChildren: noOfChildrenTextEditingController.text.trim(),
          profession: professionTextEditingController.text.trim(),
          employmentStatus: employmentStatusTextEditingController.text.trim(),
          income: incomeTextEditingController.text.trim(),
          livingSituation: livingSituationTextEditingController.text.trim(),
          willingToRelocate: willingToRelocateTextEditingController.text.trim(),
          relationshipYouAreLookingFor:
              relationshipYouAreLookingForTextEditingController.text.trim(),

          //Connections
          linkedInUrl: linkedInTextEditingController.text.trim(),
          instagramUrl: instagramTextEditingController.text.trim(),
          githubUrl: githubTextEditingController.text.trim(),

          //Background - Cultural Values
          nationality: nationalityTextEditingController.text.trim(),
          education: educationTextEditingController.text.trim(),
          languageSpoken: languageSpokenTextEditingController.text.trim(),
          religion: religionTextEditingController.text.trim(),
          ethnicity: ethnicityTextEditingController.text.trim(),
        );

        setState(() {
          showProgressBar = false;
          authenticationController.imageFile == null;
        });
      } else {
        Get.snackbar(
            "A Field is Empty", "Please fill out all field in text fields.");
      }
    } else {
      Get.snackbar("Image File Missing",
          "Please pick image from Gallery or capture with Camera");
    }
  }
}
