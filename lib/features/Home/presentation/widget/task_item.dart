import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';
import 'package:taskkkk_app/features/Add_Task/data/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: model.color == 0
                  ? AppColor.primary
                  : model.color == 1
                      ? AppColor.orange
                      : model.color == 2
                          ? AppColor.pink
                          : Colors.green,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: getTitleStyle(color: AppColor.white, fontSize: 16),
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: AppColor.white,
                          size: 18,
                        ),
                        const Gap(7),
                        Text(
                          '${model.startTime} : ${model.endTime}',
                          style: getSmallStyle(
                            color: AppColor.white,
                          ),
                        )
                      ],
                    ),
                    const Gap(5),
                    Text(
                      model.note,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyStyle(color: AppColor.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
                child: RotatedBox(quarterTurns: 3, child: Divider()),
              ),
              const Gap(5),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  model.isComplete ? 'COMPLETED' : 'TODO',
                  style: getBodyStyle(color: AppColor.white, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
