import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/salutation_form_radio.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validated_text_field.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAlonePersonalDetailView extends StatelessWidget {
  const StandAlonePersonalDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<StandAloneReviewDetailStateManagement>();
    final ValueNotifier<bool> _updateField = ValueNotifier(false);
    final List<site_core.Salutation> salutations = getSalutationsByCategory(
      'adult',
      context.read<SiteCoreStateManagement>().salutation,
    );
    const nameMaxLength = 27;
    void updateData(
      String value,
      TextEditingController controller,
    ) {
      navigatorPopScreen(context);
      controller.text = value;
      _updateField.value = !_updateField.value;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'personal_information'.localize(context),
          style: ADTextStyle700.size18.setTextColor(context.adColors.black),
        ),
        ADSizedBox(
          height: context.k_24,
        ),
        SalutationFormRadio(
          controller: state.salutationController.controller,
          validator: (val) => Validations.validateSalutation(val, context),
          salutations: salutations,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ).paddingBySide(bottom: context.k_20),

        /// Salutation and First name text field
        ValueListenableBuilder(
          valueListenable: _updateField,
          builder: (_, value, __) {
            return ValidatedTextField(
              key: state.firstNameController.key,
              textLength: nameMaxLength,
              focus: state.firstNameController.focusNode,
              notifyParent: (p0) => {},
              type: 'firstName'.localize(context),
              controller: state.firstNameController.controller,
              validation: (String? value, BuildContext context) =>
                  Validations.validateName(
                value,
                context,
                state.salutationController.controller,
              ),
            );
          },
        ),

        ADSizedBox(
          height: context.k_20,
        ),

        /// Last name text field
        ValidatedTextField(
          key: state.lastNameController.key,
          textLength: nameMaxLength,
          focus: state.lastNameController.focusNode,
          notifyParent: (p0) => {},
          type: 'last_name_middle_name'.localize(context),
          validation: Validations.validateLastName,
          //isDisabled: widget.isPlacardEditableView ?? false,
          controller: state.lastNameController.controller,
        ),

        ADSizedBox(
          height: context.k_20,
        ),

        /// Comment text field
        ValidatedTextField(
          key: state.commentController.key,
          notifyParent: (p0) => {},
          type: 'Comment',
          controller: state.commentController.controller,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
