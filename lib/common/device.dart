import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class TDeviceInfo {
  final String name;
  final String version;
  final String id;

  TDeviceInfo({
    @required this.name,
    @required this.version,
    @required this.id,
  });

  Map<String, String> toJSON() {
    return {
      "name": name,
      "version": version,
      "id": id,
    };
  }

  @override
  String toString() {
    return json.encode(toJSON());
  }
}

final TDeviceInfo defaultDeviceInfo = TDeviceInfo(
  name: "unknown",
  version: "unknown",
  id: "unknown",
);

Future<TDeviceInfo> getDeviceInfo() async {
  String deviceName = "unknown";
  String deviceVersion = "unknown";
  String deviceId = "unknown";
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model;
      deviceVersion = build.version.release;
      deviceId = build.androidId; //UUID for Android
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceName = data.name;
      deviceVersion = data.systemVersion;
      deviceId = data.identifierForVendor; //UUID for iOS
    }
  } on PlatformException {
    print('Failed to get platform version');
  }

  //if (!mounted) return;
  return TDeviceInfo(
    name: deviceName,
    version: deviceVersion,
    id: deviceId,
  );
}
