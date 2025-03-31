class ReplyDto {
  final bool success;
  final String message;
  final String data;

  const ReplyDto({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ReplyDto.fromJson(Map<String, dynamic> json) {
    return ReplyDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );
  }
}
