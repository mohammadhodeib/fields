import 'package:flutter/material.dart';
import 'package:playfields2/Field.dart';
import 'nearbyfields.dart';
import 'Field.dart';
import 'Sporttypes.dart';
import 'dart:math';

class FieldBooker extends StatelessWidget {
  final String dropdownValue ;
  final String hint ;
   FieldBooker( this.dropdownValue, this.hint);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:Row(
        children: [
        ElevatedButton(
        onPressed: () {
      // Navigate to a new page (replace with your homepage route)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nearbyfields()),
      );
    },
    child: Icon(Icons.arrow_back),
    ),
    const SizedBox(width: 20,),
    Text(' book game '),
    ],
    ), ),
        body: BookField(Sportname:dropdownValue, Teamname:hint , )

    );
  }
}
class BookField extends StatefulWidget {

  final String Teamname ;
  final String Sportname ;
  const BookField({ required this.Sportname , required this.Teamname,Key? key}): super(key:key);
    get teamnname => Teamname ;

  @override
  State<BookField> createState() => _BookField();  }
class _BookField extends State<BookField> {
  String get Fieldname => widget.Teamname ;
  String get SportName => widget.Sportname ;

  int selectedValue = 1;

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


    List<DateTime> containerContent = [DateTime(2023, 1, 1, 10, 0), // January 1, 2023, 10:00 AM
      DateTime(2023, 1, 1, 14, 30), // January 1, 2023, 2:30 PM
      DateTime(2023, 1, 1, 18, 45), // January 1, 2023, 6:45 PM
    ];

    List<String> stringDateTimes = containerContent.map((dateTime) {
      // Format the DateTime as a String
      return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    }).toList();

    List<DateTime> generateRandomTimes(int count) {
      Random random = Random();
      List<DateTime> times = [];
      // Set a base time (e.g., current time) to start generating intervals
      DateTime baseTime = DateTime.now();
      for (int i = 0; i < count; i++) {
        // Generate a random number of 2-hour intervals (in seconds)
        int randomIntervals = random.nextInt(12); // 12 intervals of 2 hours each
        // Calculate the random time by adding the random intervals
        DateTime randomTime = baseTime.add(Duration(hours: 2 * randomIntervals));
        times.add(randomTime);
      }
      return times;
    }
    List<DateTime> mytime = generateRandomTimes(3);

    void showavailablegame (){
      setState(() {
        containerContent = generateRandomTimes(4);
      }); }

    Field FieldDetecter () {
      for(int i=0  ; i<fields.length; i++)
        if (fields[i].Name==Fieldname)
         return  fields[i];
       return fields[0];
        }

        String bookedgame = ' ' ;

    confirmgame(int i) {  if(i==1)
      setState(() {
      bookedgame = 'booked first game ';
    });
       if (i==2)  setState(() {
      bookedgame = 'booked second game ';
    });
     if (i==3)  setState(() {
      bookedgame = 'booked third game ';
    });
    }

      return Container(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.orangeAccent,
                alignment: Alignment.topCenter ,
               padding: EdgeInsets.all (30 ),
                margin: EdgeInsets.all(15),
                child: Text('welcome to  $Fieldname ', style:  TextStyle(
                            fontSize: 24.0,
                            color: Colors.blue, // You can set any color here
                            fontWeight: FontWeight.bold,
                             ),
                ),
              ),
              SizedBox(height: 18,),
              Image.network(FieldDetecter().photourl),
              Container(margin: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    showavailablegame();
                    print('heloooooooo');
                  },
                  child: Text('available $SportName games '),
                ),
              ),
              Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column (
                            children: [
                              for (String item in stringDateTimes)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item),
                                ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as int;
                                  });
                                },
                              ),
                              Radio(
                                value: 2,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as int;
                                  });
                                },
                              ),
                              Radio(
                                value: 3,
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as int;
                                  });
                                },
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height:15),
                              ElevatedButton(onPressed: confirmgame(selectedValue), child: Text('confirm'))

                            ],
                          )

                        ],
                      ),
                            Row(
                       children: [
                        SizedBox(width: 25,),
                          Text(bookedgame)
        ],
      ),
                    ],

                  ),

                ),


            ],
          ),

        ),
      );
    }
  }

