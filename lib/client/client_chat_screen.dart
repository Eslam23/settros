import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:hive/hive.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:service_system/client/permission_handler.dart';
import 'package:service_system/custom_dialog_box.dart';
import 'package:service_system/group.dart';
import 'package:service_system/info.dart';
import 'package:service_system/shared_widgets/action_btn.dart';
import 'package:service_system/shared_widgets/chat_message.dart';
import 'package:service_system/shared_widgets/message_input_box.dart';
import 'package:service_system/shared_widgets/page_header.dart';
import 'package:service_system/shared_widgets/page_wrapper.dart';
import 'package:service_system/shared_widgets/pdf_preview.dart';
import './client_list.dart';
import '../full_view.dart';
import '../message_video.dart';
import '../online_image.dart';

//import '../../main.dart';

class ClientChatScreen extends StatefulWidget {
  static final String id = "ClientChatScreen";
  static List<Widget> chatMessages;
  @override
  _ClientChatScreenState createState() => _ClientChatScreenState();
}

class _ClientChatScreenState extends State<ClientChatScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  TextEditingController _textEditingController = TextEditingController();
  PickedFile _image;
  RecordingStatus recordStatus = RecordingStatus.Unset;
  double _Size = 50;
  FlutterAudioRecorder _recorder;

  /// List of recording
  List<Recordings> savedRecordings = <Recordings>[];
  AudioPlayer audioPlayer;
  Box _getBox() => Hive.box<dynamic>('hosting_app');
  void onInit() async {
    _getListOfRecordings();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerCompletion.listen((event) {
      _pauseAllRecordings();
    });
  }

  /// Pause all the recordings
  void _pauseAllRecordings() async {
    await audioPlayer.stop();
    for (var recording in savedRecordings) {
      if (recording.isPlaying) {
        recording.isPlaying = false;
      }
    }
  }

  @override
  List<dynamic> getListValue(String key) {
    var box = _getBox();
    var value = box.get(key) as List<dynamic>;
    value ??= <Map<String, String>>[];
    return value;
  }

  /// Get the list of recordings
  void _getListOfRecordings() {
    var recordings = getListValue('savedRecording');

    savedRecordings.clear();

    for (var recording in recordings) {
      if (recording is Map) {
        var path = recording.keys.first as String;
        var duration = recording.values.first as String;

        savedRecordings.add(
          Recordings(
            recordingPath: path,
            recordingDuration: duration,
            isPlaying: false,
          ),
        );
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    ClientChatScreen.chatMessages = chatList.messages
        .map((item) => ChatMessage(
              message: item.message.data['body'],
              time: item.message.sentTime.toString(),
              sender: item.message.data['sender_name'],
              messageType: item.messageType,
            ))
        .toList();

    /*FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        chatList.messages = [...chatList.messages, chatModel(message,MessageType.received)];
      });
    });*/

    onInit();
  }

  @override
  Widget build(BuildContext context) {
    _imgFromCamera() async {
      PickedFile image = await ImagePicker.platform
          .pickImage(source: ImageSource.camera, imageQuality: 50);

      setState(() {
        _image = image;
        ClientChatScreen.chatMessages = [
          ...ClientChatScreen.chatMessages,
          ChatMessage(
            message: imgMsg(FileImage(File(_image.path)), context),
            messageType: MessageType.sent,
            time: "2:00",
            sender: "user1",
          )
        ];
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Test(mediaMsg(Image.file(File(image.path))))));
*/
    }

    _imgFromGallery() async {
      PickedFile image = await ImagePicker.platform
          .pickImage(source: ImageSource.gallery, imageQuality: 50);

      setState(() {
        _image = image;
        ClientChatScreen.chatMessages = [
          ...ClientChatScreen.chatMessages,
          ChatMessage(
            message: imgMsg(FileImage(File(_image.path)), context),
            messageType: MessageType.sent,
            time: "2:00",
            sender: "user1",
          )
        ];
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Test(mediaMsg(Image.file(File(image.path))))));
*/
    }

    _videoFromGallery() async {
      PickedFile image = await ImagePicker.platform.pickVideo(
        source: ImageSource.gallery,
      );

      setState(() {
        _image = image;
        ClientChatScreen.chatMessages = [
          ...ClientChatScreen.chatMessages,
          ChatMessage(
            message: videoMsg(File(_image.path)),
            messageType: MessageType.sent,
            time: "2:00",
            sender: "user1",
          )
        ];
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Test(mediaMsg(Image.file(File(image.path))))));
*/
    }

    _recordVideo() async {
      PickedFile image = await ImagePicker.platform.pickVideo(
        source: ImageSource.camera,
      );

      setState(() {
        _image = image;
        ClientChatScreen.chatMessages = [
          ...ClientChatScreen.chatMessages,
          ChatMessage(
            message: videoMsg(File(_image.path)),
            messageType: MessageType.sent,
            time: "2:00",
            sender: "user1",
          )
        ];
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Test(mediaMsg(Image.file(File(image.path))))));
*/
    }

    _atatchfile() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: ['txt', 'pdf', 'doc', 'rar', 'zip']);

      setState(() {
        ClientChatScreen.chatMessages = [
          ...ClientChatScreen.chatMessages,
          ChatMessage(
            message: fileMsg(result.files.first, context),
            messageType: MessageType.sent,
            time: "2:00",
            sender: "user1",
          )
        ];
      });
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Test(mediaMsg(Image.file(File(image.path))))));
*/
    }

    /*void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: new Icon(Icons.video_collection),
                      title: new Text('Video Gallery'),
                      onTap: () {
                        _videoFromGallery();
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: new Icon(Icons.video_call),
                      title: new Text('Record Video'),
                      onTap: () {
                        _recordVideo();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }
*/
    void showRevealImageDialog(BuildContext context) {
      double _width = MediaQuery.of(context).size.width;
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Label",
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*  Image.asset('assets/images/Document.png',width: _width/7,),
                     Image.asset('assets/images/Camera.png',width: _width/7,),
                     Image.asset('assets/images/Gallery.png',width: _width/7,),*/
                      item("Document.png", "Document", _atatchfile),
                      item("Camera.png", "Camera", _imgFromCamera),
                      item("Gallery.png", "Gallery", _imgFromGallery),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*   Image.asset('assets/images/Location.png',width: _width/7,),
                     Image.asset('assets/images/Audio.png',width: _width/7,),
                     Image.asset('assets/images/Contacts.png',width: _width/7,),*/

                      item("Location.png", "Location", _recordVideo),
                      item("Audio.png", "Audio", _videoFromGallery),
                      item("Contacts.png", "Contacts", _imgFromGallery),
                    ],
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              margin: EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 40),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return CircularRevealAnimation(
            child: child,
            animation: anim1,
            centerAlignment: Alignment.bottomCenter,
          );
        },
      );
    }

    /// Initializing the recorder if not initialzed
    Future<void> _initializedRecorder() async {
      var recordingPath = '/record_';
      Directory appDocDirectory;
      if (GetPlatform.isIOS) {
        appDocDirectory = await getApplicationDocumentsDirectory();
      } else {
        appDocDirectory = await getExternalStorageDirectory();
      }
      recordingPath = appDocDirectory.path +
          recordingPath +
          DateTime.now().millisecondsSinceEpoch.toString();
      _recorder = FlutterAudioRecorder(
        recordingPath,
        audioFormat: AudioFormat.WAV,
      );
      await _recorder.initialized;
    }

    /// Update the recording status with [currentStatus]
    void updateRecordingStatus(RecordingStatus currentStatus) {
      recordStatus = currentStatus;
      setState(() {});
    }

    /// Start the recorder
    void startRecorder() async {
      if (await PermissionHandler.isAllowedToRecord()) {
        if (await FlutterAudioRecorder.hasPermissions) {
          await _initializedRecorder();
          _pauseAllRecordings();
          await _recorder.start();
          updateRecordingStatus(RecordingStatus.Recording);
        }
      }
    }

    /// Check for permission
    void checkForPermission() async =>
        await FlutterAudioRecorder.hasPermissions;
    String _isAnyAudioPlaying() {
      for (var i = 0; i < savedRecordings.length; i++) {
        if (savedRecordings[i].isPlaying) {
          return savedRecordings[i].recordingPath;
        }
      }
      return "";
    }

    /// Start playing
    void _startPlaying(String path) async {
      // var recording = savedRecordings[position];
      if (path != null) {
        await audioPlayer.play(
          path,
          isLocal: true,
        );
        //savedRecordings[position].isPlaying = true;
      }
    }

    /// Play audio for the positioned recording
    void playAudio(String path) async {
      if (_isAnyAudioPlaying() == path) {
        _pauseAllRecordings();
      } else if (_isAnyAudioPlaying() != "") {
        _pauseAllRecordings();
        _startPlaying(path);
      } else {
        _startPlaying(path);
      }
    }

    Widget audioMsg(String path
        /*,MessageType messageType*/) {
      return Container(
        child: Row(
          children: [
            ActionButton(
              onPressed: () {
                playAudio(path);
                /*_startPlaying(path);*/
              },
              icon: Icon(Icons.play_arrow_outlined),
            )
          ],
        ),
      );
    }

    /// End the current recording. And if there is any recording then save it
    void endRecorder(DraggableDetails details) async {
      if (recordStatus == RecordingStatus.Recording) {
        var result = await _recorder.stop();
        var recordings = <dynamic>[];
        var saveRecordings = getListValue('savedRecording') ?? recordings;
        recordings.addAll(saveRecordings);
        if (recordings != null) {
          recordings.add(
            <String, String>{
              result.path: result.duration.inSeconds.toString(),
            },
          );
          //_getBox().put('savedRecording', _recorder);
          _getBox().put('savedRecording', recordings);
        }
        setState(() {
          ClientChatScreen.chatMessages = [
            ...ClientChatScreen.chatMessages,
            ChatMessage(
              message: audioMsg(result.path),
              messageType: MessageType.sent,
              time: "2:00",
              sender: "user1",
            )
          ];
        });
        updateRecordingStatus(RecordingStatus.Stopped);
        _getListOfRecordings();
      }
    }

    /// Checks if any audio is playing

    void cancelRecording(PointerMoveEvent event) async {
      if (event != null) {
        if (event.position.dx < (MediaQuery.of(context).size.width / 1.5)) {
          if (_recorder != null) {
            await _recorder.stop();
          }
          updateRecordingStatus(RecordingStatus.Stopped);
        }
      }
    }

    return Scaffold(
      body: PageWrapper(
          scrollType: ScrollType.floatingHeader,
          header: headerchat(context),
          /*
          PageHeader(
            prefixWidget: ActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            textSize: 20,
            title: "Mohamed Khaled",
            suffixWidget: ProfileImage(
              size: 35.0,
              onlineIndicator: true,
              imageUrl:
                  'https://images.pexels.com/photos/3866555/pexels-photo-3866555.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              onPressed: () {
                print("Clicked Profile Image");
              },
            ),
          ),
          */
          children: ClientChatScreen.chatMessages,
          footer: MessageInputBox(
              prefix: ActionButton(
                onPressed: () {
                  showRevealImageDialog(context);
                },
                iconData: Icons.add,
                iconSize: 24.0,
              ),
              suffix: Listener(
                onPointerMove: cancelRecording,
                child: LongPressDraggable(
                  axis: Axis.horizontal,
                  feedback: FloatingActionButton(
                    onPressed: () {
                      /* setState(() {
                        chatMessages = [
                          ...chatMessages,
                          ChatMessage(
                            message: audioMsg(),
                            messageType: MessageType.sent,
                            time: "2:00",
                            sender: "$USER1",
                          )
                        ];
                      });*/
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.keyboard_voice_outlined,
                      color: Colors.white,
                    ),
                  ),
                  childWhenDragging: SizedBox(),
                  onDragStarted: startRecorder,
                  onDragEnd: endRecorder,
                  child: IconButton(
                    onPressed: checkForPermission,
                    icon: Icon(
                      Icons.keyboard_voice_outlined,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ))),
    );
  }

  Widget headerchat(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool selected = true;
    //BuildContext context = context;
    return ClipRRect(
      //borderRadius: BorderRadius.only(
      //  bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Container(
          height: 150,
          width: width,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 30,
                  right: -100,
                  child: _circularContainer(300, Colors.blue[300])),
              Positioned(
                  top: -100,
                  left: -45,
                  child: _circularContainer(width * .5, Colors.blue[300])),
              Positioned(
                  top: -180,
                  right: -30,
                  child: _circularContainer(width * .7, Colors.transparent,
                      borderColor: Colors.white38)),
              Positioned(
                top: MediaQuery.of(context).padding.top - 10,
                left: 0,
                child: Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisSize: MainAxisSize.min,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ProfileImage(
                                  onPressed: () {},
                                  outlineIndicator: false,
                                  onlineIndicator: false,
                                  onlineColor: Colors.green,
                                  imageUrl:
                                      "https://img.freepik.com/free-vector/illustration-of-egypt-flag_53876-27140.jpg?size=338&ext=jpg",
                                  size: 48,
                                  backgroundColor: Colors.white),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Eslam',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Cairo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Egypt',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              showMenu<String>(
                                context: context,
                                position: RelativeRect.fromLTRB(0.0, 95.0, -5.0,
                                    0.0), //position where you want to show the menu on screen
                                items: [
                                  PopupMenuItem<String>(
                                      child: const Text('Redirect to Group'),
                                      value: '1'),
                                  PopupMenuItem<String>(
                                      child: const Text('Block this ip'),
                                      value: '2'),
                                  PopupMenuItem<String>(
                                      child: const Text('Select As Favourite'),
                                      value: '3'),
                                ],
                                elevation: 8.0,
                              ).then<void>((String itemSelected) {
                                if (itemSelected == null) return;

                                if (itemSelected == "1") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InformationScreen()));

                                  //code here
                                } else if (itemSelected == "2") {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomDialogBox(
                                          title: 'Blocking',
                                          descriptions:
                                              'Are you sure you want to block this ip ',
                                          positiveText: 'ok',
                                          negativeText: 'cancle',
                                        );
                                      });

                                  //code here
                                } else {
                                  //code here
                                }
                              });
                            },
                            //},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image(
                                width: 20,
                                height: 20,
                                //image: AssetImage("assets/images/egypt.jpg"),
                                image: AssetImage("assets/images/more.png"),
                              ),
                            ),
                          ),
                          /*
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              size: 30,
                              color: Colors.white,
                            ),
                            //tooltip: 'Increase volume by 10',,
                            onPressed: () {},
                          ),
                          */

                          //},

                          //("https://image.flaticon.com/icons/png/512/864/864938.png");
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (selected == true) {
                                      selected = false;
                                    } else {
                                      selected = true;
                                    }
                                    // selected = !selected;
                                  });
                                },

                                child: selected == false
                                    ? Icon(
                                        Icons.volume_up,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.volume_off,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                //iconIcons.volume_up,
                              ),
                              /*
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = !selected;
                                  });
                                },
                                child: ClipRRect(
                                  //borderRadius: BorderRadius.circular(5.0),
                                  child: Image(
                                    width: 30,
                                    height: 30,

                                    //image: AssetImage("assets/images/egypt.jpg"),
                                    image: selected == true
                                        ? AssetImage(
                                            "assets/images/no_sound.png")
                                        : AssetImage("assets/images/sound.png"),
                                  ),
                                ),
                              ),
                              */
                              Text(
                                'Mute Sound',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              ),
                            ],
                          ),
                          */
                          /*
                          SizedBox(
                            width: 100,
                          ),
                          */

                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                ClipRRect(
                                  //borderRadius: BorderRadius.circular(5.0),
                                  child: Image(
                                    width: 30,
                                    height: 30,
                                    //image: AssetImage("assets/images/egypt.jpg"),
                                    image: AssetImage("assets/images/stop.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  ' 04:50',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 175,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Row(
                              children: [
                                Text(
                                  'Mute Sound',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                ClipRRect(
                                  //borderRadius: BorderRadius.circular(5.0),
                                  child: Image(
                                    width: 30,
                                    height: 30,

                                    //image: AssetImage("assets/images/egypt.jpg"),
                                    image: selected == false
                                        ? AssetImage(
                                            "assets/images/no_sound.png")
                                        : AssetImage("assets/images/sound.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last Visit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    '10 Aug, 01:33:40',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 162,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'visited',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    ' 30',
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget item(String imageName, String label, Future<Null> fun()) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        fun();
      },
      child: Column(
        children: [
          Image.asset('assets/images/$imageName', width: 50),
          SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }

  Widget imgMsg(
    ImageProvider media,
    BuildContext context,
    /*,MessageType messageType*/
  ) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: media),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FullView(Container(
                        decoration:
                            BoxDecoration(image: DecorationImage(image: media)),
                      ))));
        },
      ),
    );
  }

  Widget videoMsg(File media
      /*,MessageType messageType*/) {
    return Container(
      height: 250.0,
      child: MessageVideo(media),
    );
  }

  Widget fileMsg(PlatformFile file, BuildContext context

      /*,MessageType messageType*/) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image.asset(
                "assets/icons/doc.png",
                width: 40,
                height: 40,
              )),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: _width * 0.5,
                child: Text(
                  file.name,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.clip,
                ),
              ),
              /*Text(file.extension),*/
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: _width * 0.5,
                child: Text("${(file.size / 1000)}/kB",
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.clip),
              ),
              file.extension == 'pdf'
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyPdfPreview(path: file.path)));
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            'view',
                            //getTranslated(context, 'view'),
                            style: TextStyle(color: Colors.blue),
                          )))
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}

