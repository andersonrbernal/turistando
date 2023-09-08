import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start RapidAPI  Tourist Attraction Group Code

class RapidAPITouristAttractionGroup {
  static TypeHeadCall typeHeadCall = TypeHeadCall();
  static DetailCall detailCall = DetailCall();
  static SearchCall searchCall = SearchCall();
  static PhotosCall photosCall = PhotosCall();
  static ReviewsCall reviewsCall = ReviewsCall();
  static CurrenciesCall currenciesCall = CurrenciesCall();
  static LanguagesCall languagesCall = LanguagesCall();
}

class TypeHeadCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? language = 'en_US',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'TypeHeadCall',
        'variables': {
          'query': query,
          'language': language,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DetailCall {
  Future<ApiCallResponse> call({
    String? locationId = '',
    String? language = 'en_US',
    String? currency = 'USD',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DetailCall',
        'variables': {
          'locationId': locationId,
          'language': language,
          'currency': currency,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SearchCall {
  Future<ApiCallResponse> call({
    String? locationId = '',
    String? language = 'en_US',
    String? currency = 'USD',
    String? offset = '0',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SearchCall',
        'variables': {
          'locationId': locationId,
          'language': language,
          'currency': currency,
          'offset': offset,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class PhotosCall {
  Future<ApiCallResponse> call({
    String? locationId = '',
    String? language = 'en_US',
    String? currency = 'USD',
    String? offset = '0',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PhotosCall',
        'variables': {
          'locationId': locationId,
          'language': language,
          'currency': currency,
          'offset': offset,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ReviewsCall {
  Future<ApiCallResponse> call({
    String? locationId = '',
    String? language = 'en_US',
    String? currency = 'USD',
    String? offset = '0',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ReviewsCall',
        'variables': {
          'locationId': locationId,
          'language': language,
          'currency': currency,
          'offset': offset,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CurrenciesCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CurrenciesCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class LanguagesCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'LanguagesCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End RapidAPI  Tourist Attraction Group Code

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
