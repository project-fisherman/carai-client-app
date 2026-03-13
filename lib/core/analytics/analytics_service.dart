import 'package:flutter/foundation.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:dio/dio.dart';
import '../config/env_config.dart';

class AnalyticsService {
  /// API 에러 이벤트를 로깅합니다. 
  /// Cloud Functions에서 이 이벤트를 감지하여 텔레그램으로 전송합니다.
  static Future<void> logApiError({
    required String errorType,
    required String method,
    required String uri,
    String? message,
    dynamic responseData,
  }) async {
    // Firebase가 비활성화된 경우 로깅을 건너뜁니다.
    if (!EnvConfig.isFirebaseEnabled) {
      debugPrint('⚠️ [Analytics] Firebase 비활성화 — 로깅 건너뜀: $errorType, $uri');
      return;
    }

    debugPrint('📊 [Analytics] Logging api_error: $errorType, $uri');
    
    /*
    // 문자열 길이 제한 (Analytics 파라미터 제약 고려)
    String safeResponseData = '';
    if (responseData != null) {
      final dataStr = response_data.toString();
      safeResponseData = dataStr.length > 100 
          ? '${dataStr.substring(0, 97)}...' 
          : dataStr;
    }
    */

    /*
    final analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(
      name: 'api_error',
      parameters: {
        'error_type': errorType,
        'method': method,
        'uri': uri,
        'message': message ?? '',
        'response_data': safeResponseData,
      },
    );
    debugPrint('📊 [Analytics] Event logged');
    */

    /*
    // 2. HTTP POST to Hosting Rewrite Endpoint (Bypasses IAM / Restricts to Domain)
    try {
      final dio = Dio();
      // ALWAYS use the production domain for testing to hit the Hosting Rewrite
      // This bypasses the 404 on localhost.
      const String endpoint = 'https://m.carai.ai.kr/api/error';
      
      debugPrint('📊 [Analytics] Calling Hosting Endpoint: $endpoint');
      
      final response = await dio.post(
        endpoint,
        data: {
          'error_type': errorType,
          'method': method,
          'uri': uri,
          'message': message ?? '',
          'response_data': safeResponseData,
        },
      );

      // Check if we got HTML (fallback to index.html) or actual JSON success
      if (response.data is String && response.data.contains('<!DOCTYPE html>')) {
        debugPrint('⚠️ [Analytics] Hosting Rewrite failed (fell back to index.html). The function might not be deployed or mapped correctly.');
      } else {
        debugPrint('📊 [Analytics] Telegram notification response: ${response.data}');
      }
    } catch (e) {
      debugPrint('❌ [Analytics] Failed to call Hosting Endpoint: $e');
    }
    */
  }
}
