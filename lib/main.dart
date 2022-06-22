import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_best_structure/provider/provider_movie.dart';
// import 'package:provider_best_structure/provider/provider_movie.dart';
import 'package:provider_best_structure/provider/provider_theme.dart';
import 'package:provider_best_structure/route/route_generator.dart';
import 'package:provider_best_structure/route/route_name.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent
          //color set to transperent or set your own color
          ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<MovieProvider>(create: (_) => MovieProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeProvider>().getCurrentTheme,
          onUnknownRoute: RouteGenerator.errorRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: mainTabRoute,
        );
      },
    );
  }
}
