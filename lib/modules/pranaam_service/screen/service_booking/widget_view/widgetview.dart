/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

///this class is used our stateful that will have a controller as it will have state
abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;

  T1 get widget => (state as State).widget as T1;

  const WidgetView(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context);
}

///this class is used our stateless that will not have a controller as it will not have state
abstract class StatelessView<T1> extends StatelessWidget {
  final T1 widget;

  const StatelessView(
    this.widget, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context);
}
