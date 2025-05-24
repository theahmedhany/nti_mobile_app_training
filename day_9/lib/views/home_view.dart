import 'package:flutter/material.dart';
import 'package:practice_1/constants.dart';
import 'package:practice_1/models/order_manager.dart';
import 'package:practice_1/views/account_view.dart';
import 'package:practice_1/views/main_home_view.dart';
import 'package:practice_1/views/orders_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.changeTheme,
    required this.changeColorSeed,
  });

  final void Function() changeTheme;
  final void Function(int) changeColorSeed;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final OrderManager _orderManager = OrderManager();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      MainHomeView(orderManager: _orderManager),
      OrdersView(orderManager: _orderManager),
      const AccountView(),
    ];
  }

  List<Widget> _buildNavigationBarItems() {
    return [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: 'Home',
      ),
      NavigationDestination(
        icon: const Icon(Icons.category_outlined),
        selectedIcon: const Icon(Icons.category),
        label: 'Orders',
      ),
      NavigationDestination(
        icon: const Icon(Icons.person_2_outlined),
        selectedIcon: const Icon(Icons.person_2),
        label: 'Account',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: _buildNavigationBarItems(),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
      appBar: AppBar(
        title: Text('Yummy'),
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: widget.changeTheme,
            icon:
                Theme.of(context).brightness == Brightness.dark
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
          ),
          PopupMenuButton<int>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            itemBuilder: (_) {
              return List.generate(ColorSelection.values.length, (index) {
                return PopupMenuItem(
                  value: index,
                  child: Row(
                    children: [
                      Icon(
                        Icons.opacity_outlined,
                        color: ColorSelection.values[index].color,
                      ),
                      const SizedBox(width: 10),
                      Text(ColorSelection.values[index].label),
                    ],
                  ),
                );
              });
            },
            onSelected: widget.changeColorSeed,
            icon: const Icon(Icons.opacity_outlined),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _buildScreens()),
    );
  }
}
