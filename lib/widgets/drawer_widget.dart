import 'package:flutter/material.dart';
import 'package:news_app/widgets/vertical_spacing.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const VerticalSpacing(20),
                  const Flexible(
                    child: Text('News app'),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(20),
            ListTiles(
              lableList: 'Home',
              functionList: () {},
              iconList: IconlyBold.home,
            ),
            ListTiles(
              functionList: () {},
              lableList: 'Bookmark',
              iconList: IconlyBold.bookmark,
            ),
            const Divider(),
            SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles(
      {Key? key,
      required this.functionList,
      required this.lableList,
      required this.iconList})
      : super(key: key);
  final String lableList;
  final Function functionList;
  final IconData iconList;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconList,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        lableList,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: () {
        functionList();
      },
    );
  }
}
