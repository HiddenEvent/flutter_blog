class PostSaveOrUpdateReqDto {
  final String? title;
  final String? content;

  PostSaveOrUpdateReqDto(
    this.title,
    this.content,
  );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
