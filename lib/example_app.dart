import 'package:flutter/material.dart';
import 'package:lazyloadlistview/lazy_load_list_view/lazy_load_list_view_widget.dart';

class LazyListViewExampleWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LazyListViewExampleWidgetsState();
}

class LazyListViewExampleWidgetsState extends State<LazyListViewExampleWidgets> {
  late List<String> _itemCounts;

  uiBuild(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
              child: LazyLoadListViewWidget.builder(
                itemCount: _itemCounts.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRowFrameLayout(position, context);
                },
                onLoadMore: (double metricsPixels, double metricsMaxScrollExtent) {
                  // ToastMsgUtil.showNromMsg(context, 'onLoadMore');
                  print('onLoadMore:$metricsPixels');
                  addDatas();
                },
                onRefresh: () async {
                  // ToastMsgUtil.showNromMsg(context, 'onRefresh');
                  initDatas();
                },
              ),
            ),
            flex: 150),
      ],
    );
  }

  Widget getRowFrameLayout(int dataIndex, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        color: Color(0x889f0000),
        height: 300,
        child: Center(
          child: GestureDetector(
            child: Text(
              '$dataIndex',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
              ),
            ),
            onTap: () {
              // ToastMsgUtil.showNromMsg(context, 'Touch , $dataIndex');
            },
          ),
        ),
      ),
    );
  }

  initDatas() {
    //初始化数据
    _itemCounts = <String>[];
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    setState(() {
      // _itemCounts = _itemCounts;
    });
  }

  addDatas() {
    //初始化数据
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    _itemCounts.add('value');
    setState(() {
      // _itemCounts = _itemCounts;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return uiBuild(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatas();
  }
}
