import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  static String id = "faq";
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "FAQ's",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SectionName(
            name: "PAYMENTS",
          ),
          FaqQestion(
            ques: "HOW DO I PAY?",
            ans: "You can pay online using debit/credit cards.",
          ),
          SectionName(
            name: "PAYMENTS",
          ),
          FaqQestion(
            ques: "HOW DO I PAY?",
            ans: "You can pay online using debit/credit cards.",
          ),
          SectionName(
            name: "PAYMENTS",
          ),
          FaqQestion(
            ques: "HOW DO I PAY?",
            ans: "You can pay online using debit/credit cards.",
          ),
          SectionName(
            name: "PAYMENTS",
          ),
          FaqQestion(
            ques: "HOW DO I PAY?",
            ans: "You can pay online using debit/credit cards.",
          ),
        ],
      ),
    );
  }
}

class SectionName extends StatelessWidget {
  final String name;
  SectionName({this.name});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.deepPurple,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}

class FaqQestion extends StatelessWidget {
  final String ques;
  final String ans;

  FaqQestion({this.ques, this.ans});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      title: Text(
        ques,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17, bottom: 10, right: 17),
          child: Text(
            ans,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
