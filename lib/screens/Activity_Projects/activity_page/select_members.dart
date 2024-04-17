
/////////////////////////////////// Members List ////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_application_stage_project/screens/Activity_Projects/activity_page/contact.dart';

class SelectContact extends StatelessWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          titleSpacing: 10,
          backgroundColor: Colors.purple,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: Colors.white)),
          ],
        ),
        body: selectcontact());
  }

  selectcontact() {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/97/e4/2a/97e42a82fc7911961d3ca55f54d1372c.jpg",
          name: "Franklin",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/3a/85/42/3a8542b02e27fb5e79a1f5c760974b26.jpg",
          name: "Sara",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/736x/36/db/a1/36dba1495ee2414c115122a9ee373e43.jpg",
          name: "Lara",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/736x/f9/8a/d3/f98ad390250f5fb20b289ba22e80130a.jpg",
          name: "John",
        ),
        SelCon(
          profile:
              "https://cdn.barkhat.news/newsmedia/2020/11/27/278038101606445405.jpg",
          name: "Asqar",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/c2/6b/be/c26bbebaa17d435d411fd41f4420b805.jpg",
          name: "Hero Fiennes",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/7e/09/d1/7e09d10dead13dc2b6b40a9a8ce10d69.jpg",
          name: "Lana",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/97/e4/2a/97e42a82fc7911961d3ca55f54d1372c.jpg",
          name: "Franklin",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/3a/85/42/3a8542b02e27fb5e79a1f5c760974b26.jpg",
          name: "Sara",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/736x/36/db/a1/36dba1495ee2414c115122a9ee373e43.jpg",
          name: "Lara",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/736x/f9/8a/d3/f98ad390250f5fb20b289ba22e80130a.jpg",
          name: "John",
        ),
        SelCon(
          profile:
              "https://cdn.barkhat.news/newsmedia/2020/11/27/278038101606445405.jpg",
          name: "Asqar",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/c2/6b/be/c26bbebaa17d435d411fd41f4420b805.jpg",
          name: "Hero Fiennes",
        ),
        SelCon(
          profile:
              "https://i.pinimg.com/564x/7e/09/d1/7e09d10dead13dc2b6b40a9a8ce10d69.jpg",
          name: "Lana",
        ),
      ],
    );
  }
}


class SelCon extends StatelessWidget {
  SelCon({
    required this.profile,
    required this.name,
  });

  final String profile;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, Contact(name: name, image: profile));
      },

      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(profile),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}