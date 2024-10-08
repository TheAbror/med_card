import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecordingPage extends StatefulWidget {
  const VoiceRecordingPage({super.key});

  @override
  State<VoiceRecordingPage> createState() => _VoiceRecordingPageState();
}

class _VoiceRecordingPageState extends State<VoiceRecordingPage> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone access not granted';
    }

    await recorder.openRecorder();

    isRecorderReady = true;

    recorder.setSubscriptionDuration(Duration(milliseconds: 500));
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print('Recorded audio: $audioFile');
    await recorder.stopRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue.shade900,
      body: SizedBox(),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       StreamBuilder<RecordingDisposition>(
      //         stream: recorder.onProgress,
      //         builder: (context, snapshot) {
      //           final duration = snapshot.hasData ? snapshot.data!.duration : Duration.zero;

      //           // String twoDigits(int n) => n.toString().padLeft(duration.inMinutes);

      //           return Text(
      //             '${duration.inSeconds} s',
      //             style: TextStyle(fontSize: 24, color: Colors.white),
      //           );
      //         },
      //       ),
      //       ElevatedButton(
      //         child: Icon(recorder.isRecording ? Icons.stop : Icons.mic),
      //         onPressed: () async {
      //           //
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

///
///
//Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     SizedBox(height: 50),
//     Image.asset('assets/icons/78_04_article.gif'),
//     SizedBox(height: 50),
//     Container(
//       height: 100.w,
//       width: 100.w,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(50.r),
//       ),
//       child: Center(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             height: 40.w,
//             width: 40.w,
//             decoration: BoxDecoration(
//               color: AppColors.background,
//               borderRadius: BorderRadius.circular(5.r),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

// class RecordingScreen extends StatefulWidget {
//   const RecordingScreen({super.key});

//   @override
//   _RecordingScreenState createState() => _RecordingScreenState();
// }

// class _RecordingScreenState extends State<RecordingScreen> {
//   late Record audioRecord;
//   final dsfdsaf = FlutterSoundRecorder();
//   late AudioPlayer audioPlayer;
//   bool isRecording = false;
//   String audioPath = "";

//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//     audioRecord = Record();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     audioRecord.dispose();
//     audioPlayer.dispose();
//   }

//   bool playing = false;
//   Future<void> startRecording() async {
//     try {
//       print("START RECODING+++++++++++++++++++++++++++++++++++++++++++++++++");
//       if (await audioRecord.hasPermission()) {
//         await audioRecord.start();
//         setState(() {
//           isRecording = true;
//         });
//       }
//     } catch (e, stackTrace) {
//       print("START RECODING+++++++++++++++++++++$e++++++++++$stackTrace+++++++++++++++++");
//     }
//   }

//   Future<void> stopRecording() async {
//     try {
//       print("STOP RECODING+++++++++++++++++++++++++++++++++++++++++++++++++");
//       String? path = await audioRecord.stop();
//       setState(() {
//         recoding_now = false;
//         isRecording = false;
//         audioPath = path;
//       });
//     } catch (e) {
//       print("STOP RECODING+++++++++++++++++++++$e+++++++++++++++++++++++++++");
//     }
//   }

//   Future<void> playRecording() async {
//     try {
//       playing = true;
//       setState(() {});

//       print("AUDIO PLAYING+++++++++++++++++++++++++++++++++++++++++++++++++");
//       Source urlSource = UrlSource(audioPath);
//       await audioPlayer.play(urlSource);
//       // Add an event listener to be notified when the audio playback completes
//       audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//         if (state == PlayerState.completed) {
//           playing = false;

//           print("AUDIO PLAYING ENDED+++++++++++++++++++++++++++++++++++++++++++++++++");
//           setState(() {});
//         }
//       });
//     } catch (e) {
//       print("AUDIO PLAYING++++++++++++++++++++++++$e+++++++++++++++++++++++++");
//     }
//   }

//   Future<void> pauseRecording() async {
//     try {
//       playing = false;

//       print("AUDIO PAUSED+++++++++++++++++++++++++++++++++++++++++++++++++");

//       await audioPlayer.pause();
//       setState(() {});
//       //print('Hive Playing Recording ${voiceRecordingsBox.values.cast<String>().toList().toString()}');
//     } catch (e) {
//       print("AUDIO PAUSED++++++++++++++++++++++++$e+++++++++++++++++++++++++");
//     }
//   }

//   Future<void> uploadAndDeleteRecording() async {
//     try {
//       final url = Uri.parse('YOUR_UPLOAD_URL'); // Replace with your server's upload URL

//       final file = File(audioPath);
//       if (!file.existsSync()) {
//         print("UPLOADING FILE NOT EXIST+++++++++++++++++++++++++++++++++++++++++++++++++");
//         return;
//       }
//       print("UPLOADING FILE ++++++++++++++++$audioPath+++++++++++++++++++++++++++++++++");
//       final request = http.MultipartRequest('POST', url)
//         ..files.add(
//           http.MultipartFile(
//             'audio',
//             file.readAsBytes().asStream(),
//             file.lengthSync(),
//             filename: 'audio.mp3', // You may need to adjust the file extension
//           ),
//         );

//       final response = await http.Response.fromStream(await request.send());

//       if (response.statusCode == 200) {
//         // Upload successful, you can delete the recording if needed
//         // Show a snackbar or any other UI feedback for a successful upload
//         const snackBar = SnackBar(
//           content: Text('Audio uploaded.'),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);

//         // Refresh the UI
//         setState(() {
//           audioPath = "";
//         });
//       } else {
//         // Handle the error or show an error message
//         print('Failed to upload audio. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error uploading audio: $e');
//     }
//   }

//   Future<void> deleteRecording() async {
//     if (audioPath.isNotEmpty) {
//       try {
//         recoding_now = true;
//         File file = File(audioPath);
//         if (file.existsSync()) {
//           file.deleteSync();

//           print("FILE DELETED+++++++++++++++++++++++++++++++++++++++++++++++++");
//         }
//       } catch (e) {
//         print("FILE NOT DELETED++++++++++++++++$e+++++++++++++++++++++++++++++++++");
//       }

//       setState(() {
//         audioPath = "";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Voice Recorder'),
//         ),
//         body: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             recoding_now
//                 ? IconButton(
//                     icon: !isRecording
//                         ? const Icon(
//                             Icons.mic_none,
//                             color: Colors.red,
//                             size: 50,
//                           )
//                         : const Icon(Icons.fiber_manual_record, color: Colors.red, size: 50),
//                     onPressed: isRecording ? stopRecording : startRecording,
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: !playing
//                             ? Icon(Icons.play_circle, color: Colors.green, size: 50)
//                             : Icon(Icons.pause_circle, color: Colors.green, size: 50),
//                         onPressed: !playing ? playRecording : pauseRecording,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red, size: 50),
//                         onPressed: deleteRecording,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.trending_up, color: Colors.green, size: 50),
//                         onPressed: uploadAndDeleteRecording,
//                       ),
//                     ],
//                   ),
//           ],
//         ));
//   }

//   bool recoding_now = true;
// }
