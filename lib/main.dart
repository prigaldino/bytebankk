import 'package:bytebankk/components/theme.dart';
import 'package:bytebankk/screens/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() async {

// nova forma de utilizar o BlocObserver
  BlocOverrides.runZoned(
    () => runApp(BytebankApp()),
    blocObserver: LogObserver(),
  );


/*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kDebugMode) {  
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);

  } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FirebaseCrashlytics.instance.setUserIdentifier('alura123');
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  runZonedGuarded<Future<void>>(() async {
    runApp(BytebankApp());
  }, FirebaseCrashlytics.instance.recordError);
*/
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print("${bloc.runtimeType} > $change");
    super.onChange(bloc, change);
  }
}
class BytebankApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
  
  //na prática evitar log do genero, pois pode vazar informações sensíveis para o log
  //Bloc.observer = LogObserver(); // forma anteriora de utilização
  
    return MaterialApp(
      theme: bytebankTheme,
      home: DashboardContainer(),
    );
  }
}
