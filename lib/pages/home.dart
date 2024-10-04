import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_plan/components/search.dart';
import 'package:travel_plan/models/mrt_station.model.dart';
import 'package:travel_plan/services/notify.service.dart';

class HomePage extends StatefulWidget {
  final List<MrtStationModel> mrtStations;

  const HomePage({
    super.key,
    required this.mrtStations,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // State Search
  List<MrtStationModel> _stations = [];

  // ANCHOR Search
  void _search({
    required MrtStationModel startMrtStation,
    required MrtStationModel endMrtStation,
  }) {
    List<MrtStationModel> mrtStations = widget.mrtStations;

    mrtStations.sortBy(
      (e) => e.id_station,
    );

    int startIndex = mrtStations.indexWhere(
      (e) => e.id_station == startMrtStation.id_station,
    );

    if (startIndex < 0) {
      NotifyService.toast(
        context,
        message: 'ไม่พบข้อมูลสถานีต้นทาง',
      );

      return;
    }

    int endIndex = mrtStations.indexWhere(
      (e) => e.id_station == endMrtStation.id_station,
    );

    if (endIndex < 0) {
      NotifyService.toast(
        context,
        message: 'ไม่พบข้อมูลสถานีปลายทาง',
      );

      return;
    }

    int start = startIndex;
    int end = endIndex;

    if (end < start) {
      start = endIndex;
      end = startIndex;
    }

    List<MrtStationModel> stations = [];
    int index = start;

    while (index <= end) {
      stations.add(
        mrtStations[index],
      );

      index++;
    }

    if (mounted) {
      setState(() {
        _stations = stations;
      });
    }
  }

  // ANCHOR Unfocus
  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: _unfocus,
      child: CupertinoPageScaffold(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
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
                  ),
                ],
              ),
            ),
            CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text(
                    'เส้นทางรถไฟฟ้า MRT',
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: SearchComponent(
                      mrtStations: widget.mrtStations,
                      search: _search,
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEBEBEB),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (_stations.isNotEmpty) ...[
                          const Text(
                            'ผลลัพธ์การค้นหาเส้นทาง',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
