import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for email_login widget.
  FocusNode? emailLoginFocusNode;
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  // State field(s) for password_login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for username_create widget.
  FocusNode? usernameCreateFocusNode;
  TextEditingController? usernameCreateController;
  String? Function(BuildContext, String?)? usernameCreateControllerValidator;
  String? _usernameCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9yece9ll' /* Username is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '5p48ncky' /* Username is too short */,
      );
    }
    if (val.length > 255) {
      return FFLocalizations.of(context).getText(
        'xa1046c8' /* Username is too large */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2nffw11f' /* Username is invalid */,
      );
    }
    return null;
  }

  // State field(s) for email_create widget.
  FocusNode? emailCreateFocusNode;
  TextEditingController? emailCreateController;
  String? Function(BuildContext, String?)? emailCreateControllerValidator;
  String? _emailCreateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g3p5ser0' /* Email is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'iy88h2pz' /* Email is too short */,
      );
    }
    if (val.length > 255) {
      return FFLocalizations.of(context).getText(
        'l4o3hjgr' /* Email is too long */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6fhxfd03' /* Email is invalid */,
      );
    }
    return null;
  }

  // State field(s) for photo_number_create widget.
  FocusNode? photoNumberCreateFocusNode;
  TextEditingController? photoNumberCreateController;
  String? Function(BuildContext, String?)? photoNumberCreateControllerValidator;
  // State field(s) for password_create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  String? _passwordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0msnc8mm' /* Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'wuzfk8gw' /* Password is too short */,
      );
    }
    if (val.length > 255) {
      return FFLocalizations.of(context).getText(
        'l8q2cylv' /* Password is too long */,
      );
    }

    return null;
  }

  // State field(s) for password_confirmation_create widget.
  FocusNode? passwordConfirmationCreateFocusNode;
  TextEditingController? passwordConfirmationCreateController;
  late bool passwordConfirmationCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmationCreateControllerValidator;
  String? _passwordConfirmationCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '19jdhf1m' /* Confirm Password is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'iuzgg16i' /* Password is too short */,
      );
    }
    if (val.length > 255) {
      return FFLocalizations.of(context).getText(
        'w6dwu2ir' /* Password is too long */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    usernameCreateControllerValidator = _usernameCreateControllerValidator;
    emailCreateControllerValidator = _emailCreateControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateControllerValidator = _passwordCreateControllerValidator;
    passwordConfirmationCreateVisibility = false;
    passwordConfirmationCreateControllerValidator =
        _passwordConfirmationCreateControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailLoginFocusNode?.dispose();
    emailLoginController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginController?.dispose();

    usernameCreateFocusNode?.dispose();
    usernameCreateController?.dispose();

    emailCreateFocusNode?.dispose();
    emailCreateController?.dispose();

    photoNumberCreateFocusNode?.dispose();
    photoNumberCreateController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();

    passwordConfirmationCreateFocusNode?.dispose();
    passwordConfirmationCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
