import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskCard extends ConsumerWidget {
  final AppSide appSide;
  final TaskInfo taskInfo;
  const TaskCard({super.key, required this.appSide, required this.taskInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var updateTask = ref.read(fireStoreProvider).updateTaskStatus;
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
                            buildCostLabel()
                          ],
                        ),
                        const SizedBox(height: 6),
                        buildDescription(context),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildOverdue(),
                                const SizedBox(height: 2),
                                buildChildName()
                              ],
                            ),
                            const Spacer(),
                            buildButton(updateTask, updateStars)
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
          color: taskInfo.lineColor, borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      taskInfo.title,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  Widget buildDescription(BuildContext context) {
    return Text(
      taskInfo.description,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      style: Theme.of(context).textTheme.labelSmall,
    );
  }

  Widget buildOverdue() {
    return taskInfo.isOverdue()
        ? SizedBox(
            height: 14.0,
            child: Text(
              'overdue-text'.i18n(),
              style: labelMediumStyle,
            ),
          )
        : buildCompleteUntil();
  }

  Widget buildCompleteUntil() {
    return taskInfo.deadline == null || taskInfo.status != TaskStatus.progress
        ? const SizedBox.shrink()
        : Row(
            children: [
              SizedBox(
                height: 14.0,
                child: Text(
                  'complete-before-text'.i18n(),
                  style: labelMediumStyle,
                ),
              ),
              const SizedBox(
                width: 3.0,
              ),
              SizedBox(
                height: 14.0,
                child: Text(
                  DateFormat('dd.MM.yyyy').format(taskInfo.deadline!),
                  style: labelMediumStyle,
                ),
              ),
            ],
          );
  }

  Widget buildCostLabel() {
    return SizedBox(
      child: Row(
        children: [
          Text(
            getCost().toString(),
            style: taskInfo.isOverdue()
                ? labelMediumStyle.copyWith(color: red)
                : labelMediumStyle.copyWith(color: primary),
          ),
          const SizedBox(width: 5.0),
          buildStar(),
        ],
      ),
    );
  }

  int getCost() {
    if (taskInfo.penalty == null || !taskInfo.isOverdue()) {
      return taskInfo.cost;
    } else {
      return taskInfo.cost - taskInfo.penalty!;
    }
  }

  Widget buildStar() {
    switch (taskInfo.status) {
      case TaskStatus.progress:
        if (taskInfo.penalty == null || !taskInfo.isOverdue()) {
          return SvgPicture.asset('assets/star-empty-14px-yellow.svg');
        } else {
          return SvgPicture.asset('assets/star-half-dashed-empty-14px-red.svg');
        }
      case TaskStatus.review:
        if (taskInfo.penalty == null || !taskInfo.isOverdue()) {
          return SvgPicture.asset('assets/star-empty-14px-yellow.svg');
        } else {
          return SvgPicture.asset('assets/star-half-dashed-empty-14px-red.svg');
        }
      case TaskStatus.passed:
        if (taskInfo.penalty == null || !taskInfo.isOverdue()) {
          return SvgPicture.asset('assets/star-filled-14px-yellow.svg');
        } else {
          return SvgPicture.asset(
              'assets/star-half-dashed-filled-14px-red.svg');
        }
    }
  }

  Widget buildChildName() {
    return appSide == AppSide.parent
        ? RichText(
            text: TextSpan(
                text: 'child-text'.i18n(),
                style: labelMediumStyle.copyWith(color: secondary),
                children: [
                TextSpan(
                  text: taskInfo.childName,
                  style: labelMediumStyle.copyWith(color: primary),
                )
              ]))
        : const SizedBox.shrink();
  }

  Widget buildButton(updateTask, updateStars) {
    switch (appSide) {
      case AppSide.child:
        switch (taskInfo.status) {
          case TaskStatus.progress:
            return buildUploadButton(updateTask);
          case TaskStatus.review:
            return buildOnReviewLabel();
          case TaskStatus.passed:
            return const SizedBox.shrink();
        }
      case AppSide.parent:
        switch (taskInfo.status) {
          case TaskStatus.progress:
            return const SizedBox.shrink();
          case TaskStatus.review:
            return buildPassButton(updateTask, updateStars);
          case TaskStatus.passed:
            return const SizedBox.shrink();
        }
    }
  }

  Widget buildUploadButton(updateTask) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration:
            customTheme.extension<ThemeExtensions>()!.sendTaskButtonStyle,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          'progress-button-title'.i18n(),
          style:
              customTheme.extension<ThemeExtensions>()!.sendTaskButtonTextStyle,
        ),
      ),
      onTap: () => updateTask(
        taskInfo.id,
        TaskStatus.review,
        taskInfo.isOverdue(),
      ),
    );
  }

  Widget buildOnReviewLabel() {
    return Container(
      alignment: Alignment.center,
      decoration:
          customTheme.extension<ThemeExtensions>()!.onReviewTaskButtonStyle,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Text(
        'review-button-title'.i18n(),
        style: customTheme
            .extension<ThemeExtensions>()!
            .onReviewTaskButtonTextStyle,
      ),
    );
  }

  Widget buildPassButton(updateTask, updateStars) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration:
            customTheme.extension<ThemeExtensions>()!.acceptTaskButtonStyle,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          'pass-button-title'.i18n(),
          style: customTheme
              .extension<ThemeExtensions>()!
              .acceptTaskButtonTextStyle,
        ),
      ),
      onTap: () {
        updateTask(taskInfo.id, TaskStatus.passed, taskInfo.isOverdue());
        var cost = taskInfo.penalty == null || !taskInfo.isOverdue()
            ? taskInfo.cost
            : taskInfo.cost - taskInfo.penalty!;
        updateStars(taskInfo.childId, cost);
      },
    );
  }
}
