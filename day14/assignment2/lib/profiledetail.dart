import 'package:assignment/model/model.dart';
import 'package:flutter/material.dart';

class profileDetail extends StatelessWidget {
  const profileDetail({super.key, required this.profile});
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    var imageURl =
        "https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Column(children: [
        Stack(clipBehavior: Clip.none, children: [
          Image.network(
            imageURl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          Positioned(
              bottom: -48,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageURl),
                ),
              ))
        ]),
        Container(),
        SizedBox(
          height: 30,
        ),
        Text(profile.name),
        Text(profile.phone),
        Text(profile.address.street),
      ]),
    );
  }
}
