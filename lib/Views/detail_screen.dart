import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Provider/gita_provider.dart';
import '../utils/Global/global.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GitaProvider gitaProvider =
    Provider.of<GitaProvider>(context, listen: true);
    Provider.of<GitaProvider>(context, listen: false);
    return  Scaffold(
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
              PopupMenuButton<String>(
                color:  Color(0xff7d522f),
                icon: Icon(Icons.gamepad_rounded,color: Color(0xfff5d693),),
                onSelected: (String result) {
                  switch (result) {
                    case 'Languages':
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shadowColor: Colors.white,
                            title: Icon(Icons.language, size: 40),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Choose your preferred language\n(Don\'t worry, you can change it later.)',
                                  textAlign: TextAlign.center, style:
                                TextStyle(fontSize: 15),
                                ),
                                ListTile(
                                  title: Text('Sanskrit'),
                                  leading: Radio<String>(
                                    activeColor: Color(0xfff5d693),
                                    value: 'Sanskrit',
                                    groupValue: gitaProvider.selectLanguage,
                                    onChanged: (String? value) {
                                      gitaProvider.languageTranslate(value!);
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text('Hindi'),
                                  leading: Radio<String>(
                                    activeColor:Color(0xfff5d693),

                                    value: 'Hindi',
                                    groupValue: gitaProvider.selectLanguage,
                                    onChanged: (String? value) {

                                      gitaProvider.languageTranslate(value!);
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text('English'),
                                  leading: Radio<String>(
                                    activeColor:Color(0xfff5d693),
                                    value: 'English',
                                    groupValue: gitaProvider.selectLanguage,
                                    onChanged: (String? value) {
                                      gitaProvider.languageTranslate(value!);

                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text('Gujarati'),
                                  leading: Radio<String>(
                                    activeColor:Color(0xfff5d693),
                                    value: 'Gujarati',
                                    groupValue: gitaProvider.selectLanguage,
                                    onChanged: (String? value) {
                                      gitaProvider.languageTranslate(value!);
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Color(0xfff5d693),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK, LET'S GO!",style: TextStyle(
                                    color:Color(0xff7d522f) ,
                                  ),),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      break;
                    case 'Settings':
                      Navigator.of(context).pushNamed('/setting');
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Languages',
                    child: ListTile(
                      leading: Icon(Icons.language,
                          color:  Color(0xff7d522f),),
                      title: Text(
                        'Languages',
                        style: TextStyle(
                            color: Color(0xfff5d693),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ],
        ),
      body:
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/3.jpg'
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              color: Color(0xfff5d693),
            ),
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ...List.generate(gitaProvider.gitaModalList.length, (index)=>
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' ${gitaProvider.gitaModalList[selectIndex].chapterName.english} ',
                                  style: const TextStyle(
                                    color: Color(0xffdbbc79),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),),
                                SizedBox(height: 10,),
                                SelectableText('${gitaProvider.gitaModalList[selectIndex].verses[index].language.sanskrit}',
                                  style: const TextStyle(
                                      color: Color(0xffdbbc79),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
    );
  }
}

