import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:travel_plan/components/result/station.dart';
import 'package:travel_plan/models/mrt_station.model.dart';

class ResultDirectionComponent extends StatelessWidget {
  final List<MrtStationModel> stations;

  const ResultDirectionComponent({
    super.key,
    required this.stations,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      decoration: const BoxDecoration(
        color: CupertinoColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Color(0xFFE0E0E0),
                ),
              ),
            ),
            child: Text(
              'เส้นทางตามสถานี',
              style: textStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 16,
                    child: Container(
                      width: 42,
                      padding: EdgeInsets.only(
                        top: 16 + 5,
                        bottom: MediaQuery.of(context).padding.bottom + 5,
                      ),
                      child: Center(
                        child: DottedLine(
                          direction: Axis.vertical,
                          dashColor: CupertinoTheme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: MediaQuery.of(context).padding.bottom > 0
                          ? MediaQuery.of(context).padding.bottom
                          : 10,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (int index = 0;
                            index < stations.length;
                            index++) ...[
                          ResultStationComponent(
                            key: ValueKey(
                              stations[index].id_station,
                            ),
                            station: stations[index],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
