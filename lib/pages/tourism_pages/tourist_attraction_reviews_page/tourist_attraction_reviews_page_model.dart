import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/not_found/not_found_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'tourist_attraction_reviews_page_widget.dart'
    show TouristAttractionReviewsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TouristAttractionReviewsPageModel
    extends FlutterFlowModel<TouristAttractionReviewsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _locationQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> locationQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _locationQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLocationQueryCache() => _locationQueryManager.clear();
  void clearLocationQueryCacheKey(String? uniqueKey) =>
      _locationQueryManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearLocationQueryCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
