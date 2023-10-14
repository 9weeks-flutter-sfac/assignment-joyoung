import 'package:assignment/model/model.dart';
import 'package:assignment/profiledetail.dart';
import 'package:flutter/material.dart';

class textTile extends StatelessWidget {
  const textTile({
    super.key,
    required this.profile,
  });
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return profileDetail(profile: profile);
          },
        ));
      },
      leading: CircleAvatar(
          backgroundColor: Colors.amber,
          backgroundImage: NetworkImage(
            "https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg",
          )),
      title: Text(profile.name),
      subtitle: Text(profile.email),
      trailing: Icon(Icons.navigate_next),
    );
  }
}
