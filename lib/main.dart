import 'dart:io';

import 'package:flutter/material.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Hive.initFlutter();

//   Hive.registerAdapter(UserDataAdapter());

//   userDataBox = await Hive.openBox<UserData>(ProjectKeys.userData);

//   ApiProvider.create();

//   /// For logging
//   setUpLogging();

//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
//     (_) {
//       runApp(
//         MultiBlocProvider(
//           providers: [
//             BlocProvider(create: (context) => RootBloc()),
//             BlocProvider(create: (context) => SplashBloc()),
//             BlocProvider(create: (context) => DoctorBloc()),
//             BlocProvider(create: (_) => LocalizationBloc()..initLocalization()),
//           ],
//           child: const MyApp(),
//         ),
//       );
//     },
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 800),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           theme: lightTheme(),
//           builder: BotToastInit(),
//           navigatorObservers: [BotToastNavigatorObserver()],
//           themeMode: ThemeMode.system,
//           debugShowCheckedModeBanner: false,
//           onGenerateRoute: MainRouteGenerator().generateRoute,
//         );
//       },
//     );
//   }
// }

import 'package:flutter_sound/flutter_sound.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio Recorder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AudioRecorderScreen(),
    );
  }
}

class AudioRecorderScreen extends StatefulWidget {
  const AudioRecorderScreen({super.key});

  @override
  _AudioRecorderScreenState createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool _isRecording = false;
  String? _audioPath;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
    _initializePlayer();
  }

  Future<void> _initializeRecorder() async {
    await requestPermissions(); // Request microphone permissions

    _recorder = FlutterSoundRecorder(); // Create a new instance of the recorder
    await _recorder?.openRecorder(); // Open the audio session
  }

  Future<void> _initializePlayer() async {
    _player = FlutterSoundPlayer(); // Create a new instance of the player
    await _player?.openPlayer(); // Open the audio session for the player
  }

  @override
  void dispose() {
    _recorder?.closeRecorder(); // Close the recorder session when done
    _recorder = null;

    _player?.closePlayer(); // Close the player session when done
    _player = null;

    super.dispose();
  }

  Future<void> _startRecording() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      _audioPath = '${tempDir.path}/audio_example.aac';
      await _recorder?.startRecorder(toFile: _audioPath);
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Failed to start recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder?.stopRecorder();
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print('Failed to stop recording: $e');
    }
  }

  Future<void> _playRecording() async {
    if (_audioPath != null && _player != null) {
      try {
        await _player?.startPlayer(
          fromURI: _audioPath,
          codec: Codec.aacADTS,
          whenFinished: () {
            setState(() {});
          },
        );
      } catch (e) {
        print('Failed to play recording: $e');
      }
    }
  }

  Future<void> _uploadRecording() async {
    if (_audioPath != null) {
      try {
        var request = MultipartRequest(
          'POST',
          Uri.parse('https://your-backend-url.com/upload'),
        );

        request.files.add(await MultipartFile.fromPath(
          'audio',
          _audioPath!,
        ));

        var response = await request.send();

        if (response.statusCode == 200) {
          print('File uploaded successfully!');
        } else {
          print('Failed to upload file: ${response.statusCode}');
        }
      } catch (e) {
        print('Failed to upload recording: $e');
      }
    } else {
      print('No recording to upload.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRecording ? null : _startRecording,
              child: Text('Start Recording'),
            ),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : null,
              child: Text('Stop Recording'),
            ),
            ElevatedButton(
              onPressed: _audioPath != null ? _playRecording : null,
              child: Text('Play Recording'),
            ),
            ElevatedButton(
              onPressed: _audioPath != null ? _uploadRecording : null,
              child: Text('Upload Recording'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> requestPermissions() async {
  await Permission.microphone.request();
}
