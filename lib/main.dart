import 'package:clock/providers/theme_provider.dart';
import 'package:clock/screens/home_screen.dart';
import 'package:clock/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      themeMode: useProvider(isLightThemeProvider).state
          ? ThemeMode.light
          : ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
