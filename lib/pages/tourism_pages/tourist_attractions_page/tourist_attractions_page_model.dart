import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/not_found/not_found_widget.dart';
import '/widgets/tourist_attraction/tourist_attraction_widget.dart';
import '/widgets/user_header/user_header_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TouristAttractionsPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> touristPoints = [];
  void addToTouristPoints(dynamic item) => touristPoints.add(item);
  void removeFromTouristPoints(dynamic item) => touristPoints.remove(item);
  void removeAtIndexFromTouristPoints(int index) =>
      touristPoints.removeAt(index);
  void updateTouristPointsAtIndex(int index, Function(dynamic) updateFn) =>
      touristPoints[index] = updateFn(touristPoints[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for UserHeader component.
  late UserHeaderModel userHeaderModel;
  // State field(s) for SearchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // Stores action output result for [Backend Call - API (TypeHead)] action in SearchButton widget.
  ApiCallResponse? response;
  // Models for TouristAttraction dynamic component.
  late FlutterFlowDynamicModels<TouristAttractionModel> touristAttractionModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userHeaderModel = createModel(context, () => UserHeaderModel());
    touristAttractionModels =
        FlutterFlowDynamicModels(() => TouristAttractionModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userHeaderModel.dispose();
    searchFieldController?.dispose();
    touristAttractionModels.dispose();
  }

  /// Action blocks are added here.

  Future<LatLng?> searchTouristPointsAction(BuildContext context) async {
    return null;
  }

  /// Additional helper methods are added here.
}
