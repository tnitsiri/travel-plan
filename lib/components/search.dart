import 'package:flutter/cupertino.dart';
import 'package:remixicon/remixicon.dart';
import 'package:travel_plan/components/input.dart';
import 'package:travel_plan/models/mrt_station.model.dart';
import 'package:travel_plan/plugins/picker/model.dart';
import 'package:travel_plan/plugins/picker/picker.dart';
import 'package:travel_plan/services/notify.service.dart';

class SearchComponent extends StatefulWidget {
  final List<MrtStationModel> mrtStations;
  final Function({
    required MrtStationModel startMrtStation,
    required MrtStationModel endMrtStation,
  }) search;

  const SearchComponent({
    super.key,
    required this.mrtStations,
    required this.search,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _SearchComponentState();
  }
}

class _SearchComponentState extends State<SearchComponent> {
  // ANCHOR State
  final TextEditingController _startMrtStationController =
      TextEditingController();

  final TextEditingController _endMrtStationController =
      TextEditingController();

  MrtStationModel? _startMrtStation;
  MrtStationModel? _endMrtStation;

  // ANCHOR Search
  void _search() {
    if (_startMrtStation == null) {
      NotifyService.toast(
        context,
        message: 'กรุณาเลือกสถานีต้นทาง',
      );

      return;
    } else if (_endMrtStation == null) {
      NotifyService.toast(
        context,
        message: 'กรุณาเลือกสถานีปลายทาง',
      );

      return;
    } else if (_startMrtStation!.id_station == _endMrtStation!.id_station) {
      NotifyService.toast(
        context,
        message: 'ไม่สามารถเลือกสถานีปลายทางเดียวกับสถานีต้นทางได้',
      );

      return;
    }

    widget.search(
      startMrtStation: _startMrtStation!,
      endMrtStation: _endMrtStation!,
    );
  }

  // ANCHOR Select start station
  void _selectStartStation() async {
    List<PickerModel<MrtStationModel>> items = [];

    for (MrtStationModel mrtStation in widget.mrtStations) {
      items.add(
        PickerModel(
          text: mrtStation.name,
          value: mrtStation,
        ),
      );
    }

    int initialItem = 0;

    if (_startMrtStation != null) {
      initialItem = items.indexWhere(
        (e) => e.value.id_station == _startMrtStation!.id_station,
      );
    }

    MrtStationModel? mrtStation = await showCupertinoModalPopup(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Picker.from<MrtStationModel>(
          context,
          initialItem: initialItem,
          items: items,
        );
      },
    );

    if (mrtStation == null) {
      return;
    }

    if (mounted) {
      setState(() {
        _startMrtStation = mrtStation;
        _startMrtStationController.text = mrtStation.name;
      });
    }
  }

  // ANCHOR Select end station
  void _selectEndStation() async {
    List<PickerModel<MrtStationModel>> items = [];

    for (MrtStationModel mrtStation in widget.mrtStations) {
      items.add(
        PickerModel(
          text: mrtStation.name,
          value: mrtStation,
        ),
      );
    }

    int initialItem = 0;

    if (_endMrtStation != null) {
      initialItem = items.indexWhere(
        (e) => e.value.id_station == _endMrtStation!.id_station,
      );
    }

    MrtStationModel? mrtStation = await showCupertinoModalPopup(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Picker.from<MrtStationModel>(
          context,
          initialItem: initialItem,
          items: items,
        );
      },
    );

    if (mrtStation == null) {
      return;
    }

    if (mounted) {
      setState(() {
        _endMrtStation = mrtStation;
        _endMrtStationController.text = mrtStation.name;
      });
    }
  }

  // ANCHOR Dispose
  @override
  void dispose() {
    _startMrtStationController.dispose();
    _endMrtStationController.dispose();

    super.dispose();
  }

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
                      controller: _startMrtStationController,
                      onPressed: _selectStartStation,
                    ),
                    InputComponent(
                      label: 'ไปยังสถานี',
                      hint: 'เลือกสถานีปลายทาง',
                      controller: _endMrtStationController,
                      onPressed: _selectEndStation,
                    ),
                    CupertinoButton(
                      color: CupertinoTheme.of(context).primaryColor,
                      onPressed: _search,
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
