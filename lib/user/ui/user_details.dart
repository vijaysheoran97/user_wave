import 'package:flutter/material.dart';
import 'package:user_wave/user/model/address_model.dart';
import 'package:user_wave/user/model/user_information_model.dart';
import 'package:user_wave/util/color_const.dart';
import 'package:user_wave/util/string_const.dart';

class UserDetails extends StatefulWidget {
  UserDetails({required this.userInformation, super.key});

  UserInformation userInformation;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<Address> addressList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24)),
        ),
        backgroundColor: appBarColor,
        title: Text(
          userAppBarName,
          style: const TextStyle(color: appBarTextColor, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: backIconArrowColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 28,
              ),
              title: Text(
                userName,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(widget.userInformation.username.toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.email_outlined,
                size: 28,
              ),
              title: Text(
                email,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(widget.userInformation.email.toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                size: 28,
              ),
              title: Text(
                phone,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(widget.userInformation.phone.toString()),
            ),
            const Divider(),
            ListTile(
                title: Text(
              address,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
            ListTile(
              leading: const Icon(
                Icons.location_pin,
                size: 28,
              ),
              title: Text(
                street,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:
                  Text(widget.userInformation.address!.street.toString() ?? ''),
            ),
            ListTile(
              leading: const Icon(
                Icons.location_city,
                size: 28,
              ),
              title: Text(
                city,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle:
                  Text(widget.userInformation.address!.city.toString() ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
