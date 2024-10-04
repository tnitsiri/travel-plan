import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_plan/components/input.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({
    super.key,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _SearchComponentState();
  }
}

class _SearchComponentState extends State<SearchComponent> {
  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 12,
            ),
            child: const Text(
              'คุณต้องการจะเดินทางไปไหน?',
              style: TextStyle(
                color: const Color(0xFFF5F5F5),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputComponent(
                  label: 'จากสถานี',
                  hint: 'เลือกสถานีต้นทาง',
                  onPressed: () {},
                ),
                InputComponent(
                  label: 'ไปยังสถานี',
                  hint: 'เลือกสถานีปลายทาง',
                  onPressed: () {},
                ),
                CupertinoButton(
                  color: CupertinoTheme.of(context).primaryColor,
                  onPressed: () {},
                  child: const Text(
                    'ค้นหาเส้นทาง',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
