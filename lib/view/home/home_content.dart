import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/modle/home_bean.dart';
import 'package:flutterapp/router/router_local.dart';

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
    return ListView.builder(
      // padding: new EdgeInsets.all(30.0),
      // itemExtent: 50.0,
      itemCount: homeListData.length,
      itemBuilder: (BuildContext context, int index) {
        return itemWidget(index);
      },
    );
  }

  Widget itemWidget(int index) {
    return new GestureDetector(
      onTap: () => {
        print("index = $index"),
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
        child: Center(
          child: Text(
            homeListData[index].title,
            style: TextStyle(fontSize: 40, color: Colors.red),
          ),
        ));
  }
}
