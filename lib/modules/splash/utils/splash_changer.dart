import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SplashChanger {
  static SplashChanger? _instance;

  factory SplashChanger() {
    return _instance ??= SplashChanger._();
  }

  SplashChanger._();

  UrlType type = UrlType.unknown;
  String splashUrl = '';
  bool isSplashDownloaded = false;
  File? splashFile;

  // SplashChanger() {
  //   initialize();
  // }

  Future<void> initialize() async {
    // splashUrl =
    //     'https://raw.githubusercontent.com/preet-singh-30074644/splash_assets/main/Pexels%20Videos%202541977.mp4';
    splashUrl = AppConstantRemote().appConstantRemoteModel?.splashUrl ?? '';
    type = UrlTypeHelper.getType(splashUrl);
    isSplashDownloaded = await checkSplashExist();
    if (splashUrl.isEmpty) {
      unawaited(clearSplashDirectory());
    }
    if (splashUrl.isNotEmpty && !isSplashDownloaded) {
      unawaited(downloadSplash());
    }
  }

  Future<bool> checkSplashExist() async {
    final _path = await getFilePath();
    splashFile = File(_path);
    adLog('file path ${splashFile?.path}');
    return File(_path).existsSync();
  }

  Future<void> downloadSplash() async {
    try {
      await clearSplashDirectory();
      final Dio dio = Dio();
      final String savePath = await getFilePath();
      final response = await dio.download(
        splashUrl,
        savePath,
        onReceiveProgress: (rec, total) {
          adLog('Rec: $rec , Total: $total');
        },
      );
      adLog('splashDownloadResponse: ${response.statusMessage}');
      splashFile = File(savePath);
      isSplashDownloaded = await checkSplashExist();
    } catch (e) {
      adLog('splash exception $e');
    }
  }

  Future<String> getFilePath() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/splash/${AppConstantRemote().appConstantRemoteModel?.splashVersion ?? ''}${UrlTypeHelper.getFileName(splashUrl)}';
  }

  Future<void> clearSplashDirectory() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final Directory splashDir = Directory('${appDir.path}/splash');
    if (splashDir.existsSync()) {
      splashDir.deleteSync(recursive: true);
    }
  }
}

enum UrlType { image, video, json, unknown }

class UrlTypeHelper {
  UrlTypeHelper._();

  static final Set<String> _imageTypes = {
    'jpg',
    'jpeg',
    'jfif',
    'pjpeg',
    'pjp',
    'png',
    'svg',
    'gif',
    'apng',
    'webp',
    'avif',
  };

  static final Set<String> _videoTypes = {
    '3g2',
    '3gp',
    'aaf',
    'asf',
    'avchd',
    'avi',
    'drc',
    'flv',
    'm2v',
    'm3u8',
    'm4p',
    'm4v',
    'mkv',
    'mng',
    'mov',
    'mp2',
    'mp4',
    'mpe',
    'mpeg',
    'mpg',
    'mpv',
    'mxf',
    'nsv',
    'ogg',
    'ogv',
    'qt',
    'rm',
    'rmvb',
    'roq',
    'svi',
    'vob',
    'webm',
    'wmv',
    'yuv',
  };

  static UrlType getType(String url) {
    try {
      final extension = url.split('.').lastOrNull;
      if (_imageTypes.contains(extension)) {
        return UrlType.image;
      } else if (_videoTypes.contains(extension)) {
        return UrlType.video;
      } else if (extension == 'json') {
        return UrlType.json;
      }
    } catch (e) {
      return UrlType.unknown;
    }
    return UrlType.unknown;
  }

  static String getFileName(String url) {
    final File file = File(url);
    return basename(file.path);
  }
}
