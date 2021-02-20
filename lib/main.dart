import 'package:contribution_app/route/addProject.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chanda',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/': (_) => HomeOrLogin(),
        Login.route: (_) => Login(),
        Dashboard.route: (_) => Dashboard(),
        ProjectScreen.route: (_) => ProjectScreen(),
        UserDonation.route: (_) => UserDonation(),
        UserExpence.route: (_) => UserExpence(),
        AddSingleDonation.route: (_) => AddSingleDonation(),
        AddSingleExpence.route: (_) => AddSingleExpence(),
        AddProject.route: (_) => AddProject(),
      },
    );
  }
}
