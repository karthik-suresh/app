import 'package:InfluenzaNet/ui/common/widgets/navigators/navigator-page.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/first-question-page.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/second-question-page.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/third-question-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyNavigator extends StatelessWidget {
  static const String firstQuestionRoute = 'survey/firstQuestion';
  static const String secondQuestionRoute = 'survey/secondQuestion';
  static const String thirdQuestionRoute = 'survey/thirdQuestion';
  static const String fourthQuestionRoute = 'survey/fourthQuestion';

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pushMainRoute() {
    MainNavigator.navigatorKey.currentState.pushReplacementNamed(MainNavigator.homeRoute);
  }

  static void pushFirstQuestionRoute() {
    SurveyNavigator.navigatorKey.currentState.pushNamed(SurveyNavigator.firstQuestionRoute);
  }

  static void pushSecondQuestionRoute() {
    SurveyNavigator.navigatorKey.currentState.pushNamed(SurveyNavigator.secondQuestionRoute);
  }

  static void pushThirdQuestionRoute() {
    SurveyNavigator.navigatorKey.currentState.pushNamed(SurveyNavigator.thirdQuestionRoute);
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorPage(
      navigatorKey: navigatorKey,
      initialRoute: firstQuestionRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case firstQuestionRoute:
            builder = _firstQuestionPage;
            break;
          case secondQuestionRoute:
            builder = _secondQuestionPage;
            break;
          case thirdQuestionRoute:
            builder = _thirdQuestionPage;
            break;    
          default:
            print('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  FirstQuestionPage _firstQuestionPage(BuildContext _) => FirstQuestionPage(
        onAnswered: pushSecondQuestionRoute,
      );
  SecondQuestionPage _secondQuestionPage(BuildContext _) => SecondQuestionPage(
        onAnswered: pushThirdQuestionRoute,
      );
  ThirdQuestionPage _thirdQuestionPage(BuildContext _) => ThirdQuestionPage(
        onAnswered: pushMainRoute,
      );
}