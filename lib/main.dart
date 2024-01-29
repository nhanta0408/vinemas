import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vinemas_app/core/routes/route.dart';
import 'core/themes/theme_data.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/login/presentation/views/login_screen.dart';
import 'l10n/generated/app_localizations.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        ));
  }
}
