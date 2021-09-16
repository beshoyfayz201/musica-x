import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey({Color color, int soundNumber,double height,String melo}) {
    return SizedBox(
        width: height,
      height: 80,
      child: GestureDetector(
        onTap: () {
          playSound(soundNumber);
        },
        child: Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             Icon(Icons.trip_origin,color: Colors.white,),
              RotatedBox(
                quarterTurns: 3,
                  child: Text(melo,style: TextStyle(color: Colors.white),)),
              Icon(Icons.trip_origin,color: Colors.white,),
            ],
          ),
          decoration: BoxDecoration(
              color: color,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(50),left:
            Radius.circular(50))
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent,Colors.yellow,Colors.redAccent]
              )
            ),
            child: Column(

             // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Image.asset("assets/lol.png",fit: BoxFit.contain,
                        height: 80,),
                    ),
                    Text("EVE Xylophone",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      shadows: [Shadow(color: Colors.red[900],blurRadius: 10),]
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Image.asset("assets/lol.png",fit: BoxFit.contain,
                        height: 80,),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                buildKey(color: Colors.red, soundNumber: 1,height: 400,melo: "Do"),
                buildKey(color: Colors.orange, soundNumber: 2,height: 350,melo: "Re"),
                buildKey(color: Colors.yellow, soundNumber: 3,height: 300,melo: "Mi"),
                buildKey(color: Colors.green, soundNumber: 4,height: 250,melo: "Fa"),
                buildKey(color: Colors.teal, soundNumber: 5,height: 200,melo: "Sol"),
                buildKey(color: Colors.blue, soundNumber: 6,height: 150,melo: "La"),
                buildKey(color: Colors.purple, soundNumber: 7,height: 100,melo: "Si"
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
