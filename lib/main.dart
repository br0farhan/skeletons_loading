import 'package:flutter/material.dart';
import 'package:skeletons_loading/skeletons_contents.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Skeleton Loading';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SkeletonContents(title: title),
      );
}
