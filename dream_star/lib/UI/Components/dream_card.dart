import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Models/dream_info.dart';

class DreamCard extends ConsumerStatefulWidget {
  final AppSide appSide;
  final DreamInfo dreamInfo;

  const DreamCard({super.key, required this.appSide, required this.dreamInfo});
  @override
  DreamCardState createState() => DreamCardState();
}

class DreamCardState extends ConsumerState<DreamCard> {
  final TextEditingController _costController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    _costController.addListener(() {
      final String text = _costController.text;

      setState(() {
        if (text.isEmpty) {
          isButtonDisabled = true;
        } else {
          isButtonDisabled = false;
        }
      });

      _costController.value = _costController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var updateDream = ref.read(fireStoreProvider).updateDreamStatus;
    var updateStars = ref.read(fireStoreProvider).updateStars;
    return Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: tertiary.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width - 32,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  buildLine(),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 86,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            buildTitle(context),
                            const Spacer(),
                            buildCostWidget()
                          ],
                        ),
                        const SizedBox(height: 6),
                        buildDescription(context),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            buildChildName(),
                            const Spacer(),
                            buildButton(updateDream, updateStars)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget buildLine() {
    return Container(
      width: 6,
      decoration: BoxDecoration(
          color: widget.dreamInfo.lineColor,
          borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      widget.dreamInfo.title,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  Widget buildDescription(BuildContext context) {
    return Text(
      widget.dreamInfo.description,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      style: Theme.of(context).textTheme.labelSmall,
    );
  }

  Widget buildCostWidget() {
    switch (widget.appSide) {
      case AppSide.child:
        switch (widget.dreamInfo.status) {
          case DreamStatus.review:
            return const SizedBox.shrink();
          case DreamStatus.approved:
            return buildCostLabel(
                SvgPicture.asset('assets/star-empty-14px-yellow.svg'));
          case DreamStatus.wait:
            return buildCostLabel(
                SvgPicture.asset('assets/star-empty-14px-yellow.svg'));
          case DreamStatus.complete:
            return buildCostLabel(
                SvgPicture.asset('assets/star-filled-14px-yellow.svg'));
        }
      case AppSide.parent:
        switch (widget.dreamInfo.status) {
          case DreamStatus.review:
            return buildCostTextField();
          case DreamStatus.approved:
            return buildCostLabel(
                SvgPicture.asset('assets/star-empty-14px-yellow.svg'));
          case DreamStatus.wait:
            return buildCostLabel(
                SvgPicture.asset('assets/star-empty-14px-yellow.svg'));
          case DreamStatus.complete:
            return buildCostLabel(
                SvgPicture.asset('assets/star-filled-14px-yellow.svg'));
        }
    }
  }

  Widget buildCostTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(width: 1, color: secondary)),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: TextField(
                maxLength: 3,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))
                ],
                decoration: const InputDecoration(
                    counterText: "",
                    hintText: "0",
                    hintStyle: labelMediumStyleSecondary,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero),
                style: labelMediumStylePrimary,
                onChanged: (String text) {
                  _costController.text = text;
                }),
          ),
          SvgPicture.asset(
            'assets/star-empty-14px-tertiary.svg',
          )
        ],
      ),
    );
  }

  Widget buildCostLabel(Widget starImage) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            widget.dreamInfo.cost.toString(),
            style: labelMediumStyle.copyWith(color: primary),
          ),
          const SizedBox(width: 5.0),
          starImage,
        ],
      ),
    );
  }

  Widget buildChildName() {
    return widget.appSide == AppSide.parent
        ? RichText(
            text: TextSpan(
                text: 'child-text'.i18n(),
                style: labelMediumStyle.copyWith(color: secondary),
                children: [
                TextSpan(
                  text: widget.dreamInfo.childName,
                  style: labelMediumStyle.copyWith(color: primary),
                )
              ]))
        : const SizedBox.shrink();
  }

  Widget buildButton(updateDream, updateStars) {
    switch (widget.appSide) {
      case AppSide.child:
        switch (widget.dreamInfo.status) {
          case DreamStatus.review:
            return buildInactiveButton(
                "child-review-dream-button-title".i18n(),
                customTheme
                    .extension<ThemeExtensions>()!
                    .onReviewDreamButtonStyle,
                customTheme
                    .extension<ThemeExtensions>()!
                    .inactiveDreamButtonTextStyle);
          case DreamStatus.approved:
            return buildBuyButton(updateDream, updateStars);
          case DreamStatus.wait:
            return buildInactiveButton(
                "child-await-dream-button-title".i18n(),
                customTheme
                    .extension<ThemeExtensions>()!
                    .onAwaitDreamButtonStyle,
                customTheme
                    .extension<ThemeExtensions>()!
                    .inactiveDreamButtonTextStyle);
          case DreamStatus.complete:
            return const SizedBox.shrink();
        }
      case AppSide.parent:
        switch (widget.dreamInfo.status) {
          case DreamStatus.review:
            return isButtonDisabled
                ? buildInactiveButton(
                    "parent-approved-dream-button-title".i18n(),
                    customTheme
                        .extension<ThemeExtensions>()!
                        .approvedMutedDreamButtonStyle,
                    customTheme
                        .extension<ThemeExtensions>()!
                        .approvedMutedDreamButtonTextStyle)
                : buildApproveButton(updateDream);
          case DreamStatus.approved:
            return const SizedBox.shrink();
          case DreamStatus.wait:
            return buildCompleteButton(updateDream);
          case DreamStatus.complete:
            return const SizedBox.shrink();
        }
    }
  }

  Widget buildInactiveButton(
      String title, Decoration style, TextStyle textStyle) {
    return Container(
      alignment: Alignment.center,
      decoration: style,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }

  Widget buildBuyButton(updateDream, updateStars) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration:
            customTheme.extension<ThemeExtensions>()!.acceptDreamButtonStyle,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          "child-approved-dream-button-title".i18n(),
          style: customTheme
              .extension<ThemeExtensions>()!
              .acceptDreamButtonTextStyle,
        ),
      ),
      onTap: () {
        updateDream(
          widget.dreamInfo.id,
          DreamStatus.wait,
          widget.dreamInfo.cost,
        );
        updateStars(widget.dreamInfo.childId, -widget.dreamInfo.cost);
      },
    );
  }

  Widget buildApproveButton(updateDream) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration:
            customTheme.extension<ThemeExtensions>()!.approvedDreamButtonStyle,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          "parent-approved-dream-button-title".i18n(),
          style: customTheme
              .extension<ThemeExtensions>()!
              .approvedDreamButtonTextStyle,
        ),
      ),
      onTap: () => updateDream(
        widget.dreamInfo.id,
        DreamStatus.approved,
        int.parse(_costController.text),
      ),
    );
  }

  Widget buildCompleteButton(updateDream) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration:
            customTheme.extension<ThemeExtensions>()!.completeDreamButtonStyle,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          "parent-complete-dream-button-title".i18n(),
          style: customTheme
              .extension<ThemeExtensions>()!
              .completeDreamButtonTextStyle,
        ),
      ),
      onTap: () => updateDream(
        widget.dreamInfo.id,
        DreamStatus.complete,
        widget.dreamInfo.cost,
      ),
    );
  }
}
