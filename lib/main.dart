import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/common/service/dio_client.dart';
import 'core/routes/route.dart';
import 'core/themes/theme_data.dart';
import 'core/utils/dotenv.dart';
import 'di/di.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/login/presentation/views/login_screen.dart';
import 'features/seat_selection/data/local/ticket_local_storage_sqf.implement.dart';
import 'firebase_options.dart';
import 'l10n/generated/app_localizations.dart';

DioClient dioClient = DioClient();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DotEnvUtils.initDotEnv();
  dioClient.initDio();
  setupGetIt();
  await TicketLocalStorageSqfImplement().initDB();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('vi'),
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: EasyLoading.init(),
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = false;
}
