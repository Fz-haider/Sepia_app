import 'package:flutter/material.dart';

class Images {
  static final String IMAGES_LOC = "assets/images/";
  static final String IMAGES_LESSONS_LOC = IMAGES_LOC + "lessons/";
  //background images
  static final String WELCOME_1 = IMAGES_LOC + "welcome-1.png";
  static final String WELCOME_2 = IMAGES_LOC + "welcome-2.png";
  static final String WELCOME_3 = IMAGES_LOC + "welcome-3.png";
  static final String START_PAGE_BACKGROUND =
      IMAGES_LOC + "start_page_background.png";
  //lessons
  static final String LESSON = IMAGES_LESSONS_LOC + "lesson.png";
  static final String ISLAMIC = IMAGES_LESSONS_LOC + "islamic.png";
  static final String LANGUAGE = IMAGES_LESSONS_LOC + "language.png";
  static final String MATHS = IMAGES_LESSONS_LOC + "mathematics.png";
  static final String SCIENCE = IMAGES_LESSONS_LOC + "science.png";
  static final String SOCIETY = IMAGES_LESSONS_LOC + "society.png";
  static final String SPORT = IMAGES_LESSONS_LOC + "sport.png";
  //logos
  static final String FAMILY = IMAGES_LOC + "family.png";
  static final String TEACHER = IMAGES_LOC + "teacher.png";

  //return the list of image paths
  static List<String> getImages() {
    return [
      WELCOME_1,
      WELCOME_2,
      WELCOME_3,
      START_PAGE_BACKGROUND,
      LESSON,
      ISLAMIC,
      LANGUAGE,
      MATHS,
      SCIENCE,
      SOCIETY,
      SPORT,
      FAMILY,
      TEACHER
    ];
  }

  //precache all the images
  static void precacheAllImages(BuildContext context) {
    for (String img in getImages()) {
      precacheImage(AssetImage(img), context);
    }
  }
}
