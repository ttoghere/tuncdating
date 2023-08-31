import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuncdating/models/person.dart' as pM;

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "you have successfully picked your profile image from galley.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "you have successfully captured your profile image using camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage({required File imageFile}) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    String downloadImgUrl = await snapshot.ref.getDownloadURL();
    return downloadImgUrl;
  }

  createNewUserAccount({
    required File imageProfile,
    required String email,
    required String password,
    required String name,
    required int age,
    required String phoneNo,
    required String city,
    required String country,
    required String profileHeading,
    required String lookingForInaPartner,
    required int publishedDateTime,
    required String height,
    required String weight,
    required String bodyType,
    required String drink,
    required String smoke,
    required String martialStatus,
    required String haveChildren,
    required String noOfChildren,
    required String profession,
    required String employmentStatus,
    required String income,
    required String livingSituation,
    required String willingToRelocate,
    required String relationshipYouAreLookingFor,
    required String nationality,
    required String education,
    required String languageSpoken,
    required String religion,
    required String ethnicity,
  }) async {
    try {
      //User Create Method
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Upload Img to Storage
      String urlOfDownloadedIMG =
          await uploadImageToStorage(imageFile: imageProfile);
      //Save user info to Firstore
      pM.Person personInstance = pM.Person(
        //personal info
        imageProfile: urlOfDownloadedIMG,
        email: email,
        password: password,
        name: name,
        age: age,
        phoneNo: phoneNo,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingForInaPartner: lookingForInaPartner,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,

        //Appearance
        height: height,
        weight: weight,
        bodyType: bodyType,

        //Life style
        drink: drink,
        smoke: smoke,
        martialStatus: martialStatus,
        haveChildren: haveChildren,
        noOfChildren: noOfChildren,
        profession: profession,
        employmentStatus: employmentStatus,
        income: income,
        livingSituation: livingSituation,
        willingToRelocate: willingToRelocate,
        relationshipYouAreLookingFor: relationshipYouAreLookingFor,

        //Background - Cultural Values
        nationality: nationality,
        education: education,
        languageSpoken: languageSpoken,
        religion: religion,
        ethnicity: ethnicity,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar(
          "Account Created", "Congratulations, your account has been created.");
      // Get.to(HomeScreen());
    } on FirebaseAuthException {
      return;
    } catch (error) {
      return Get.snackbar("Error", "Error Occured: $error)");
    }
  }
}
