import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/modle/home_bean.dart';
import 'package:flutterapp/router/router_local.dart';
import 'package:flutterapp/toast_flutter.dart';

/// 首页的布局
class HomeContent extends StatefulWidget {
  createState() => new HomeContentWidget();
}

class HomeContentWidget extends State<HomeContent> {
  List titles = ["scaffold1", "scaffold2", "scaffold3"];

  List<HomeBean> homeListData;

  @override
  void initState() {
    super.initState();
    homeListData = new List();
    titles.forEach((element) {
      HomeBean homeBean = HomeBean(element, "icon", "describe");
      homeListData.add(homeBean);
      // homeListData.add(homeBean);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(homeListData.toString());
    ScreenUtil.init(context);
    return RefreshIndicator(
        child: Scaffold(
            floatingActionButton: Icon(Icons.add),
            body: ListView.builder(
              // padding: new EdgeInsets.all(30.0),
              // itemExtent: 50.0,
              itemCount: homeListData.length,
              itemBuilder: (BuildContext context, int index) {
                return itemWidget(index);
              },
            )),
        onRefresh: _doRefresh);
  }

  Future<void> _doRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print("刷新");
      setState(() {
        HomeBean homeBean = HomeBean("text", "icon", "describe");
        homeListData.add(homeBean);
      });
    });
  }

  Widget itemWidget(int index) {
    return GestureDetector(
      onTap: () => {
        SYNToast.show("index = $index"),
        Navigator.of(context).pushNamed(LocalRouter.SCAFFOLD_WIDGET)
      },
      child: ContentWidget(index),
    );
  }

  Widget ContentWidget(int index) {
    ScreenUtil.init(context);
    return Container(
        width: ScreenUtil().setWidth(400),
        height: ScreenUtil().setHeight(300),
        margin: const EdgeInsets.all(10),
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Image.asset("images/default_banner"),
            Text(
              homeListData[index].title,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ));
  }
}
