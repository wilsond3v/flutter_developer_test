import 'package:flutter/material.dart';

class TabSliverWidget extends StatelessWidget {
  const TabSliverWidget({
    Key? key,
    required this.tabs,
    required this.tabCtrl,
    this.maxExt = 75.0,
    this.minExt = 60.0,
  }) : super(key: key);

  final List<Widget> tabs;
  final TabController tabCtrl;
  final double maxExt;
  final double minExt;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _HeaderDelegateTab(
        tabs: tabs,
        tabCtrl: tabCtrl,
        maxExt: maxExt,
        minExt: minExt,
      ),
    );
  }
}

class _HeaderDelegateTab extends SliverPersistentHeaderDelegate {
  const _HeaderDelegateTab({
    required this.tabs,
    required this.tabCtrl,
    required this.maxExt,
    required this.minExt,
  });

  final List<Widget> tabs;
  final TabController tabCtrl;
  final double maxExt;
  final double minExt;

  @override
  Widget build(_, double shrinkOffset, bool __) {
    final percent = shrinkOffset / maxExt;
    return _BaseType(
      percent: percent,
      tabs: tabs,
      tabCtrl: tabCtrl,
    );
  }

  @override
  double get maxExtent => maxExt;

  @override
  double get minExtent => minExt;

  @override
  bool shouldRebuild(oldDelegate) => false;
}

class _BaseType extends StatelessWidget {
  const _BaseType({
    Key? key,
    required this.percent,
    required this.tabs,
    required this.tabCtrl,
  }) : super(key: key);

  final double percent;
  final List<Widget> tabs;
  final TabController tabCtrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.titleMedium;
    final size = MediaQuery.of(context).size;
    final topLeftRight = (16.0 * (1 - percent)).clamp(0.0, 16.0);
    final radius = (50.0 * (1 - percent)).clamp(0.0, 50.0);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        elevation: 6,
        color: theme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        margin: EdgeInsets.only(left: topLeftRight, right: topLeftRight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TabBar(
            controller: tabCtrl,
            tabs: tabs,
            indicatorWeight: 0.001,
            indicatorColor: theme.primary,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: theme.primary, width: 2),
              insets: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            padding: EdgeInsets.zero,
            isScrollable: false,
            labelColor: theme.primary,
            unselectedLabelColor: theme.onSurface,
            labelStyle: textTheme?.copyWith(fontWeight: FontWeight.bold),
            // unselectedLabelStyle: textTheme?.copyWith(
            //   fontWeight: FontWeight.normal,
            // ),
          ),
        ),
      ),
    );
  }
}
