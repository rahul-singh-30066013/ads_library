import 'dart:io';
import 'dart:typed_data';

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';

class MyProfileUtils {
  static const maxSizeAllowedToUploadInKb = 500;
  static const avatarNameCount = 3;

  static List<BottomSheetRowModel> maritalStatusList = MaritalStatus.values
      .map(
        (maritalStatus) => BottomSheetRowModel(text: maritalStatus.maritalAbbr),
      )
      .toList();

  ///this converts the string back to marital status
  static MaritalStatus? convertToMaritalStatus(String maritalStatus) {
    switch (maritalStatus.toLowerCase()) {
      case 'single':
        return MaritalStatus.single;
      case 'married':
        return MaritalStatus.married;
      case 'divorced':
        return MaritalStatus.divorced;
      case 'widow':
        return MaritalStatus.widow;
      default:
        return null;
    }
  }

  ///this converts the string back to title salutation
  static TitleSalutation? convertToTitleSalutation(String titleSalutation) {
    switch (titleSalutation) {
      case 'Mr.':
        return TitleSalutation.mister;
      case 'Mrs.':
        return TitleSalutation.missus;
      case 'Ms.':
        return TitleSalutation.miss;
      case 'Mstr.':
        return TitleSalutation.mstrChild;
      case 'Miss':
        return TitleSalutation.missChild;
      case '':
        return TitleSalutation.none;
      case 'clickButtonError':
        return TitleSalutation.clickButtonError;
      default:
        return null;
    }
  }

  ///Converts date format from 'dd-mm-yyyy' to 'yyyymmdd'
  static String convertToParsableDateFormat(String date) {
    return date.split('/').reversed.join();
  }

  ///Converts date format from 'dd/mm/yyyy' to 'dd-mm-yyyy'
  static String convertToRequestDateFormat(String date) {
    return date.replaceAll('/', '-');
  }

  ///Converts date format from 'dd-mm-yyyy' to 'dd/mm/yyyy'
  static String convertToDisplayDateFormat(String date) {
    return date.replaceAll('-', '/');
  }

  static int getCompressRatio(double actualImageSize) {
    int averageCompressRation = 60;
    const int percentageDivision = 100;
    if (actualImageSize > 0) {
      final calculatedRation =
          ((maxSizeAllowedToUploadInKb / actualImageSize) * percentageDivision)
              .toStringAsFixed(0);
      averageCompressRation = int.parse(calculatedRation);
    }
    return averageCompressRation;
  }

  //to create file using response
  static Future<File> createFile(Uint8List bytesData, String? name) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final filePath = '$tempPath/$name';
    final file = File(filePath);
    if (file.existsSync()) {
      final fileSystemEntity = await file.delete();
      adLog('Deleted already present file $fileSystemEntity');
    }
    final createdFile = await file.create();
    return createdFile.writeAsBytes(
      bytesData,
    );
  }

  static Future<File> compressFile(
    double fileSizeInKBForActualImage,
    File filesWrite,
  ) async {
    final compressedFile =
        fileSizeInKBForActualImage > MyProfileUtils.maxSizeAllowedToUploadInKb
            ? await FlutterNativeImage.compressImage(
                filesWrite.path,
                quality:
                    MyProfileUtils.getCompressRatio(fileSizeInKBForActualImage),
              )
            : filesWrite;
    return compressedFile;
  }

  static Future<Uint8List> downloadFile(String url) async {
    final downloadedFile = await DefaultCacheManager().downloadFile(url);
    final fileByteData = await downloadedFile.file.readAsBytes();
    return fileByteData;
  }
}

///this enum defines all the possible marital status values
enum MaritalStatus { single, married, divorced, widow }

///this converts enum to normal string abbreviation
extension MaritalStatusAbbr on MaritalStatus {
  String get maritalAbbr {
    switch (this) {
      case MaritalStatus.single:
        return 'single';
      case MaritalStatus.married:
        return 'married';
      case MaritalStatus.divorced:
        return 'divorced';
      case MaritalStatus.widow:
        return 'widow';
    }
  }
}

///this enum defines all the possible title salutation values
enum TitleSalutation {
  mister,
  missus,
  miss,
  mstrChild,
  missChild,
  none,
  clickButtonError
}

///this converts enum to normal string abbreviation
extension TitleAbbr on TitleSalutation {
  String get titleAbbr {
    switch (this) {
      case TitleSalutation.mister:
        return 'Mr.';
      case TitleSalutation.missus:
        return 'Mrs.';
      case TitleSalutation.miss:
        return 'Ms.';
      case TitleSalutation.mstrChild:
        return 'Mstr.';
      case TitleSalutation.missChild:
        return 'Miss';
      case TitleSalutation.none:
        return '';
      case TitleSalutation.clickButtonError:
        return 'clickButtonError';
    }
  }
}
