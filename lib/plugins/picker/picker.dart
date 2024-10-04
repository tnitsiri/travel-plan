import 'package:flutter/cupertino.dart';
import 'package:travel_plan/plugins/picker/model.dart';

// ANCHOR Picker
class Picker {
  // ANCHOR From
  static Widget from<T>(
    BuildContext context, {
    required int initialItem,
    required List<PickerModel<T>> items,
  }) {
    T value = items[initialItem].value;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(
              context,
            ),
            border: const Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xFFC2C2C2),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.zero,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'ยกเลิก',
                  style: TextStyle(
                    color: Color(0xFF7A7A7A),
                  ),
                ),
              ),
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.zero,
                onPressed: () => Navigator.of(context).pop(
                  value,
                ),
                child: const Text(
                  'ตกลง',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 216,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(
            top: 6,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
          ),
          child: SafeArea(
            top: false,
            child: CupertinoPicker(
              useMagnifier: true,
              magnification: 1.22,
              squeeze: 1.2,
              itemExtent: 32,
              scrollController: FixedExtentScrollController(
                initialItem: initialItem,
              ),
              onSelectedItemChanged: (int index) {
                PickerModel item = items[index];
                value = item.value;
              },
              children: List.generate(
                items.length,
                (
                  int index,
                ) {
                  PickerModel item = items[index];

                  return Center(
                    child: Text(
                      item.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
