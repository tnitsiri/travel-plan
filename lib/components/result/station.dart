import 'package:flutter/cupertino.dart';
import 'package:remixicon/remixicon.dart';
import 'package:travel_plan/models/mrt_station.model.dart';

class ResultStationComponent extends StatelessWidget {
  final MrtStationModel station;

  const ResultStationComponent({
    super.key,
    required this.station,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.only(
              right: 12,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoTheme.of(context).primaryColor,
            ),
            child: const Center(
              child: Icon(
                Remix.map_pin_line,
                size: 22,
                color: CupertinoColors.white,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${station.id_station}, ${station.name}',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
                Text(
                  'เวลาโดยประมาณ 3 นาที',
                  style: textStyle.copyWith(
                    fontSize: 12.5,
                    color: const Color(0xFF999999),
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
