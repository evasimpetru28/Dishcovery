import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dishcovery/utils/service_locator.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/local_storage/storage_service.dart';
import '../data/models/log_models.dart';

class DeviceUtils {
  static late DeviceInfoModel deviceInfoModel = new DeviceInfoModel("uuid", "model", "os", "1");
  static String appVersion = '';

  static void initDeviceInfo() async {
    final LocalPreferences _localStorage = serviceLocator();
    // String username = await _localStorage.getUsername();
    // deviceInfoModel = await getPlatformInfo(username);
  }

  static Future<DeviceInfoModel> getPlatformInfo(String uuid) async {
    var deviceData = <String, dynamic>{};
    PackageInfo packageVersion = await PackageInfo.fromPlatform();
    appVersion = packageVersion.version;

    if (Platform.isAndroid) {
      deviceData = _readAndroidBuildData(await DeviceInfoPlugin().androidInfo);

      return DeviceInfoModel(
          uuid,
          deviceData["manufacturer"] + " " + deviceData["model"],
          "Android " + deviceData["version.release"],
          appVersion);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await DeviceInfoPlugin().iosInfo);

      return DeviceInfoModel(
          uuid,
          deviceData["name"],
          deviceData["systemName"] + " " + deviceData["systemVersion"],
          appVersion);
    }
    log(deviceData.toString());

    return DeviceInfoModel(
        uuid, "unknown", Platform.isAndroid ? "Android" : "iOS", appVersion);
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.release': build.version.release,
      'manufacturer': build.manufacturer,
      'model': build.model,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
    };
  }
}
