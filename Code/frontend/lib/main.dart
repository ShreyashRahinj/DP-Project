import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controller/providers/auth_state_provider.dart';
import 'package:frontend/controller/providers/resources_data_provider.dart';
import 'package:frontend/view/constants/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResourcesDataProvider(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse},
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: routes,
        initialRoute: homeScreenRoute,
      ),
    );
  }
}
