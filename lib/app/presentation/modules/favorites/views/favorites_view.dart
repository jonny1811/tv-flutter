import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/favorites/favorites_controller.dart';
import '../../../global/widgets/request_failed.dart';
import 'widgets/favorites_content.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, 
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesController controller = context.watch();
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text('Favorites'),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          controller: _tabController,
          indicator: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(30.0),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black,
          tabs:  [
            const SizedBox(
              height: 30.0,
              child:  Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Movies',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
              child: Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Series',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: controller.state.map(
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ), 
        failed: (_) => RequestFailed(
          onRetry: () => controller.init(),
        ), 
        loaded: (state) => FavoritesContent(
          state: state,
          tabController: _tabController,
        ),
      ),
    );
  }
}