import 'package:dio/dio.dart';
import 'package:lacquer/features/chatbot/dtos/prompt_dto.dart';
import 'package:lacquer/features/chatbot/dtos/reply_dto.dart';

class ChatbotApiClient {
  ChatbotApiClient(this.dio);

  final Dio dio;

  Future<ReplyDto> ask(PromptDto promptdto) async {
    try {
      final response = await dio.post(
        '/chatbot',
        data: {'prompt': promptdto.prompt},
      );
      return ReplyDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data['message']);
      } else {
        throw Exception(e.message);
      }
    }
  }
}
