import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_wave/user/model/user_information_model.dart';
import 'package:user_wave/user/ui/user_details.dart';
import 'package:user_wave/user/user_provider/user_provider.dart';
import 'package:user_wave/util/string_const.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  late final UserProvider userProvider;

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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          backgroundColor: Colors.blue,
          title: Text(
            appBarName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<UserProvider>(builder: (create, providr, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: userProvider.userInformation.length,
              itemBuilder: (context, index) {
                UserInformation user = userProvider.userInformation[index];
                return Padding(
                  padding:  EdgeInsets.only(
                      left: 24, right: 24, top: 16, bottom: 16),
                  child: Column(
                    children: [

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetails(
                                        userInformation: user,
                                      )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.username.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text(user.email.toString()),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                            Text(user.phone.toString()),
                            Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        }));
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:user_wave/user/model/user_information_model.dart';
// import 'package:user_wave/user/ui/user_details.dart';
// import 'package:user_wave/user/user_provider/user_provider.dart';
// import 'package:user_wave/util/string_const.dart';
//
// class UserInformationScreen extends StatefulWidget {
//   const UserInformationScreen({super.key});
//
//   @override
//   State<UserInformationScreen> createState() => _UserInformationScreenState();
// }
//
// class _UserInformationScreenState extends State<UserInformationScreen> {
//   late final UserProvider userProvider;
//   TextEditingController searchController = TextEditingController();
//   String searchQuery = '';
//
//   @override
//   void initState() {
//     userProvider = Provider.of<UserProvider>(context, listen: false);
//     userProvider.addData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(24),
//             bottomLeft: Radius.circular(24),
//           ),
//         ),
//         backgroundColor: Colors.blue,
//         title: Text(
//           appBarName,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                 });
//               },
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'Search',
//               ),
//             ),
//           ),
//           Expanded(
//             child: Consumer<UserProvider>(
//               builder: (context, provider, child) {
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: provider.userInformation.length,
//                   itemBuilder: (context, index) {
//                     UserInformation user = provider.userInformation[index];
//                     if (searchQuery.isEmpty ||
//                         user.username.toString().toLowerCase().contains(searchQuery)) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => UserDetails(
//                                   userInformation: user,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 user.username.toString(),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(user.email.toString()),
//                                   Spacer(),
//                                   Icon(Icons.arrow_forward_ios)
//                                 ],
//                               ),
//                               Text(user.phone.toString()),
//                               Divider(),
//                             ],
//                           ),
//                         ),
//                       );
//                     } else {
//                       return SizedBox.shrink(); // Hide if not matching search
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
