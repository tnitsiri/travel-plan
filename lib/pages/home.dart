import 'package:flutter/cupertino.dart';
import 'package:travel_plan/components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  // ANCHOR Create state
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'เส้นทางรถไฟฟ้า MRT',
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: SearchComponent(),
              ),
            ),
            // SliverFillRemaining(
            //   hasScrollBody: false,
            //   child: Co ,
            // ),
          ],
        ),
      ),
    );
  }
}
