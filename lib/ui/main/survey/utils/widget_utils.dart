import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/display_component/error_item.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/display_component/text_item.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/display_component/warning_item.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/group_component/response_group.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/drop_down_group.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/input.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/multiline_input.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/multiple_choice_group.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/number_input.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/single_choice_component/radio_input.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/single_choice_component/radio_number_input.dart';
import 'package:InfluenzaNet/ui/main/survey/ui/components/response_component/single_choice_component/single_choice_group.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/answer-wrap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetUtils {
  static Widget classifyRootComponent(dynamic itemComponent) {
    switch (itemComponent['role']) {
      case 'title':
        return null;
      case 'helpGroup':
        return null;
      case 'responseGroup':
        return AnswerWrap(
          children: <Widget>[
            Container(
              child: Consumer<ResponseModel>(
                  builder: (context, response, child) => Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            ResponseComponent(responseComponent: itemComponent)
                          ])),
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

  static Widget classifyResponseComponent(dynamic responseComponent) {
    switch (responseComponent['role']) {
      case 'input':
        return Input(
            hintText: Utils.getContent(responseComponent),
            itemKey: responseComponent['key']);
      case 'multilineTextInput':
        return MultilineInput(
            hintText: Utils.getContent(responseComponent),
            itemKey: responseComponent['key']);
      case 'numberInput':
        return NumberInput(
            hintText: Utils.getContent(responseComponent),
            itemKey: responseComponent['key']);
      case 'singleChoiceGroup':
        return SingleChoiceGroup(
            singleChoiceGroupComponent: responseComponent,
            itemKey: responseComponent['key']);
      case 'multipleChoiceGroup':
        return MultipleChoiceGroup(
            multipleChoiceGroupComponent: responseComponent,
            itemKey: responseComponent['key']);
      case 'dropDownGroup':
        return DropDownGroup(
            dropDownGroupComponent: responseComponent,
            itemKey: responseComponent['key']);
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static Widget classifySingleChoiceGroupComponent(
      {dynamic choiceComponent, String groupKey, String key}) {
    switch (choiceComponent['role']) {
      case 'option':
        return Text(Utils.getContent(choiceComponent),
            textAlign: TextAlign.left);
      case 'input':
        return RadioInput(
          hintText: Utils.getContent(choiceComponent),
          groupKey: groupKey,
        );
      case 'numberInput':
        return RadioNumberInput(hintText: Utils.getContent(choiceComponent));
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static Widget classifyMultipleChoiceGroupComponent(dynamic choiceComponent) {
    switch (choiceComponent['role']) {
      case 'option':
        return Text(Utils.getContent(choiceComponent),
            textAlign: TextAlign.left);
      case 'input':
        return Input(hintText: Utils.getContent(choiceComponent));
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }
}