import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatefulWidget {
  final String callId;
  const CallPage({
    Key? key,
    this.callId = 'blabla',
  }) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  var userId = Random().nextInt(1000).toString();

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 103088009,
        appSign:
            "74001977c999c7399777ce2967f1e18497642a026adc01c004fb40a40b001ff1",
        callID: widget.callId,
        userID: userId,
        userName: "user_$userId",
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall());
  }
}
