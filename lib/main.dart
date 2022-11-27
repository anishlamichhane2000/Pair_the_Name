import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_game/screens/home_screen.dart';
import 'package:page_transition/src/enum.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

bool isDarkTheme = true;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isDarkTheme = ref.watch(isDarkThemeProvider);
    ref.read(isDarkThemeProvider.notifier).toggleAsBefore();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Bad Pairs',
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        colorSchemeSeed: Colors.black,
      ),
      home: AnimatedSplashScreen(
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sports_tennis_outlined,
                size: 58,
                color: Colors.white,
                shadows: [
                  for (double i = 1; i < 5; i++)
                    Shadow(
                      color: Colors.purple,
                      blurRadius: 9 * i,
                    )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "The Bad Pairs !",
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    for (double i = 1; i < 4; i++)
                      Shadow(
                        color: Colors.pink,
                        blurRadius: 9 * i,
                      )
                  ],
                ),
              )
            ],
          ),
          splashTransition: SplashTransition.scaleTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          backgroundColor: Colors.black45,
          splashIconSize: 250,
          duration: 4000,
          nextScreen: const MyHomePage(title: 'Welcome To Bad Pairs !')),
    );
  }
}
