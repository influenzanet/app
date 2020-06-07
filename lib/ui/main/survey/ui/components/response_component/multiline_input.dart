import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultilineInput extends StatefulWidget {
  final String text;
  final String hintText;
  final String itemKey;

  MultilineInput({this.text, this.hintText, this.itemKey});
  @override
  _MultilineInputState createState() => _MultilineInputState();
}

class _MultilineInputState extends State<MultilineInput> {
  String text;
  String hintText;
  String itemKey;
  final myController = TextEditingController();

  @override
  void initState() {
    text = widget.text;
    hintText = widget.hintText;
    itemKey = widget.itemKey;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (String value) {
        debugPrint('MultilineInput saved');
        ResponseModel responseModel =
            Provider.of<ResponseModel>(context, listen: false);
        dynamic response = Utils.constructSingleResponseItem(
            key: itemKey,
            value: value,
            responseItem: responseModel.getResponseItem());
        responseModel.setResponseItem(response);
      },
      controller: myController,
      style: ThemeElements.longTextFormFieldTextStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: ThemeElements.longTextFormFieldTextStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        filled: true,
        focusColor: ThemeElements.primaryColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      keyboardAppearance: Brightness.light,
    );
  }
}
