import 'package:communicator/src/bloc/sentence/sentence_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/intro.page.dart';
import 'package:communicator/src/services/auth.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SentenceBloc(),
      child: ScreenUtilInit(
        designSize: const Size(320, 740),
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp(
              title: 'Communicator',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: GoogleFonts.ruda().fontFamily),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('sr', 'SRB'),
              ],
              home: FutureBuilder(
                  future: AuthService.isAuthenticated(),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return const HomePage();
                    }
                    return const IntroPage();
                  }));
        },
      ),
    );
  }
}
