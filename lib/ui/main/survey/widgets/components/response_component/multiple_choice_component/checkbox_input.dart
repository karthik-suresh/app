import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBoxInput extends StatelessWidget {
  final String groupKey;
  final String itemKey;
  final String content;
  final String surveyKey;

  CheckBoxInput(
      {Key key, this.groupKey, this.itemKey, this.content, this.surveyKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic preset = surveySingleItemModel.preset;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content),
        Expanded(
          child: ThemedTextFormField(
            onFieldSubmitted: (String newValue) {
              List valuePairs = [];
              dynamic valuePair = {'key': itemKey, 'value': newValue};
              dynamic response;
              if (preset == null) {
                valuePairs = [valuePair];
              } else {
                int position = valuePairs
                    .indexWhere((element) => element['key'] == itemKey);
                valuePairs[position] = valuePair;
              }
              response = Utils.constructMultipleChoiceGroupItem(
                  groupKey: groupKey,
                  valuePairs: valuePairs,
                  responseItem: surveySingleItemModel.getResponseItem());
              Provider.of<SurveyPageViewProvider>(context, listen: false)
                  .setResponded(surveyKey,
                      presetValue: valuePairs, responseItem: response);
            },
          ),
        ),
      ],
    );
  }
}