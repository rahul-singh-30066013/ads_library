
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/train/ga_analytics/train_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/train/request_model/ers_invoice.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
class TrainBookingRepository{
  final ADApiClient adApiClientTrainMan =
  ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  Future<ADResponseState>downloadTrainInvoice(
      String bookingId,
      BuildContext context,
      String? userID,
      ) async {
    //to send GA event for download invoice
    TrainBookingGaAnalytics().downloadTrainInvoiceAnalyticsData();
    final File oldFile = await _localFile(bookingId);
    if (oldFile.existsSync()) {
      adLog('showing old file');
      final oldFileData = await OpenFile.open(oldFile.path);
      adLog('file downloaded${oldFile.path},$oldFileData');
      return ADResponseState.completed('Success');
    }
    else {
      final Map<String, String> header = {
        'CLIENT-ID': 'adani',
        'CLIENT-SECRET': 'supersecretpassword',
        'User-Agent': userAgent,
      };
      final ErsInvoice model=ErsInvoice(bookingId, userID);
      File? file;
      try {
        ProcessDialog.showLoadingDialog(context);
        final ADResponseState response = await adApiClientTrainMan.trainManInvoicePostApi(
          path: 'api/trainmanwhitelabelapi/services/adl/get-ers',
          params: jsonEncode(model),
          header: header,

        );

        if (response.data != null) {
          file = await writeDataToFile(
            bookingId,
            response,
          );
          ProcessDialog.closeLoadingDialog(context);
          if (file.path.isNotEmpty) {
            final fileData = await OpenFile.open(file.path);
            adLog('file downloaded${file.path},$fileData');
          }
        } else {
          ProcessDialog.closeLoadingDialog(context);
          SnackBarUtil.showSnackBar(
            context,
            'oops_something_went_wrong'.localize(context),
          );
        }
      } catch (e) {
        ProcessDialog.closeLoadingDialog(context);
        SnackBarUtil.showSnackBar(
          context,
          'oops_something_went_wrong'.localize(context),
        );
      }
      return file != null
          ? ADResponseState.completed('Success')
          : ADResponseState.error('Failed', '');
    }

  }
  ///The method will create a file with defined name
  Future<File> _localFile(String id) async {
    final path = await _localPath;
    return File('$path${Platform.pathSeparator}Invoice_$id.pdf');
  }
  ///This method will return a cache/original path to save the file
  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    // final directory = await getApplicationSupportDirectory();
// openFile(directory);
    return directory.path;
  }

  ///Once download is completed we will write data to the file
  Future<File> writeDataToFile(String invoiceID, ADResponseState response) async {
    final file = await _localFile(invoiceID);
    final Uint8List data = response.data;
    final ByteBuffer buffer = data.buffer;
    final Uint8List fileList = buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    final List<int> writableListByte = fileList.cast<int>();
    return file.writeAsBytes(writableListByte);
  }
}