import '../../../../../configs/theme_config.dart';
import '../../../../../constants/app_constants.dart';
import '../../../../../utils/ui_utils/spacer_widget.dart';
import '../../../../../utils/ui_utils/text_styles/custom_text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionHeaderData extends StatefulWidget {
  String? heading;
  String? content;
  Color? headingColor;
  Color? contentColor;
  CrossAxisAlignment crossAlign;

  TransactionHeaderData(
      {Key? key,
      this.heading,
      this.content,
      this.crossAlign = CrossAxisAlignment.start,
      this.headingColor = const Color(0xFF000000),
      this.contentColor = const Color(0xFF000000)})
      : super(key: key);

  @override
  State<TransactionHeaderData> createState() => _TransactionHeaderDataState();
}

class _TransactionHeaderDataState extends State<TransactionHeaderData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: widget.crossAlign,
      children: [
        Text(widget.heading!,
            textAlign: TextAlign.end,
            style: getTextStyle(
              fontWeight: FontWeight.w500,
              color: widget.headingColor,
              fontSize: MEDIUM_MINUS_FONT_SIZE,
            )),
        hightSpacer5,
        Text(
          widget.content!,
          style: getTextStyle(
              fontSize: MEDIUM_MINUS_FONT_SIZE, color: widget.contentColor),
        )
      ],
    );
  }
}
