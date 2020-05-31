import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videoguysrinath/models/call.dart';
import 'package:videoguysrinath/models/user.dart';
import 'package:videoguysrinath/resources/call_methods.dart';
import 'package:videoguysrinath/screens/call_screen.dart';

class CallUtils{

  static final CallMethods callMethods = CallMethods();

  static dial({
    User from ,
    User to,
    context
}) async{
    Call call  = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if(callMade){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=> CallScreen(call: call),
    ));
    }
  }

}