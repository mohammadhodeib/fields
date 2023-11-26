import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'nearbyfields.dart';
import 'package:flutter/src/material/text_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playfields'),
        backgroundColor: Colors.yellow[200],

      ),
      body: Center(
      child: Stack(
      alignment: Alignment.center,
      children: [
      // Image widget to display the background image
      Image.network(
      'https://img.freepik.com/premium-vector/abstract-paint-with-brush-background-template_565745-198.jpg?w=900',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ),


Positioned(
top: 75, // Adjust the values to position the TextField as needed
left: 20,
right: 20,
child: Text(
'feeling bored?',
textAlign: TextAlign.center,
overflow: TextOverflow.ellipsis,
style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 32)
),
),
const SizedBox(height:40),
Positioned(
top: 150,
child:
ClipRRect(
borderRadius: BorderRadius.circular(5),
child: Stack(
children: <Widget>[
Positioned.fill(
child: Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
colors: <Color>[
Colors.pinkAccent,
Colors.lightBlueAccent,
Colors.greenAccent,
]
)
),
),
),
TextButton(
style: TextButton.styleFrom(
padding: const EdgeInsets.all(15),
primary: Colors.white,
textStyle: const TextStyle(fontSize:20),
),
onPressed: (){nextPage(context);},
child:  const Text('find your field',
style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 26)
),
),
],
),

),
),
Positioned(
top: 400, // Adjust the values to position the TextField as needed
left: 20,
right: 20,
child: Container(
padding: EdgeInsets.all(2),
decoration: BoxDecoration(
color: Colors.transparent,
borderRadius: BorderRadius.circular(10),
),
child: Column (
children: <Widget>[
 Text('newst news we picked',style: TextStyle(fontSize: 30),) ,
  SizedBox(height: 15,),
  MyClickableBox(),
const SizedBox(height:20),
MyClickableBox1(),]
)


),
),
],
),
),
);
}
}


class MyClickableBox extends StatelessWidget {
  final String linkText = 'leonel messi signed for barcelona .. ';
  final String url = 'https://accuweather.com';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
child: Container(
width: 500.0,
padding: EdgeInsets.all(18),
decoration: BoxDecoration(
gradient: LinearGradient(
colors: <Color>[
Color(0xFF0D47A1),
Color(0xFF1976D2),
Colors.redAccent,
]
),
border: Border.all(color: Colors.red),
borderRadius: BorderRadius.circular(8),


),
child: Text(
linkText,
style: TextStyle(
color: Colors.blue[50],
decoration: TextDecoration.none,
  fontSize: 18,
),
),
),
);
}

 //Function to launch a URL
 void _launchURL(String url) async {
 await launch(url);

}
}

class MyClickableBox1 extends StatelessWidget {
final String linkText = 'better chealsea with new trainer ..  ';
final String url = 'https://yahoo.com';

@override
Widget build(BuildContext context) {
return InkWell(
onTap: () {
_launchURL(url);
},
child: Container(
width: 500.0,
padding: EdgeInsets.all(18),
decoration: BoxDecoration(
gradient: LinearGradient(
colors: <Color>[
Color(0xFF0D47A1),
Color(0xFF1976D2),
Colors.amberAccent,
]
),
border: Border.all(color: Colors.red),
borderRadius: BorderRadius.circular(8),

),
child: Text(
linkText,
 style: TextStyle(
color: Colors.blue[50],
  decoration: TextDecoration.none,
  fontSize: 18,
),
),
),
);
}

//Function to launch a URL
 void _launchURL(String url) async {
await launch(url);
}
}

void nextPage(context){
Navigator.of(context).push(
MaterialPageRoute(builder: (context)=>const nearbyfields())
);}