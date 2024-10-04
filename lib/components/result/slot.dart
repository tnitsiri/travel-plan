import 'package:flutter/cupertino.dart';
import 'package:travel_plan/models/mrt_station.model.dart';

class ResultSlotComponent extends StatelessWidget {
  final MrtStationModel station;

  const ResultSlotComponent({
    super.key,
    required this.station,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          station.id_station,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          station.name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF858585),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
