import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_wave/user/model/user_information_model.dart';
import 'package:user_wave/user/ui/user_details.dart';
import 'package:user_wave/user/user_provider/user_provider.dart';
import 'package:user_wave/util/color_const.dart';
import 'package:user_wave/util/string_const.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  late final UserProvider userProvider;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.addData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        backgroundColor: appBarColor,
        title: Text(
          appBarName,
          style: const TextStyle(color: appBarTextColor, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: searchColor),
                hintText: searchText,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: searchColor),
                  borderRadius: BorderRadius.circular(8),
                  // Add this line
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.userInformation.length,
                  itemBuilder: (context, index) {
                    UserInformation user = provider.userInformation[index];
                    String username = user.username.toString();
                    String email = user.email.toString().toLowerCase();
                    String phone = user.phone.toString().toLowerCase();

                    if (searchQuery.isEmpty ||
                        username.toLowerCase().contains(searchQuery) ||
                        email.contains(searchQuery) ||
                        phone.contains(searchQuery)) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetails(
                                  userInformation: user,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.username.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    user.email.toString(),
                                    style: const TextStyle(color: emailColor),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios,
                                      size: 14, color: arrowColor),
                                ],
                              ),
                              Text(
                                user.phone.toString(),
                                style: const TextStyle(color:phoneColor),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink(); // Hide if not matching search
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
