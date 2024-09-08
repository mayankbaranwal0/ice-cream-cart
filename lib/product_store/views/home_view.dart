import 'package:flutter/material.dart';
import 'package:ice_cream_cart/product_store/model/app_state_model.dart';
import 'package:ice_cream_cart/product_store/views/cart_view.dart';
import 'package:ice_cream_cart/product_store/views/icecream_view.dart';
import 'package:ice_cream_cart/product_store/views/search_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: model.currentIndex,
          children: const [
            IceCreamView(),
            SearchView(),
            CartView(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: model.currentIndex,
        onDestinationSelected: model.changeIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Ionicons.ice_cream_outline),
            label: 'Ice Creams',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.search_outline),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.cart_outline),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
