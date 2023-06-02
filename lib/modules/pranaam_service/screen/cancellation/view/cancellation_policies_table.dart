/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/cancellation_policies/cancellation_policies_model.dart'
    as policies;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///this class is used to draw cancellation policies table view

class CancellationPoliciesTable extends StatelessWidget {
  final policies.Element pranaamCancellationPolicies;

  const CancellationPoliciesTable({
    Key? key,
    required this.pranaamCancellationPolicies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final List<Widget> headers = [];
    for (int header = 0;
        header < pranaamCancellationPolicies.fields.header.length;
        header++) {
      headers.add(
        TableHeader(
          title: pranaamCancellationPolicies.fields.header[header].title,
        ),
      );
    }
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(5),
        2: FlexColumnWidth(5),
      },
      border: TableBorder.symmetric(
        outside: const BorderSide(
          color: Color(0xffd5d5d9),
        ),
        inside: const BorderSide(
          color: Color(0xffd5d5d9),
        ),
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Color(0xfff6f6f6),
          ),
          children: headers,
        ),
        ...List.generate(
          pranaamCancellationPolicies.fields.rows.length,
          (index) => TableRow(
            children: [
              TableItem(
                text: pranaamCancellationPolicies.fields.rows[index].srNo,
              ),
              TableItem(
                text: pranaamCancellationPolicies.fields.rows[index].services,
              ),
              TableItem(
                text: pranaamCancellationPolicies.fields.rows[index].charges,
              ),
            ],
          ),
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
      bottom: context.k_38,
    );
  }
}

class TableHeader extends StatelessWidget {
  final String title;

  const TableHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: ADTextStyle500.size14.copyWith(
        color: context.adColors.darkGreyTextColor,
      ),
    ).paddingBySide(
      left: context.k_16,
      top: context.k_20,
      bottom: context.k_20,
      right: context.k_16,
    );
  }
}

class TableItem extends StatelessWidget {
  final String text;

  const TableItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.k_16,
        top: context.k_20,
        bottom: context.k_20,
        right: context.k_16,
      ),
      child: Text(
        text,
        style: ADTextStyle500.size14,
      ),
    );
  }
}
