import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskCard extends ConsumerWidget {
  final AppSide appSide;
  final TaskInfo taskInfo;
  const TaskCard({super.key, required this.appSide, required this.taskInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var updateTask = ref.read(fireStoreProvider).updateTaskStatus;
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: kElevationToShadow[4],
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
                            buildTitle(),
                            const Spacer(),
                            buildCostLabel()
                          ],
                        ),
                        const SizedBox(height: 6),
                        buildDescription(),
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
                            buildButton(updateTask)
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

  Widget buildTitle() {
    return Text(
      taskInfo.title,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17.0),
    );
  }

  Widget buildDescription() {
    return Text(
      taskInfo.description,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      style: const TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12.0),
    );
  }

  Widget buildOverdue() {
    return taskInfo.overdue
        ? SizedBox(
            height: 14.0,
            child: Text(
              'overdue-text'.i18n(),
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0),
            ))
        : const SizedBox.shrink();
  }

  Widget buildCostLabel() {
    return SizedBox(
        child: Row(
      children: [
        Text(getCost().toString(),
            style: TextStyle(
                color: taskInfo.overdue ? Colors.red : Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 12.0)),
        const SizedBox(width: 5.0),
        buildStar()
      ],
    ));
  }

  int getCost() {
    if (taskInfo.penalty == null) {
      return taskInfo.cost;
    } else {
      return taskInfo.cost - taskInfo.penalty!;
    }
  }

  Widget buildStar() {
    switch (taskInfo.status) {
      case TaskStatus.progress:
        if (taskInfo.penalty == null) {
          return SvgPicture.asset('assets/star-empty-14px-yellow.svg',
              height: 12.0, width: 12.0);
        } else {
          return SvgPicture.asset('assets/star-half-dashed-empty-14px-red.svg',
              height: 12.0, width: 12.0);
        }
      case TaskStatus.review:
        if (taskInfo.penalty == null) {
          return SvgPicture.asset('assets/star-empty-14px-yellow.svg',
              height: 12.0, width: 12.0);
        } else {
          return SvgPicture.asset('assets/star-half-dashed-empty-14px-red.svg',
              height: 12.0, width: 12.0);
        }
      case TaskStatus.passed:
        if (taskInfo.penalty == null) {
          return SvgPicture.asset('assets/star-filled-14px-yellow.svg',
              height: 12.0, width: 12.0);
        } else {
          return SvgPicture.asset('assets/star-half-dashed-filled-14px-red.svg',
              height: 12.0, width: 12.0);
        }
    }
  }

  Widget buildChildName() {
    return appSide == AppSide.parent
        ? RichText(
            text: TextSpan(
                text: 'child-text'.i18n(),
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
                children: [
                TextSpan(
                  text: taskInfo.childName,
                  style: const TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0),
                )
              ]))
        : const SizedBox.shrink();
  }

  Widget buildButton(updateTask) {
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
            return buildPassButton(updateTask);
          case TaskStatus.passed:
            return const SizedBox.shrink();
        }
    }
  }

  Widget buildUploadButton(updateTask) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          'progress-button-title'.i18n(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12.0),
        ),
      ),
      onTap: () => updateTask(taskInfo.id, TaskStatus.review),
    );
  }

  Widget buildOnReviewLabel() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Text(
        'review-button-title'.i18n(),
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12.0),
      ),
    );
  }

  Widget buildPassButton(updateTask) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          'pass-button-title'.i18n(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12.0),
        ),
      ),
      onTap: () => updateTask(taskInfo.id, TaskStatus.passed),
    );
  }
}
