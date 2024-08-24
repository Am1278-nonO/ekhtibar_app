/*import 'package:ekhtibar_app/question_info.dart';
import 'package:ekhtibar_app/shared/txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class examApp extends StatefulWidget{
  @override
  State<examApp> createState() => _examAppState();
}

class _examAppState extends State<examApp> {
  @override
  List<QuestionInfo>questionGroup=[
    QuestionInfo(questionImage: 'images/image-1.jpg',questionText: 'عدد كوكب المجموعه الشمسيه',questionAnswer: true),
    QuestionInfo(questionImage: 'images/image-2.jpg',questionText: 'القطط حيوانات لاحمه',questionAnswer: true),
    QuestionInfo(questionImage: 'images/image-3.jpg',questionText: 'الصين موجوده في القاره الافراقيه',questionAnswer: false),
    QuestionInfo(questionImage: 'images/image-4.jpg',questionText: 'الارض مسطحه وليست كراويه',questionAnswer: false),
    QuestionInfo(questionImage: 'images/image-5.jpg',questionText: 'باستطاعه الانسان البقاء علي قيد الحياه بدون اكل لحوم',questionAnswer: true),
    QuestionInfo(questionImage: 'images/image-6.jpg',questionText: 'الشمس تدور حول القمر',questionAnswer: false),
    QuestionInfo(questionImage: 'images/image-7.jpg',questionText: 'الحيونات تدور حول القمر',questionAnswer: false),
  ];
  void checkAnswer(bool whatUserPicked){
    bool correctAnswer=questionGroup[questionNumber].questionAnswer;
   setState(() {
     questionNumber++;
      if (correctAnswer==whatUserPicked) {
        correctAns.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_up,color: Colors.green,size: 20,),
          ),
        );
      }
      else{
        correctAns.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_down,color: Colors.red,size: 20,),
          ),
        );




  List<Widget>correctAns=[];
int questionNumber=0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: txt('اختبار', Colors.white, 20, true),


      ),
    backgroundColor: Colors.grey,
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
           children:  correctAns,
          ),
          Expanded(
            flex: 5,
            child: Image(
                image:AssetImage(questionGroup[questionNumber].questionImage),
            ),
          ),

        Expanded(
          flex: 2,

          child: Center(
            child: txt(questionGroup[questionNumber].questionText,Colors.black, 30, true),

        ),
        ),
      SizedBox(height: 50,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.green,
                  child: txt('صح', Colors.white, 30, true),
                  onPressed: (){

                  setState(() {
                    checkAnswer(true);

                  });
                  }

              ),
            ),
          ),
         SizedBox(height: 20,),
         Expanded(child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: MaterialButton(
               color: Colors.red,
               child: txt('خطا', Colors.white, 30, true),
               onPressed: (){

                 setState(() {

                   checkAnswer(false);
                 });
               }

           ),
         ),),

        ],
      ),
    ),
    );
  }
}


}*/



import 'package:ekhtibar_app/question_info.dart';
import 'package:ekhtibar_app/shared/txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class examApp extends StatefulWidget {
  @override
  State<examApp> createState() => _examAppState();
}

class _examAppState extends State<examApp> {
  List<QuestionInfo> questionGroup = [
    QuestionInfo(
        questionImage: 'images/image-1.jpg',
        questionText: 'عدد كوكب المجموعه الشمسيه',
        questionAnswer: true),
    QuestionInfo(
        questionImage: 'images/image-2.jpg',
        questionText: 'القطط حيوانات لاحمه',
        questionAnswer: true),
    QuestionInfo(
        questionImage: 'images/image-3.jpg',
        questionText: 'الصين موجوده في القاره الافراقيه',
        questionAnswer: false),
    QuestionInfo(
        questionImage: 'images/image-4.jpg',
        questionText: 'الارض مسطحه وليست كراويه',
        questionAnswer: false),
    QuestionInfo(
        questionImage: 'images/image-5.jpg',
        questionText: 'باستطاعه الانسان البقاء علي قيد الحياه بدون اكل لحوم',
        questionAnswer: true),
    QuestionInfo(
        questionImage: 'images/image-6.jpg',
        questionText: 'الشمس تدور حول القمر',
        questionAnswer: false),
    QuestionInfo(
        questionImage: 'images/image-7.jpg',
        questionText: 'الحيونات تدور حول القمر',
        questionAnswer: false),
  ];

  int questionNumber = 0;
  List<Widget> correctAns = [];

  @override
  void initState() {
    super.initState();
    questionNumber = 0;
    correctAns = [];
  }
bool isFinished(){
    if(questionNumber>=questionGroup.length-1){
      return true;
    }
    else{
      return false;
    }
}
void reset(){
    questionNumber=0;
}

  void nextQuestion(){
    if(questionNumber<questionGroup.length-1){
      questionNumber++;
    }
}
  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = questionGroup[questionNumber].questionAnswer;
    setState(() {
      if(isFinished()==true)
      {
      Alert(
      context: context,
style: AlertStyle(
  backgroundColor: Colors.grey,
),
      title: "انتهاء الاختبار",
      desc: "لقد اجابت علي كل الاسءله ",
      buttons: [
      DialogButton(
        color: Colors.black,

        child: Text(
        "ابدء من جديد",
        style: TextStyle(color: Colors.white, fontSize: 20),
        ),

      onPressed: () => Navigator.pop(context),
      width: 150,
      )
      ],
      ).show();
      reset();
      correctAns=[];

      }
      else{
      nextQuestion();
      }


      if (correctAnswer == whatUserPicked) {
        correctAns.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
              size: 20,
            ),
          ),
        );
      } else {
        correctAns.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
              size: 20,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: txt('اختبار', Colors.white, 20, true),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: correctAns,
            ),
            Expanded(
              flex: 5,
              child: Image(
                image: AssetImage(questionGroup[questionNumber].questionImage),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: txt(questionGroup[questionNumber].questionText,
                    Colors.black, 30, true),
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.green,
                  child: txt('صح', Colors.white, 30, true),
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.red,
                  child: txt('خطا', Colors.white, 30, true),
                  onPressed: () {
                    setState(() {
                      checkAnswer(false);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}