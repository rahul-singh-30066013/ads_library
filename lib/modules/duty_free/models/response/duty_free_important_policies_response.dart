/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class DutyFreeImportantPoliciesResponse {
  DutyFreeImportantPoliciesResponse({
    required this.line,
    required this.title,
    required this.linkText,
    required this.linkURL,
  });
  String line;
  String title;
  String linkText;
  String linkURL;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['line'] = line;
    _data['title'] = title;
    _data['linkText'] = linkText;
    _data['linkURL'] = linkURL;
    return _data;
  }
}
