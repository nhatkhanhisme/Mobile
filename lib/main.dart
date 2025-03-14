import 'package:lacquer/config/http_client.dart';
import 'package:lacquer/features/auth/bloc/auth_bloc.dart';
import 'package:lacquer/features/auth/data/auth_api_client.dart';
import 'package:lacquer/features/auth/data/auth_local_data_source.dart';
import 'package:lacquer/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/pages/sign-in/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  final sf = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sf,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create:
          (context) => AuthRepository(
            authApiClient: AuthApiClient(dio),
            authLocalDataSource: AuthLocalDataSource(sharedPreferences),
          ),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      ),
    );
  }
}
