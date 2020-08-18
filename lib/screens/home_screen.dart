import 'package:flutter/material.dart';
import 'package:news_app/common/commons.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: ThemeColors.scaffoldBackground,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tech',
              style: TextStyle(color: Colors.black87),
            ),
            Text(
              'News',
              style: TextStyle(color: ThemeColors.primary),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert), onPressed: () => print('more')),
        ],
        bottom: TabBar(
          indicatorColor: Colors.black87,
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.black54,
          controller: _tabController,
          tabs: [
            Tab(
              text: 'WHAT\'S NEW',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'Covid-19',
            )
          ],
        ),
      ),
      drawer: DrawerScreen(),
      body: TabBarView(
        children: [
          WhatsNew(),
          Popular(),
          Covid19(),
        ],
        controller: _tabController,
      ),
    );
  }
}
