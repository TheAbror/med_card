import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetListSingleChoiceItem<T> extends StatelessWidget {
  final String itemTitle;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;

  const BottomSheetListSingleChoiceItem({
    super.key,
    required this.itemTitle,
    required this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    itemTitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Radio(
                  value: value,
                  groupValue: groupValue,
                  activeColor: Colors.blue,
                  onChanged: onChanged,
                  splashRadius: 40,
                  toggleable: false,
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 5.h,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
