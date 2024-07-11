import 'package:flutter/material.dart';
import 'package:flutter01/Widgets/item_details.dart';
import 'package:flutter01/Widgets/search01.dart';
import 'package:flutter01/blocs/item_bloc.dart';
import 'package:flutter01/blocs/item_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.black54,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text("Details",
                        style: TextStyle(color: Colors.black)))),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => ItemBloc()..add(LoadItems()),
        child: TabBarView(
          controller: _tabController,
          children: [
            DetailsTab(),
          ],
        ),
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/BG.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Search01(),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ItemDetailsSection(),
          ),
        ],
      ),
    );
  }
}
