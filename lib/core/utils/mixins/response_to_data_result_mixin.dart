import '../../services/models/api_response.dart';
import '../results/data_result.dart';

class ResponseToDataResultMixin {
  DataResult<T> apiResponseToDataResult<T>(ApiResponse apiResponse) {
    return DataResult<T>(
      success: apiResponse.success,
      data: apiResponse.data,
      message: apiResponse.message,
      statusCode: apiResponse.statusCode,
    );
  }
}
