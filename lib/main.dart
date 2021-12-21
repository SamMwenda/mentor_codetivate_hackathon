import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mentor_codetivate_hackathon/Services/firebase.dart';
import 'firebase_options.dart';

import 'Screens/intro.dart';

//get the firestore service ready to be called
void setupLocator() {
  GetIt.I.registerLazySingleton(() => FireStore());
}

void main() async {
  //show yo have permission to use the font
  LicenseRegistry.addLicense(() async* {
    final licensePoppins = await rootBundle.loadString('fonts/Poppins/OFL.txt');
    final licenseFugazOne =
        await rootBundle.loadString('fonts/Fugaz_One/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], licensePoppins);
    yield LicenseEntryWithLineBreaks(['google_fonts'], licenseFugazOne);
  });
  //initialize flutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MentorWebApp());
}
