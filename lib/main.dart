import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var wtControler = TextEditingController();
var ftControler = TextEditingController();
var inControler = TextEditingController();

var result = "";
var bgColor = Colors.indigo.shade200;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: Text(widget.title, style: TextStyle(color: Colors.lightGreen),)),
      ),

body: Container(
  color: bgColor,
  child: Center(
    child: Container(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BMI', style: TextStyle(fontSize: 33, fontWeight: FontWeight.w800,color: Colors.blue),),

          SizedBox(height: 20,),

        TextField(controller: wtControler,
          decoration: InputDecoration(
              label: Text('Enter your weight(in kgs)', style: TextStyle(fontSize: 25,),),
              prefixIcon: Icon(Icons.line_weight)
          ),
          keyboardType: TextInputType.number,
        ),

          SizedBox(height: 20,),

          TextField(controller: ftControler,
            decoration: InputDecoration(
                label: Text('Enter your height(in feet)', style: TextStyle(fontSize: 25, ),),
                prefixIcon: Icon(Icons.line_weight)
            ),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 20,),

          TextField(controller: inControler,
            decoration: InputDecoration(
                label: Text('Enter your weight(in inch)', style: TextStyle(fontSize: 25, ),),
                prefixIcon: Icon(Icons.line_weight)
            ),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 21,),

          ElevatedButton(onPressed: (){
            var wt = wtControler.text.toString();
            var ft = ftControler.text.toString();
            var Inch = inControler.text.toString();
            if(wt!="" && ft!="" && Inch!="") {
              // BMI CALCULATION.
              var iwt = int.parse(wt);
              var ift = int.parse(ft);
              var iInch = int.parse(Inch);

              var tInch = (ift*12) + iInch;

              var tcm = tInch*2.54;

              var tm = tcm/100;

             var bmi = iwt/(tm*tm);

             // color
              var msg ="";

              if(bmi>25){
                msg = 'you are overweighted';
                bgColor = Colors.orange.shade200;
              }else if(bmi<18){
                msg = 'you are underweighted';
                bgColor = Colors.red.shade200;
              }else{
                msg = 'you are healthy';
                bgColor = Colors.green.shade200;
              }

              setState(() {
                result = '$msg \n your BMI is: ${bmi.toStringAsFixed(2)}';
              });

            }else{
              setState(() {
                result = 'please fill all the required fields';
              });
            }

          }, child: Text('Calculate')),

          Text(result , style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
        ],
      ),
    ),
  ),
),
        
        
    );
  }
}
