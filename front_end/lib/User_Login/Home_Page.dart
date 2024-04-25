import 'package:flutter/material.dart';
import 'package:front_end1/serializer/assure.dart';

class home_page extends StatefulWidget {
  assure? assure_instance;
  home_page({super.key, required this.assure_instance});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Text(
            "Welcome",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF017EFB),
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                Text(
                  widget.assure_instance!.first_name,
                  style: TextStyle(
                      fontSize: 50,
                      color: Color(0xFF017EFB),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    widget.assure_instance!.last_name,
                    style: TextStyle(
                        fontSize: 50,
                        color: Color(0xFF017EFB),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        Container(
          height: 70,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xFF401A11),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                    size: 28,
                  ),
                  hintText: "Search you're looking for",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
          ),
        ),
        Container(
          color: Colors.amber,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(bottom: 35, left: 5, right: 5),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Color(0xFFA61414),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      child: Text(
                        "Payment",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Click Here",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 35, left: 5, right: 5),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Color(0xFFA61414),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.dangerous,
                      color: Colors.white,
                      size: 40,
                    ),
                    Container(
                      child: Text(
                        "Create Constat",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Click Here",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        )
      ]),
    );
  }
}
