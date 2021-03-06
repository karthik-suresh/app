import 'package:InfluenzaNet/main.dart';
import 'package:InfluenzaNet/ui/common/widgets/navigators/navigator-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/instance-selection-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/login-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/register-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/welcome-page.dart';
import 'package:flutter/material.dart';

class OnboardingNavigator extends StatelessWidget {
  static const String instanceSelectionRoute = 'onboarding/instanceSelection';
  static const String welcomeRoute = 'onboarding/welcome';
  static const String registerRoute = 'onboarding/register';
  static const String loginRoute = 'onboarding/login';

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pushMainRoute() {
    InfluenzaNet.navigatorKey.currentState.pushReplacementNamed(InfluenzaNet.mainRoute);
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorPage(
      navigatorKey: navigatorKey,
      initialRoute: instanceSelectionRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case instanceSelectionRoute:
            builder = _instanceSelectionPage;
            break;
          case welcomeRoute:
            builder = _welcomePage;
            break;
          case registerRoute:
            builder = _registerPage;
            break;
          case loginRoute:
            builder = _loginPage;
            break;
          default:
            print('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  InstanceSelectionPage _instanceSelectionPage(BuildContext _) => InstanceSelectionPage();
  WelcomePage _welcomePage(BuildContext _) => WelcomePage();
  RegisterPage _registerPage(BuildContext _) => RegisterPage(onRegister: pushMainRoute, onSkip: pushMainRoute);
  LoginPage _loginPage(BuildContext _) => LoginPage(onLogin: pushMainRoute);
}
