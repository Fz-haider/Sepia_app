import 'package:flutter/material.dart';

class Images {
  static final String IMAGES_LOC = "assets/images/";
  static final String WELCOME_1 = IMAGES_LOC + "welcome-1.png";
  static final String WELCOME_2 = IMAGES_LOC + "welcome-2.png";
  static final String WELCOME_3 = IMAGES_LOC + "welcome-3.png";
  static final String START_PAGE_BACKGROUND =
      IMAGES_LOC + "start_page_background.png";
  static final String FAMILY = IMAGES_LOC + "family.png";
  static final String TEACHER = IMAGES_LOC + "teacher.png";

  //return the list of image paths
  static List<String> getImages() {
    return [
      WELCOME_1,
      WELCOME_2,
      WELCOME_3,
      FAMILY,
      TEACHER,
      START_PAGE_BACKGROUND
    ];
  }

  //precache all the images
  static void precacheAllImages(BuildContext context) {
    for (String img in getImages()) {
      precacheImage(AssetImage(img), context);
    }
  }
}
