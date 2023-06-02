/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class Earning {
  int? total;
  int? reward;
  int? order;

  Earning({this.total, this.reward, this.order});

  Earning.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    reward = json['reward'];
    order = json['order'];
  }
}
