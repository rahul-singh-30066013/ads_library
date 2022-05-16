import 'package:ads_library/viewModel/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///@ADBaseStateFullWidget Class for state full widget with viewModel of Generic type
class ADBaseStateFullWidget<T extends BaseViewModel> extends StatefulWidget {
  ///required by default, if *[isOnlyProvider] is set to false
  final Widget Function(BuildContext context, T model, Widget? child)? builder;

  ///ViewModel responsible for service the data to widgets
  final T viewModel;

  ///required when *[isOnlyProvider] is set to true
  ///child of the provider
  final Widget? child;

  /// @intiViewModel is used to initialize the viewNModel in init state
  final Function(T) intiViewModel;

  ///default set to false
  ///bool to set baseView to only provider
  final bool isOnlyProvider;

  const ADBaseStateFullWidget(
      {Key? key,
        required this.viewModel,
        this.builder,
        this.child,
        required this.intiViewModel,
        this.isOnlyProvider = false})
      : super(key: key);

  @override
  _ADBaseStateFullWidgetState<T> createState() =>
      _ADBaseStateFullWidgetState<T>();
}

class _ADBaseStateFullWidgetState<T extends BaseViewModel>
    extends State<ADBaseStateFullWidget<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.intiViewModel(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: !widget.isOnlyProvider && widget.builder != null
          ? Consumer<T>(builder: widget.builder!)
          : widget.child,
    );
  }
}

/// @ADBaseStateLessView is a base class for all state less widget with viewModel of Generic type.
class ADBaseStateLessWidget<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;

  ///ViewModel responsible for service the data to widgets.
  final T viewModel;

  ///child of the provider
  ///
  final Widget? child;

  /// @intiViewModel is used to initialize the viewModel in @ADBaseStateFullWidget constructor.
  final Function(T) initViewModel;

  /// used to create baseView with provider and consumer both
  /// used when screen/widget state does not need to be updated after fetching once from API
  ADBaseStateLessWidget({
    Key? key,
    required this.viewModel,
    required this.builder,
    this.child,
    required this.initViewModel,
  }) : super(key: key) {
    initViewModel(viewModel);
  }

  /// used to create baseView as only provider
  /// used when multiple selectors/consumers are required
  /// used for updating a particular widget when notifyListener() is used and not whole screen
  ADBaseStateLessWidget.onlyProvider({
    Key? key,
    required this.viewModel,
    this.child,
    required this.initViewModel,
  })  : builder = null,
        super(key: key) {
    initViewModel(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: builder != null ? Consumer<T>(builder: builder!) : child,
    );
  }
}

///@ADSelectorStateLessWidget is a base class for all widget that is used for multiple  API call.
class ADSelectorStateLessWidget<T extends ADBaseViewModel>
    extends StatelessWidget {
  ///ViewModel responsible for service the data to widgets.
  final T viewModel;

  ///child of the provider
  final Widget? child;

  const ADSelectorStateLessWidget({
    Key? key,
    required this.viewModel,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: child,
    );
  }
}