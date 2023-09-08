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
import 'tourist_attractions_page_model.dart';
export 'tourist_attractions_page_model.dart';

class TouristAttractionsPageWidget extends StatefulWidget {
  const TouristAttractionsPageWidget({Key? key}) : super(key: key);

  @override
  _TouristAttractionsPageWidgetState createState() =>
      _TouristAttractionsPageWidgetState();
}

class _TouristAttractionsPageWidgetState
    extends State<TouristAttractionsPageWidget> {
  late TouristAttractionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouristAttractionsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TouristAttractionsPage'});
    _model.searchFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.userHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: UserHeaderWidget(
                        name: currentUserDisplayName,
                        imageUrl: currentUserPhoto,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 6.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.searchFieldController,
                                        textInputAction: TextInputAction.send,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'xo0q40bn' /* Search tourist points... */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        validator: _model
                                            .searchFieldControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.search_sharp,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TOURIST_ATTRACTIONS_SearchButton_ON_TAP');
                            logFirebaseEvent('SearchButton_backend_call');
                            _model.response =
                                await RapidAPITouristAttractionGroup
                                    .typeHeadCall
                                    .call(
                              query: _model.searchFieldController.text,
                            );
                            if ((_model.response?.succeeded ?? true)) {
                              logFirebaseEvent(
                                  'SearchButton_update_widget_state');
                              setState(() {
                                _model.touristPoints = getJsonField(
                                  (_model.response?.jsonBody ?? ''),
                                  r'''$.results.data''',
                                )!
                                    .toList()
                                    .cast<dynamic>();
                              });
                            } else {
                              logFirebaseEvent(
                                  'SearchButton_update_widget_state');
                              setState(() {
                                _model.touristPoints = [];
                              });
                            }

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 4.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'gicrqril' /* Tourist Points */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final touristItems =
                            _model.touristPoints.toList().take(20).toList();
                        if (touristItems.isEmpty) {
                          return Center(
                            child: NotFoundWidget(
                              title: FFLocalizations.of(context).getText(
                                'n1canlv2' /* No tourist attractions found. */,
                              ),
                              subtitle: FFLocalizations.of(context).getText(
                                '7b1e17ez' /* No tourist attractions match y... */,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: touristItems.length,
                          itemBuilder: (context, touristItemsIndex) {
                            final touristItemsItem =
                                touristItems[touristItemsIndex];
                            return Container(
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.touristAttractionModels.getModel(
                                  getJsonField(
                                    touristItemsItem,
                                    r'''$.result_object.location_id''',
                                  ).toString(),
                                  touristItemsIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: Hero(
                                  tag: getJsonField(
                                    touristItemsItem,
                                    r'''$.result_object.location_id''',
                                  ).toString(),
                                  transitionOnUserGestures: true,
                                  child: TouristAttractionWidget(
                                    key: Key(
                                      'Keyl0p_${getJsonField(
                                        touristItemsItem,
                                        r'''$.result_object.location_id''',
                                      ).toString()}',
                                    ),
                                    imageUrl: getJsonField(
                                      touristItemsItem,
                                      r'''$.photo.images.thumbnail.url''',
                                    ),
                                    location: getJsonField(
                                      touristItemsItem,
                                      r'''$.result_object.location_string''',
                                    ).toString(),
                                    name: getJsonField(
                                      touristItemsItem,
                                      r'''$.result_object.name''',
                                    ).toString(),
                                    description: getJsonField(
                                      touristItemsItem,
                                      r'''$.result_object.description''',
                                    ).toString(),
                                    stars: random_data
                                        .randomDouble(0.0, 5.0)
                                        .toString(),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
