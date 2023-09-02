import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/profile_avatar_settings/profile_avatar_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ProfileAvatarSettings component.
  late ProfileAvatarSettingsModel profileAvatarSettingsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profileAvatarSettingsModel =
        createModel(context, () => ProfileAvatarSettingsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    profileAvatarSettingsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
