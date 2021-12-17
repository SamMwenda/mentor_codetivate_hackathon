import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/intro.dart';

void main() {
  //show yo have permission to use the font
  LicenseRegistry.addLicense(() async* {
    final licensePoppins = await rootBundle.loadString('fonts/Poppins/OFL.txt');
    final licenseFugazOne = await rootBundle.loadString('fonts/Fugaz_One/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], licensePoppins);
    yield LicenseEntryWithLineBreaks(['google_fonts'], licenseFugazOne);
  });
  runApp(const MentorWebApp());
}

