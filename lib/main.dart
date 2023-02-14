import 'package:flutter/material.dart';
import 'package:nodejs/constants/global_variables.dart';
import 'package:nodejs/features/auth/screens/auth_screen.dart';
import 'package:nodejs/features/auth/services/auth_service.dart';
import 'package:nodejs/providers/user_provider.dart';
import 'package:nodejs/routes.dart';
import 'package:provider/provider.dart';

import 'common/widgets/bottom_bart.dart';
import 'features/admin/screens/admin_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
  @override
  void initState() {
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