class Recordings {
  Recordings({
    this.recordingPath = '',
    this.recordingDuration = '0',
    this.isPlaying = false,
  });

  String recordingPath;
  String recordingDuration;
  bool isPlaying;
}
/*ChatMessage(
            message: "Final Message in the list.",
            showTime: true,
            messageType: MessageType.sent,
            time: "2 mins ago",
            sender: "Ali Mohamed",
          ),
          ChatMessage(
            message: "Test Chat app Messaging system",
            showTime: true,
            messageType: MessageType.sent,
            time: "2 mins ago",
            sender: "Ali Mohamed",
          ),
          ChatMessage(
            message: "Message Length Small.",
            showTime: true,
            time: "2 mins ago",
          ),
          ChatMessage(
            message: "Message Length Large. This message has more text to configure the size of the message box.",
            showTime: true,
            time: "2 mins ago",
          ),
          ChatMessage(
            message: "Meet me tomorrow at the coffee shop.",
            showTime: true,
            time: "2 mins ago",
          ),
          ChatMessage(
            message: "Around 11 o'clock.",
            showTime: true,
            time: "2 mins ago",
          ),
          ChatMessage(
            message: "Typing another message from the input box.",
            messageType: MessageType.sent,
            showTime: true,
            time: "2 mins ago",
            sender: "Ali Mohamed",
          ),
          ChatMessage(
            message: "Hello World!, This is the first message.",
            messageType: MessageType.sent,
            showTime: true,
            time: "2 mins ago",
            sender: "Ali Mohamed",
          ),*/

/*Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 20,
                blurRadius: 20,
                offset: Offset(0, -5), // changes position of shadow
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ActionButton(
                onPressed: (){
          showRevealImageDialog(context);
          },
            iconData: Icons.add,
            iconSize: 24.0,
          ),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter Message...",
                      hintStyle: TextStyle(
                        color: Theme.of(context).primaryColorDark.withOpacity(0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0,),
                    ),
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark
                    ),
                  ),
                ),
            ActionButton(
              iconData: Icons.image,
              iconSize: 24.0,
            ),
                ActionButton(
                  onPressed: (){
                    chatList.messages.add(chatModel(RemoteMessage(data:{'body':_textEditingController.value.text,'sender_name':"Ezz"}), MessageType.sent));
                    sendPushMessage(_textEditingController.value.text);
                    _textEditingController.clear();
                    setState(() {
                    });
                  },
                  icon: Icon(
                    Icons.send,
                    size: 24.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
          ),
        )*/
