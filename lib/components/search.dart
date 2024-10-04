import 'package:flutter/cupertino.dart';
import 'package:remixicon/remixicon.dart';
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
    return Stack(
      children: [
        Positioned.fill(
          child: LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraints,
            ) {
              return Container(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight - (constraints.maxHeight / 3),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        16,
                      ),
                      topRight: Radius.circular(
                        16,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
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
                    color: Color(0xFFF5F5F5),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: const Icon(
                              Remix.search_line,
                              size: 20,
                            ),
                          ),
                          const Text(
                            'ค้นหาเส้นทาง',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
