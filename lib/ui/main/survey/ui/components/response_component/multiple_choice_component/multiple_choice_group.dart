import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class MultipleChoiceGroup extends StatelessWidget {
  final dynamic multipleChoiceGroupComponent;

  MultipleChoiceGroup({Key key, this.multipleChoiceGroupComponent})
      : super(key: key);

  List<Widget> choiceItemsWidget(List choiceList, String itemGroupKey) {
    List<Widget> result = [];
    Map<String, bool> optionValues = {};
    choiceList.forEach((item) {
      String key = item['key'];
      optionValues[key] = false;
    });
    choiceList.forEach((item) {
      String key = item['key'];
      Widget itemWidget = CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: WidgetUtils.classifyMultipleChoiceGroupComponent(
            choiceComponent: item,
            groupKey: itemGroupKey,
            itemKey: item['key'],
            content: Utils.getContent(item)),
        value: optionValues[key],
        onChanged: (bool value) {},
      );
      if (itemWidget != null) {
        result.add(itemWidget);
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ListBody(
          children: choiceItemsWidget(multipleChoiceGroupComponent['items'],
              multipleChoiceGroupComponent['key']),
        ),
      ),
    );
  }
}