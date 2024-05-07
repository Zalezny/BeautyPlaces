import 'package:beauty_places/data/firestore/write_repository.dart';
import 'package:beauty_places/screens/map_screen.dart';
import 'package:beauty_places/screens/write_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'bloc/cubit/map_cubit.dart';
import 'firebase_options.dart';
import 'services/injection.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies(Environment.dev);
  // FirestoreHelper().places();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: kIsWeb
          ? const WriteScreen()
          : BlocProvider(
              create: (context) => MapCubit(getIt<WriteRepository>())..getModels(),
              child: const MapScreen(),
            ),
    );
  }
}
