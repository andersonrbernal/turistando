import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Tourist Attraction API Group Code

class TouristAttractionAPIGroup {
  static String baseUrl = 'https://tourist-attraction.p.rapidapi.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'X-RapidAPI-Key': '3da0f2df3bmshdb2eab0365766c7p139ccajsn406201f6bd81',
    'X-RapidAPI-Host': 'tourist-attraction.p.rapidapi.com',
  };
  static TypeaheadCall typeaheadCall = TypeaheadCall();
  static ReviewsCall reviewsCall = ReviewsCall();
}

class TypeaheadCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? lang = 'en_US',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Typeahead',
      apiUrl: '${TouristAttractionAPIGroup.baseUrl}/typeahead',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': '3da0f2df3bmshdb2eab0365766c7p139ccajsn406201f6bd81',
        'X-RapidAPI-Host': 'tourist-attraction.p.rapidapi.com',
      },
      params: {
        'language': lang,
        'q': query,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      );
  dynamic location(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.location_id''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.name''',
        true,
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.latitude''',
        true,
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.longitude''',
        true,
      );
  dynamic timezone(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.timezone''',
        true,
      );
  dynamic locationId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.location_string''',
        true,
      );
  dynamic images(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.photo.images''',
        true,
      );
  dynamic ancestors(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object.ancestors''',
        true,
      );
  dynamic resultObject(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].result_object''',
        true,
      );
}

class ReviewsCall {
  Future<ApiCallResponse> call({
    String? locationId = '',
    String? offset = '0',
    String? currency = 'USD',
    String? lang = 'en_US',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Reviews',
      apiUrl: '${TouristAttractionAPIGroup.baseUrl}/reviews',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': '3da0f2df3bmshdb2eab0365766c7p139ccajsn406201f6bd81',
        'X-RapidAPI-Host': 'tourist-attraction.p.rapidapi.com',
      },
      params: {
        'location_id': locationId,
        'offset': offset,
        'currency': currency,
        'language': lang,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic reviews(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      );
  dynamic paging(dynamic response) => getJsonField(
        response,
        r'''$.results.paging''',
      );
}

/// End Tourist Attraction API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
