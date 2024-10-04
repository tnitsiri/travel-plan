import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:remixicon/remixicon.dart';
import 'package:travel_plan/components/result/slot.dart';
import 'package:travel_plan/models/mrt_station.model.dart';

class ResultComponent extends StatefulWidget {
  final List<MrtStationModel> stations;

  const ResultComponent({
    super.key,
    required this.stations,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _ResultComponentState();
  }
}

class _ResultComponentState extends State<ResultComponent> {
  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(
        16,
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ResultSlotComponent(
                station: widget.stations.first,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DottedLine(
                        dashColor: Color(0xFFB8B8B8),
                      ),
                    ),
                    Icon(
                      Remix.arrow_right_double_line,
                      size: 22,
                      color: Color(0xFFB8B8B8),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ResultSlotComponent(
                station: widget.stations.last,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
