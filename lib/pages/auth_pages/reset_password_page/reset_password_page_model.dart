import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'reset_password_page_widget.dart' show ResetPasswordPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPasswordPageModel extends FlutterFlowModel<ResetPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for email_reset widget.
  FocusNode? emailResetFocusNode;
  TextEditingController? emailResetController;
  String? Function(BuildContext, String?)? emailResetControllerValidator;
  String? _emailResetControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1ywxv7q5' /* Email required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'whvtlc3h' /* Invalid Email */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailResetControllerValidator = _emailResetControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailResetFocusNode?.dispose();
    emailResetController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
