import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/config/helpers/hexcolor.dart';
import 'package:food_app/src/data/food_app/food_app_cubit.dart';
import 'package:food_app/src/presentation/views/views.dart';

class FoodLayout extends StatefulWidget {
  const FoodLayout({super.key});

  @override
  State<FoodLayout> createState() => _FoodLayoutState();
}

class _FoodLayoutState extends State<FoodLayout> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final mainColor = '#ff8d07'.toColor();
    final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();
    final blocFoodApp = context.watch<FoodAppCubit>();
    return Scaffold(
      key: homeKey,
      appBar: AppBar(
        title: const Text('HARVEST FESTIVAL'),
        centerTitle: true,
        leading: TextButton(
            onPressed: () {
              homeKey.currentState?.openDrawer();
            },
            child: const DrawerButtonIcon()),
        backgroundColor: mainColor,
      ),
      body: IndexedStack(
        index: index,
        children: [
          const AllFoodScreen(),
          if (blocFoodApp.state.status == FoodAppStatus.success)
            ...blocFoodApp.state.app!.categories.map(
              (category) => FilterCategoryScreen(
                category: category,
              ),
            )
        ],
      ),
      bottomNavigationBar: blocFoodApp.state.status == FoodAppStatus.success
          ? BottomNavigationBar(
              currentIndex: index,
              showUnselectedLabels: true,
              onTap: (int newindex) {
                setState(() {
                  index = newindex;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: mainColor,
                  ),
                  label: "Home",
                  backgroundColor: mainColor.withOpacity(0.5),
                ),
                ...blocFoodApp.state.app!.categories.map(
                  (category) => BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: category.color.toColor(),
                    ),
                    label: category.name,
                    backgroundColor: category.color.toColor().withOpacity(0.3),
                  ),
                )
              ],
            )
          : null,
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.orange.shade100,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: double.infinity,
                height: kToolbarHeight,
                color: mainColor,
              ),
              const SizedBox(height: 20),
              if (blocFoodApp.state.status == FoodAppStatus.success)
                ...blocFoodApp.state.app!.categories.map(
                  (e) => ListTile(
                    leading: Icon(
                      Icons.dangerous,
                      color: e.color.toColor(),
                      size: 30,
                    ),
                    title: Text(
                      e.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    onTap: () => setState(() {
                      index = e.id;
                    }),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
