/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_logger.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabDownLoadInvoiceView extends StatelessWidget {
  final CabBookingConfirmationState cabBookingConfirmationState;

  const CabDownLoadInvoiceView({
    Key? key,
    required this.cabBookingConfirmationState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        CabGoogleAnalytics().sendGAParametersCabBookingDownloadInvoice(
          cabBookingConfirmationState,
        ),
        downloadBookingInvoice(
          context
                  .read<CabBookingConfirmationState>()
                  .commonOrderDetailBaseResponse
                  ?.orderReferenceId ??
              '',
          context
                  .read<CabBookingConfirmationState>()
                  .commonOrderDetailBaseResponse
                  ?.businessSubType ??
              'CabBooking',
          context,
        ),
      },
      child: Column(
        children: [
          Divider(
            color: context.adColors.tileBorderColor,
            height: 1.sp,
            thickness: 1.sp,
          ),
          Row(
            children: [
              SvgPicture.asset(
                SvgAssets.downloadInvoice,
                color: context.adColors.greyTextColor,
                height: context.k_16,
                width: context.k_16,
              ).paddingBySide(left: context.k_2),
              SizedBox(
                width: context.k_12,
              ),
              Text(
                'downloadInvoice'.localize(context),
                style: ADTextStyle500.size16.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: context.k_18,
              ),
            ],
          ).paddingBySide(top: context.k_16, bottom: context.k_16),
          Divider(
            color: context.adColors.tileBorderColor,
            height: 1.sp,
            thickness: 1.sp,
          ),
        ],
      ),
    );
  }

  Future<void> downloadBookingInvoice(
    String orderReferenceId,
    String businessSubType,
    BuildContext context,
  ) async {
    unawaited(
      downloadInvoice(
        orderReferenceId,
        businessSubType,
        context,
      ),
    );
  }

  ///API call to get invoice for current trip.
  Future<ADResponseState> downloadInvoice(
    String orderReferenceId,
    String businessSubType,
    BuildContext context,
  ) async {
    final File oldFile = await _localFile(orderReferenceId);
    if (oldFile.existsSync()) {
      adLog('showing old file');
      final oldFileData = await OpenFile.open(oldFile.path);
      adLog('file downloaded${oldFile.path},$oldFileData');
      return ADResponseState.completed('Success');
    } else {
      final dio = _createDio(
        Environment.instance.configuration.apiBaseUrl,
      );

      final token = await getToken();
      final Map<String, String> map = {
        'channelId': Platform.isAndroid ? 'Android' : 'iOS',
        'traceId': ProfileSingleton.profileSingleton.apiTraceId,
        'language': 'en',
        'Authorization': 'Bearer $token',
        'User-Agent': userAgent,
      };
      File? file;
      const int snackBarDuration = 3000;
      try {
        ProcessDialog.showLoadingDialog(context);
        final Response result = await dio.get(
          '${FLightsApiUrls.downloadInvoiceForTrip}$orderReferenceId&subType=$businessSubType',
          options: Options(
            headers: map,
            contentType: 'application/pdf',
            responseType: ResponseType.bytes,
          ),
        );
        if (result.data != null) {
          file = await writeDataToFile(
            orderReferenceId,
            result,
          );
          ProcessDialog.closeLoadingDialog(context);
          if (file.path.isNotEmpty) {
            final fileData = await OpenFile.open(file.path);
            adLog('file downloaded${file.path},$fileData');
          }
        } else {
          SnackBarUtil.showSnackBar(
            context,
            'oops_something_went_wrong'.localize(context),
            snackBarDuration,
            EdgeInsets.symmetric(
              horizontal: context.k_16,
              vertical: context.k_64 + context.k_30,
            ),
          );
        }
      } catch (e) {
        if (e is DioError) {
          if (e.type == DioErrorType.other) {
            return (e.error != null) &&
                    (e.error as SocketException).osError?.errorCode != null
                ? ADResponseState.error(noInternetMessage, '51')
                : ADResponseState.error(e.toString(), '');
          }
        } else {
          return ADResponseState.error('Failed', '');
        }
        ProcessDialog.closeLoadingDialog(context);
        SnackBarUtil.showSnackBar(
          context,
          'oops_something_went_wrong'.localize(context),
          snackBarDuration,
          EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_64 + context.k_30,
          ),
        );
      }
      return file != null
          ? ADResponseState.completed('Success')
          : ADResponseState.error('Failed', '');
    }
  }

  Future<String> getToken() async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    return accessToken ?? '';
  }

  ///The method will create a file with defined name
  Future<File> _localFile(String id) async {
    final path = await _localPath;
    return File('$path${Platform.pathSeparator}Invoice_$id.pdf');
  }

  ///This method will return a cache/original path to save the file
  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Dio _createDio(String endPoint) {
    final Dio _dio = Dio();
    _dio.options.baseUrl = endPoint;

    _dio.interceptors.add(
      AdLogger(
        compact: false,
      ),
    );
    return _dio;
  }

  ///Once download is completed we will write data to the file
  Future<File> writeDataToFile(String invoiceID, Response response) async {
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
