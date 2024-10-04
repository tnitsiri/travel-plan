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
            const SliverPadding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: SearchComponent(),
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
                    Text(
                      'ผลลัพธ์การค้นหาเส้นทาง',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
