import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          children: [BuildHeader(context), BuildMenuItems(context)],
        )),
      );
}

Widget BuildHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 52,
          ),
          SizedBox(
            height: 12,
          ),
          Text("PoryaSadegji"),
          Text("pouriasadeghi18@gmail.com"),
          SizedBox(
            height: 12,
          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
Widget BuildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        runSpacing: 16.0,
        children: [
          ListTile(
            leading: const Icon(FontAwesomeIcons.house),
            title: const Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.rectangleList),
            title: const Text("Category"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.gears),
            title: const Text("Setting"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleInfo),
            title: const Text("Info"),
            onTap: () {},
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.rightFromBracket),
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
