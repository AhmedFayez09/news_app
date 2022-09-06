import 'package:flutter/material.dart';
import 'package:news_c6/modules/home/news_widget.dart';
import 'package:news_c6/modules/home/tab_item.dart';

import '../../models/SourcesModel.dart';

class TabsController extends StatefulWidget {
  List<Sources> sources;

  TabsController(this.sources);

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
        
          child: TabBar(
            onTap: (index) {

              selectedItem = index;
              setState((){});
            },
            isScrollable: true,
            labelColor: Colors.black,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map((oneSourse) => TabItem(
                    oneSourse, selectedItem == widget.sources.indexOf(oneSourse)))
                .toList(),
          ),
        ),
        Expanded(child: NewsData(widget.sources[selectedItem]))
      ],
    );
  }
}
