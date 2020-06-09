import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Input extends StatefulWidget {
  final dynamic inputComponent;
  final String surveyKey;

  Input({this.inputComponent, this.surveyKey});
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String itemKey;
  String surveyKey;
  final myController = TextEditingController();

  @override
  void initState() {
    itemKey = widget.inputComponent['key'];
    surveyKey = widget.surveyKey;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use myController.text to get the text value
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (String value) {
        debugPrint('Input saved: ' + value);
        SurveySingleItemProvider surveySingleItemProvider =
            Provider.of<SurveySingleItemProvider>(context, listen: false);
        dynamic response = Utils.constructSingleResponseItem(
            key: itemKey,
            value: value,
            responseItem: surveySingleItemProvider.responseItem);
        surveySingleItemProvider.responseItem = response;
        debugPrint('we are' + surveySingleItemProvider.surveyKey);
        //debugPrint('we are' + surveySingleItemProvider.surveyKey);
        // var m = Provider.of<SurveyPageViewProvider>(context, listen: false)
        //     .surveyPageList;
        // var pos = m.indexWhere((prov) => prov.surveyKey == surveyKey);
        // debugPrint('Page=' + m[pos].responseItem.toString());
      },
      controller: myController,
      style: ThemeElements.bigButtonTextStyle,
      decoration: InputDecoration(
        hintStyle: ThemeElements.bigButtonTextStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        filled: true,
        focusColor: ThemeElements.primaryColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardAppearance: Brightness.light,
    );
  }
}
