import 'package:flutter/material.dart';
import 'package:kiwee/provider/front_provider.dart';
import 'package:kiwee/provider/loading_provider.dart';

import 'package:provider/provider.dart';

import 'home.dart';
import 'utility/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FrontProvider()),
        ChangeNotifierProvider.value(value: LoaderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buildTheme,
        home: Home(),
      ),
    );
  }
}
