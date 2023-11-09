import 'package:app_demo/core/widgets/app_bar.dart';
import 'package:app_demo/views/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/custom_icons/k_icons.dart';
import 'feeds_view.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 5, vsync: this);
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: KAppBar(
          titleText: 'SeeQul',
          bgColor: Colors.white,
          spacing: 0.0,
          leadingView: GestureDetector(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox.square(
                    dimension: 32.0,
                    child: Image.asset(
                      'assets/icons/placeholder.png',
                    ),
                  ),
                ),
                // const MenuIcon(),
              ],
            ),
            onTap: () {},
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            FeedsView(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          surfaceTintColor: Colors.black,
          padding: EdgeInsets.zero,
          child: Container(
            color: const Color(0x552E2E2E),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                  icon: KIcons.apps,
                  title: 'Apps',
                  isActive: tabController.index == 0,
                  onTap: () => tabController.animateTo(0),
                ),
                TabButton(
                  icon: KIcons.videochat,
                  title: 'Qucon',
                  isActive: tabController.index == 1,
                  showChip: true,
                  onTap: () => tabController.animateTo(1),
                ),
                TabButton(
                  icon: KIcons.robot,
                  title: 'Zaady',
                  isActive: tabController.index == 2,
                  onTap: () => tabController.animateTo(2),
                ),
                TabButton(
                  icon: KIcons.organize,
                  title: 'Organize',
                  isActive: tabController.index == 3,
                  onTap: () => tabController.animateTo(3),
                ),
                TabButton(
                  icon: KIcons.profile,
                  title: 'Organize',
                  isActive: tabController.index == 4,
                  onTap: () => tabController.animateTo(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
