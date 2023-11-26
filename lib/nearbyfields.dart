// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:playfields2/FieldBooker.dart';
import 'package:playfields2/MyHomePage.dart';
import 'Field.dart';
import 'Sporttypes.dart';


class nearbyfields extends StatelessWidget {
  const nearbyfields({super.key});

  @override
  Widget build(BuildContext context) {
    double  screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to a new page (replace with your homepage route)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 20,),
              Text(' Nearby Fields '),
            ],
          ),
          backgroundColor: Colors.yellow[200],
        ),
        body: Showfields(width: screenWidth)
    );
  }
}

class Showfields extends StatefulWidget {
  const Showfields({required this.width,Key? key}): super(key:key);
  final double width;
@override
State<Showfields> createState() => _Showfields();  }
class _Showfields extends State<Showfields> {

  @override
  Widget build(BuildContext context){
    List<Field> fields = [
      Field ('sportling' , Sporttypes().filledsports([2,4]) , 'nabatiye', 2 , 8, true, 8 ,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxtwf7xNijzTZyW5LTtNeZiU1NqzCO3a0eXnN8CD3rqMJP54JCbj0mhgGL4S-dGA7xKtg&usqp=CAU', ) ,
      Field ('zamalek' , Sporttypes().filledsports([1,2]) , 'saida', 2 , 8, true, 8,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhLi6TTgvEefaxv8kqY58vsT6tGLffq2r0AEjYhCGaW3W34Hg0pOJr6MHnfPBkhPa201s&usqp=CAU',) ,
      Field ('homentmen' , Sporttypes().filledsports([2,3]) , 'baallbak', 2 , 8, false, 8,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSG3pGVS63x8Rhc_G0ms8Ug5BSrVKt_wTZAI3vFRObG9VD9KKOuD1PMk4xpu1D2563QEA&usqp=CAU',) ,
      Field ('riyadi' , Sporttypes().filledsports([3,4]) , 'zefta', 2 , 8, true, 8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbtRUi8HYigFJVIrl_DTc1FROMVsE7NuJrG_yIeXDhU6LFFp0x44pszbXeMXAc4ZdCZAs&usqp=CAU',) ,
      Field ('star' , Sporttypes().filledsports([2,3]) , 'zahrani', 2 , 8, true, 8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6padOb2xRbtPNAoednKScexvyT5MSZsz4AD_CYEU7Vgk1kOytr-qBETaGCHVILhtXcgw&usqp=CAU',) ,
      Field ('ansar' , Sporttypes().filledsports([1,4]) , 'zahrani', 2 , 8, true, 8,'https://img.freepik.com/premium-vector/table-tennis-badge-emblem-logo-sports-label-vector-illustration-ping-pong-club_630259-344.jpg',) ,
      Field ('soueid' , Sporttypes().filledsports([2,4]) , 'jbeil', 2 , 8, true, 8,'https://www.shutterstock.com/shutterstock/photos/2132185705/display_1500/stock-vector-table-tennis-badge-emblem-logo-sports-label-vector-illustration-for-a-ping-pong-club-2132185705.jpg',) ,
      Field ('nasr' , Sporttypes().filledsports([1,4,5]) , 'nabatiye', 2 , 8, true, 8, 'https://media.istockphoto.com/id/1223450497/photo/couple-doing-yoga-in-warrior-pose-at-home.jpg?s=612x612&w=0&k=20&c=gddvQookHuZt6BZ0Dr7e4BCncvZSiYFcGAx-Y2A-BTU=',) ,
      Field ('lalaland' , Sporttypes().filledsports([1,2,4]) , 'beirut', 2 , 8, true, 8,'https://media.istockphoto.com/id/1154867488/photo/medieval-knight-character-ready-for-rings-competition-during-the-medieval-festival.jpg?s=612x612&w=0&k=20&c=xKxfYK2El0QKc7mLEwdJEOA28VfcSziQUlvmmHtvvVw=',) ,
    ];
    String resultWithoutBrackets (int index) {
      return fields[index].sportforeach().toString().substring(
          1, fields[index].sportforeach().toString().length - 1);
    }
    String dropdownValue= 'games';




    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: fields.length,
      itemBuilder: (context, index) {
      var children;
      var screenWidth = MediaQuery.of(context).size.width;

      // Create a list of DropdownMenuItem
      List<DropdownMenuItem<String>> dropdownItems =  fields[index].sportforeach().map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList();

      // Create a default item
      DropdownMenuItem<String> defaultItem = DropdownMenuItem<String>(
        value: 'games',
        child: Text('games'),
      );

      List<DropdownMenuItem<String>> itemsWithDefault = [defaultItem, ...dropdownItems];

      final GlobalKey _containerKey = GlobalKey();
      String useKey(GlobalKey key , int index) {
        String mykey ;
        return mykey = fields[index].Name;
      }

      return Column(children: [
        const SizedBox(height:10) ,
        Row(children: [

          Container(
              width: screenWidth = screenWidth*0.40,

              alignment: Alignment.topCenter ,
              //padding: EdgeInsets.all (30 ),
              margin: EdgeInsets.all(15),
              child: Image.network(fields[index].photourl)),
          Container(
            width: screenWidth = screenWidth*0.95,
            alignment: Alignment.topCenter ,
            //padding: EdgeInsets.all (30 ),
            margin: EdgeInsets.fromLTRB(15, 0, 10, 15),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.yellow,
            child: Column(children:<Widget>[
                FittedBox(
                  fit: BoxFit.scaleDown, // You can use different BoxFit options
                  alignment: Alignment.center,
                  child: Text(
                    fields[index].Name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ),

              Column(children:[
                FittedBox(
                  fit: BoxFit.scaleDown, // You can use different BoxFit options
                  alignment: Alignment.center,

                  child:
                    Text(resultWithoutBrackets(index) ,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                  
                ),
                Text('book your game',style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 18,
                  color: Colors.green,) ),

                Center(
                  child:   Container(
                    key: _containerKey,


                    child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color:Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.red,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FieldBooker(dropdownValue,useKey(_containerKey,index) ),
                            ));
                          });
                        } ,
                        // items: fields[index].sportforeach().map((e) =>
                        //   DropdownMenuItem<String>(child: Text(e),value:e,)).toList()
                        items : itemsWithDefault
                        ),
                  ),
                )


                ]
              ),

            ],),

          )
        ],),        
       
        const SizedBox(height: 10,)
      ]);
      }
    );


    }


    }




