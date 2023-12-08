import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'language_settings_page_model.dart';
export 'language_settings_page_model.dart';

class LanguageSettingsPageWidget extends StatefulWidget {
  const LanguageSettingsPageWidget({Key? key}) : super(key: key);

  @override
  _LanguageSettingsPageWidgetState createState() =>
      _LanguageSettingsPageWidgetState();
}

class _LanguageSettingsPageWidgetState
    extends State<LanguageSettingsPageWidget> {
  late LanguageSettingsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageSettingsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LanguageSettingsPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            logFirebaseEvent('LANGUAGE_SETTINGS_arrow_back_rounded_ICN');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'x4abnblb' /* Languages */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 9.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ibzpf1do' /* Select the language you want t... */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
            ),
            FlutterFlowLanguageSelector(
              width: double.infinity,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                  ),
              hideFlags: true,
              flagSize: 24.0,
              flagTextGap: 8.0,
              currentLanguage: FFLocalizations.of(context).languageCode,
              languages: FFLocalizations.languages(),
              onChanged: (lang) => setAppLanguage(context, lang),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('LANGUAGE_SETTINGS_Button-Login_ON_TAP');
                  logFirebaseEvent('Button-Login_navigate_back');
                  context.safePop();
                },
                text: FFLocalizations.of(context).getText(
                  'q2mge58a' /* Save Changes */,
                ),
                options: FFButtonOptions(
                  width: 190.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
