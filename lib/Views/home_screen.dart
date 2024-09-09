import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/gita_provider.dart';
import '../utils/Global/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GitaProvider gitaProvider =
        Provider.of<GitaProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7d522f),
        scrolledUnderElevation: 0.01,
        centerTitle: true,
        leading:Icon(Icons.gamepad_rounded,color: Color(0xfff5d693),),
        title: const Text(
          'श्रीमद भगवद गीता ',
          style: TextStyle(
              height: 0.1,
              color: Color(0xfff5d693),
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(Icons.gamepad_rounded,color: Color(0xfff5d693),),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/images.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
          color: Color(0xfff5d693),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            ...List.generate(
              gitaProvider.gitaModalList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    selectIndex = index;
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Container(
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0xffdda223),
                          spreadRadius: 1
                        )
                      ],
                      // border: Border.all(color: Color(0xffdda223), width: 2),
                      color: Color(0xff7d522f),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('||  ${gitaProvider.gitaModalList[index].chapter} :- ${gitaProvider.gitaModalList[index].chapterName.sanskrit}  ||',
                          style: const TextStyle(
                              color : Color(0xffdbbc79),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
