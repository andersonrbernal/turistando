import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/tourist_spot/tourist_spot_widget.dart';
import '/widgets/user_header/user_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TourismsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserHeader component.
  late UserHeaderModel userHeaderModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for TouristSpot component.
  late TouristSpotModel touristSpotModel1;
  // Model for TouristSpot component.
  late TouristSpotModel touristSpotModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userHeaderModel = createModel(context, () => UserHeaderModel());
    touristSpotModel1 = createModel(context, () => TouristSpotModel());
    touristSpotModel2 = createModel(context, () => TouristSpotModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userHeaderModel.dispose();
    textController?.dispose();
    touristSpotModel1.dispose();
    touristSpotModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
