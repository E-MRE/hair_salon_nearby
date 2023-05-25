import 'package:flutter/material.dart';

abstract class BaseTextTheme {
  final Color? primaryColor;
  late final TextTheme data;

  ///Largest of the display styles. As the largest text on the screen, display styles are reserved for short,
  ///important text or numerals. They work best on large screens.
  ///Default values --> fontSize: ```57```, height: ```64```, family: ```Regular```
  TextStyle? get displayLarge;

  ///Middle size of the display styles. As the largest text on the screen, display styles are reserved for short,
  ///important text or numerals. They work best on large screens.
  ///Default values --> fontSize: ```45```, height: ```52```, family: ```Regular```
  TextStyle? get displayMedium;

  ///Smallest of the display styles. As the largest text on the screen, display styles are reserved for short,
  ///important text or numerals. They work best on large screens.
  ///Default values --> fontSize: ```36```, height: ```44```, family: ```Regular```
  TextStyle? get displaySmall;

  ///Largest of the headline styles. Headline styles are smaller than display styles.
  ///They're best-suited for short, high-emphasis text on smaller screens.
  ///Default values --> fontSize: ```32```, height: ```40```, family: ```Regular```
  TextStyle? get headlineLarge;

  ///Middle size of the headline styles. Headline styles are smaller than display styles.
  ///They're best-suited for short, high-emphasis text on smaller screens.
  ///Default values --> fontSize: ```28```, height: ```36 ```, family: ```Regular```
  TextStyle? get headlineMedium;

  ///Smallest of the headline styles. Headline styles are smaller than display styles.
  ///They're best-suited for short, high-emphasis text on smaller screens.
  ///Default values --> fontSize: ```24```, height: ```32```, family: ```Regular```
  TextStyle? get headlineSmall;

  ///Largest of the title styles.
  ///Titles are smaller than headline styles and should be used for shorter, medium-emphasis text.
  ///Default values --> fontSize: ```22```, height: ```28```, family: ```Medium```
  TextStyle? get titleLarge;

  ///Middle size of the title styles.
  ///Titles are smaller than headline styles and should be used for shorter, medium-emphasis text.
  ///Default values --> fontSize: ```16```, height: ```24```, family: ```Medium```
  TextStyle? get titleMedium;

  ///Smallest of the title styles.
  ///Titles are smaller than headline styles and should be used for shorter, medium-emphasis text.
  ///Default values --> fontSize: ```14```, height: ```20```, family: ```Medium```
  TextStyle? get titleSmall;

  ///Largest of the body styles. Body styles are used for longer passages of text.
  ///Default values --> fontSize: ```16```, height: ```24```, family: ```Regular```
  TextStyle? get bodyLarge;

  ///Middle size of the body styles.Body styles are used for longer passages of text.
  ///Default values --> fontSize: ```14```, height: ```20```, family: ```Regular```
  TextStyle? get bodyMedium;

  ///Smallest of the body styles. Body styles are used for longer passages of text.
  ///Default values --> fontSize: ```12```, height: ```16```, family: ```Regular```
  TextStyle? get bodySmall;

  ///Largest of the label styles. Label styles are smaller, utilitarian styles, used for areas of the UI
  ///such as text inside of components or very small supporting text in the content body, like captions.
  ///Used for text on ElevatedButton, TextButton and OutlinedButton.
  ///Default values --> fontSize: ```14```, height: ```20```, family: ```Medium```
  TextStyle? get labelLarge;

  ///Middle size of the label styles. Label styles are smaller, utilitarian styles, used for areas of the UI
  ///such as text inside of components or very small supporting text in the content body, like captions.
  ///Default values --> fontSize: ```12```, height: ```20```, family: ```Medium```
  TextStyle? get labelMedium;

  ///Smallest of the label styles. Label styles are smaller, utilitarian styles, used for areas of the UI
  ///such as text inside of components or very small supporting text in the content body, like captions.
  ///Default values --> fontSize: ```11```, height: ```16```, family: ```Medium```
  TextStyle? get labelSmall;

  BaseTextTheme(this.primaryColor);
}
