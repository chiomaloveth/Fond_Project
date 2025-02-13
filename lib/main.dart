import 'package:flutter/material.dart';
import 'package:found_team_assessment/providers/details_screen_provider.dart';
import 'package:found_team_assessment/providers/memeber_provider.dart';
import 'package:found_team_assessment/providers/screen_provider.dart';
import 'package:found_team_assessment/providers/team_management_provider.dart';
import 'package:provider/provider.dart';
import 'providers/team_provider.dart';
import 'screens/teams_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TeamsProvider()),
        ChangeNotifierProvider(create: (_) => TeamManagementProvider()),
        ChangeNotifierProvider(create: (_) => MemberProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
        ChangeNotifierProvider(create: (_) => DetailsScreenProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teams App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0E1F),
        fontFamily: 'Roboto',
      ),
      home: TeamsScreen(),
    );
  }
}
