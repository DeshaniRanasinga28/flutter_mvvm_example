import 'package:flutter/material.dart';

import '../view_model/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDataViewModel fetchUser;

  @override
  void initState() {
    super.initState();
    fetchUser = UserDataViewModel();
    fetchUser.fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: FutureBuilder<void>(
            future: fetchUser.fetchUserDetails(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
               else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else{
                 return ListView.builder(
                     itemCount: fetchUser.data.data.length,
                     itemBuilder: (context, int index) {
                       var user = fetchUser.data.data.elementAt(index);
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           width: w,
                           height: 100.0,
                           child: Row(
                             children: [
                               Expanded(
                                 flex: 1,
                                 child: Image.network(user.avatar),
                               ),
                               Expanded(
                                 flex: 2,
                                 child: Padding(
                                   padding: const EdgeInsets.only(top: 20.0),
                                   child: Column(
                                     crossAxisAlignment:
                                     CrossAxisAlignment.start,
                                     children: [
                                       Text("${user.firstName} ${user.lastName}"),
                                       const SizedBox(
                                         height: 20.0,
                                       ),
                                       Text(
                                         user.email,
                                         style: const TextStyle(
                                             color: Colors.blue,
                                             fontStyle: FontStyle.italic),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       );
                     });
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
