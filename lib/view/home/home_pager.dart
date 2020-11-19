import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/view/home/home_content.dart';

/// 首页实现tab切换暂定2个选项StatefulWidget和StatelessWidget
/// TabView + PageView

/// Scaffold 实现了基本的 Material 布局。只要是在 Material 中定义了的单个界面显示的布局控件元素，都可以使用 Scaffold 来绘制。
/// 提供展示抽屉（drawers，比如：左边栏）、通知（snack bars） 以及 底部按钮（bottom sheets）。
/// 我们可以将 Scaffold 理解为一个布局的容器。可以在这个容器中绘制我们的用户界面。

class HomePager extends StatefulWidget {
  createState() => new HomePagerWidget();
}

class HomePagerWidget extends State<HomePager>
    with SingleTickerProviderStateMixin {
  List<String> titles = ['首页', '收藏', '我的'];

  TabController _tabController;
  PageController _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: titles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        // 底部
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.home),
                text: titles[0],
              ),
              Tab(
                icon: Icon(Icons.collections),
                text: titles[1],
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: titles[2],
              ),
            ],
            // indicatorColor: Colors.red,
            indicator: const BoxDecoration(),
            controller: _tabController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomeContent(),
            // Text(titles[0]),
            Text(titles[1]),
            Text(titles[2])
//          TopPageViewDemo(),
          ],
          onPageChanged: (index) {
            _tabController.animateTo(index);
          },
        ),
        drawer: Text("drawer"));
  }
}
