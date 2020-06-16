import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/display_component/error_item.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/display_component/text_item.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/display_component/warning_item.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/group_component/response_group.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/drop_down_group.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/input.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/multiline_input.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/multiple_choice_component/checkbox_input.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/multiple_choice_component/multiple_choice_group.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/number_input.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/single_choice_component/radio_input.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/single_choice_component/radio_number_input.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/components/response_component/single_choice_component/single_choice_group.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/survey_item_view/answer-wrap.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  static Widget classifyRootComponent(dynamic itemComponent, String surveyKey) {
    switch (itemComponent['role']) {
      case 'title':
        return null;
      case 'helpGroup':
        return null;
      case 'responseGroup':
        return AnswerWrap(
          children: <Widget>[
            Container(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    ResponseComponent(
                        responseComponent: itemComponent, surveyKey: surveyKey)
                  ]),
            )
          ],
        );
      case 'text':
        return TextItem(textComponent: itemComponent);
      case 'error':
        return ErrorItem(errorComponent: itemComponent);

      case 'warning':
        return WarningItem(warningComponent: itemComponent);

      default:
        debugPrint('Invalid role/role not implemented');
        return null;
    }
  }

  static Widget classifyResponseComponent(
      dynamic responseComponent, String surveyKey) {
    switch (responseComponent['role']) {
      case 'input':
        return Input(inputComponent: responseComponent, surveyKey: surveyKey);
      case 'multilineTextInput':
        return MultilineInput(
            inputComponent: responseComponent, surveyKey: surveyKey);
      case 'numberInput':
        return NumberInput(
            inputComponent: responseComponent, surveyKey: surveyKey);
      case 'singleChoiceGroup':
        return SingleChoiceGroup(
            singleChoiceGroupComponent: responseComponent,
            surveyKey: surveyKey);
      case 'multipleChoiceGroup':
        return MultipleChoiceGroup(
            multipleChoiceGroupComponent: responseComponent,
            surveyKey: surveyKey);
      case 'dropDownGroup':
        return DropDownGroup(
            dropDownGroupComponent: responseComponent, surveyKey: surveyKey);
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static Widget classifySingleChoiceGroupComponent(
      {dynamic choiceComponent,
      String groupKey,
      String itemKey,
      String content,
      String surveyKey}) {
    switch (choiceComponent['role']) {
      case 'option':
        return Text(Utils.getContent(choiceComponent),
            textAlign: TextAlign.left);
      case 'input':
        return RadioInput(
            groupKey: groupKey,
            itemKey: itemKey,
            content: content,
            surveyKey: surveyKey);
      case 'numberInput':
        return RadioNumberInput(
            groupKey: groupKey, itemKey: itemKey, surveyKey: surveyKey);
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static Widget classifyMultipleChoiceGroupComponent(
      {dynamic choiceComponent,
      String groupKey,
      String itemKey,
      String content,
      String surveyKey}) {
    switch (choiceComponent['role']) {
      case 'option':
        return Text(Utils.getContent(choiceComponent),
            textAlign: TextAlign.left);
      case 'input':
        return CheckBoxInput(
            groupKey: groupKey,
            itemKey: itemKey,
            content: content,
            surveyKey: surveyKey);
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static List<Widget> getHelpGroupContents(
      dynamic helpGroupComponent, BuildContext context) {
    ThemeData themeData = Theme.of(context);
    List<Widget> helpWidgets = [];
    List helpGroupItems = helpGroupComponent['items'];
    for (int iter = 0; iter < helpGroupComponent.length; iter += 2) {
      helpWidgets.add(Text(Utils.getContent(helpGroupItems[iter]),
          style: themeData.textTheme.headline6));
      helpWidgets.add(Container(
        height: ThemeElements.cardContentPadding,
      ));
      helpWidgets.add(Text(Utils.getContent(helpGroupItems[iter + 1]),
          style: themeData.textTheme.bodyText2));
    }
    return helpWidgets;
  }
}
