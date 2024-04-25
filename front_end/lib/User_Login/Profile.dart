import 'package:flutter/material.dart';
import 'package:front_end1/User_Login/info_exemple.dart';
import 'package:front_end1/serializer/assure.dart';

class profile_page extends StatefulWidget {
  assure? assure_instance;
  profile_page({super.key, required this.assure_instance});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 30),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 180,
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/profile.jpg")),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 49,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(120))),
            ),
          ),
          info_ex(
            assure_instance_info: widget.assure_instance!.numr_tlfn.toString(),
            name: "Numr Tlfn :           ",
          ),
          info_ex(
            assure_instance_info: widget.assure_instance!.first_name,
            name: "First Name :     ",
          ),
          info_ex(
            assure_instance_info: widget.assure_instance!.last_name,
            name: "Last Name :   ",
          ),
          info_ex(
            assure_instance_info: widget.assure_instance!.email_user,
            name: "Email :       ",
          ),
          info_ex(
            assure_instance_info: widget.assure_instance!.num_permis.toString(),
            name: "Num Permis :     ",
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 90),
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: MaterialButton(
              onPressed: () {},
              child: Text("Edit Profile",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
