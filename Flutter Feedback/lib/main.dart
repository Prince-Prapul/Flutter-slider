import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());
var app = MyApp();

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slider',
      theme: ThemeData(
        // primaryColor: Color(0xffff520d),
        //primaryColor: Color(0xff512ea8),
          primaryColor: Color(0xff85d73e),
          backgroundColor: Color(0xff3ed788)
      ),

      home: HomePage(),

    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  var myFeedbackText = "Hi Guys" ;
  double rating = 1.0;
  double sliderValue = 0.0;
  int count = 0;
  List<String> question = [
    'Wait,Am I writing Exam now?',
    'Is this the 2nd Question?',
    'I think I missed one Question?',
    'So,Why am I in 4th Question?',
    'Are above questions so hard?',
    'How was my first app guys?'
  ];

  Image myFeedback = Image.network('https://media.giphy.com/media/dw36yjtOAtuSZyxEJG/source.gif');
  Color myFeedbackColor = Colors.red;

  Color color = Colors.amberAccent;
  String get resultText {
    String text;
    if (sliderValue <= 10) {
      text = "Sorry for the inconvenience";
      color = Colors.red;
    } else if (sliderValue <= 20) {
      text = "Hope we serve you better next time";
      color = Colors.yellow;
    } else {
      text = "We hope you come back next time";
      color = Colors.green;
    }

    return text;
  }

  void reset() {
    setState(() {
      sliderValue = 0.0;
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.timer), onPressed: () {
            //
          }),
          title: Text("Feedback APP"),
          centerTitle: true,
          backgroundColor: Colors.black,


          actions: <Widget>[
            IconButton(icon: Icon(Icons.accessible
            ), onPressed: () {
              //
            }),
          ],
        ),
        body: count < 6

            ?Container(
          // color: Color(0xff100f0f),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://media.giphy.com/media/l378wcSfS7eXWQgla/giphy.gif'),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
              children: <Widget>[
                Container(child:Padding(
                  padding: const EdgeInsets.all(26.0),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        question[count],
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[750],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height:30.0),
                      Container(
                        child: Align(
                            child: Material(
                              color: Colors.white,
                              elevation: 14.0,
                              borderRadius: BorderRadius.circular(24.0),
                              shadowColor: Color(0x802196F3),
                              child: Container(
                                  width: 350.0,
                                  height: 350.0,
                                  child: Column(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(child: Text(myFeedbackText,
                                        style: TextStyle(color: Colors.black, fontSize: 22.0),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // child: Image ( myFeedback, image: null,)
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Slider(
                                          min: 1.0,
                                          max: 5.0,
                                          divisions: 4,
                                          value: rating,
                                          activeColor: Color(0xffff520d),
                                          inactiveColor: Colors.blueGrey,
                                          onChanged: (newValue) {
                                            setState(() {
                                              rating = newValue;
                                              if (rating >= 0.0 && rating <= 1.0) {

                                                myFeedback = Image.network('https://media.giphy.com/media/3oEjHD764dj1LVz2j6/source.gif');
                                                myFeedbackColor = Colors.red;
                                                myFeedbackText = "COULD BE BETTER";
                                              }
                                              if (rating >= 1.1 && rating <= 2.0) {
                                                myFeedback = Image.network('https://media.giphy.com/media/J2rt2Q0rZMi8yuTmvq/giphy.gif');
                                                myFeedbackColor = Colors.yellow;
                                                myFeedbackText = "BELOW AVERAGE";
                                              }
                                              if (rating >= 2.1 && rating <= 3.0) {
                                                myFeedback = Image.network('https://media.giphy.com/media/AWNxDbtHGIJDW/giphy.gif');
                                                myFeedbackColor = Colors.amber;
                                                myFeedbackText = "NORMAL";
                                              }
                                              if (rating >= 3.1 && rating <= 4.0) {
                                                myFeedback = Image.network('http://gph.is/1pO6x18');
                                                myFeedbackColor = Colors.green;
                                                myFeedbackText = "GOOD";
                                              }
                                              if (rating >= 4.1 && rating <= 5.0) {
                                                myFeedback = Image.network('https://gph.is/g/ZWmnOj6');
                                                myFeedbackColor = Color(0xffff520d);
                                                myFeedbackText = "EXCELLENT";
                                              }
                                            });
                                          },
                                        ),),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(child: Text("Your Rating: $sliderValue",
                                        style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              sliderValue += rating;
                                              count++;
                                              rating = 1.0;
                                            });
                                          },
                                          child: Text('Next'),
                                        ),
                                      )
                                      ),
                                    )

                                  ]
                                  )
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                )

                )
              ]
          ),
        ):Container(
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultText,
                  style: TextStyle(
                    fontSize: 24,
                    color: color,
                  ),
                ),
                SizedBox(height: 20),

                IconButton(
                    onPressed: reset,
                    icon: Icon(
                      Icons.reset_tv_rounded,
                      color: Colors.blue,
                      size: 40.0,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
