import 'package:flutter/material.dart';
import 'package:user_wave/user/model/address_model.dart';
import 'package:user_wave/user/model/user_information_model.dart';
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24)),
        ),
        backgroundColor: Colors.blue,
        title: Text(userAppBarName, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User Name'),
              subtitle: Text(widget.userInformation.username.toString()),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('Email'),
              subtitle: Text(widget.userInformation.email.toString()),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text(widget.userInformation.phone.toString()),
            ),
            Divider(),
            ListTile(title: Text('Address')),
            ListTile(
              leading: Icon(Icons.location_pin),
              title: Text('Street'),
              subtitle:
                  Text(widget.userInformation.address!.street.toString() ?? ''),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('City'),
              subtitle:
                  Text(widget.userInformation.address!.city.toString() ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
