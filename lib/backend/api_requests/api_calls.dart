import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SentimentCall {
  static Future<ApiCallResponse> call({
    String? prompt = ' ',
  }) {
    final ffApiRequestBody = '''
{
  "model": "text-davinci-003",
  "prompt": "Rate the sentiment of the following text from sad to happy on a scale of 0 to 1 with increments of 0.1\\n\\nText: \\"${prompt}\\"\\nSentiment:",
  "temperature": 0.7,
  "max_tokens": 256,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sentiment',
      apiUrl: 'https://api.openai.com/v1/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic hapiness(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].text''',
      );
}

class GetResponseFromAiCall {
  static Future<ApiCallResponse> call({
    String? message = '',
  }) {
    final ffApiRequestBody = '''
{
  "model": "text-davinci-003",
  "prompt": "Act as a therapist and only a therapist. For example, a professional therapist would not know how to solve math equations or write an essay. They only help and comfort people.\\n\\nKnowing your role, respond to this message: '${message}'",
  "temperature": 0.7,
  "max_tokens": 256,
  "frequency_penalty": 0,
  "top_p": 1,
  "presence_penalty": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getResponseFromAi',
      apiUrl: 'https://api.openai.com/v1/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer REPLACE_WITH_YOUR_API_KEY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].text''',
      );
}

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
