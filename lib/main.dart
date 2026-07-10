import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MarimbaApp());

class MarimbaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
          
            children: [
              teclaMarimba(Color(0xFF009788), 1),
              teclaMarimba(Color(0xFF2296F3), 2),
              teclaMarimba(Color(0xFFFFEB3B), 3),
              teclaMarimba(Color(0xFFF34436), 4),
              teclaMarimba(Color(0xFF9E9E9E), 5),
              teclaMarimba(Color(0xFF9C27B0), 6),
              teclaMarimba(Color(0xFF795548), 7),
            ],
          ),
        ),
      ),
    );
  }
}

Widget teclaMarimba(Color corBotao, int numeroNota) {
  final player = AudioPlayer();

  player.setAudioContext(
    AudioContext(
      android: AudioContextAndroid(
        audioFocus:
            AndroidAudioFocus.none, // Diz ao Android para não disputar o foco
      ),
      iOS: AudioContextIOS(
        options: {
          AVAudioSessionOptions
              .mixWithOthers, // Garante que também funciona bem em iPhones
        },
      ),
    ),
  );

  return Expanded(
    child: GestureDetector(
      onTap: () async {
        
        await player.stop();
        await player.play(AssetSource('sounds/nota$numeroNota.wav'));
      },
      child: Container(color: corBotao),
    ),
  );
}
