class PostUpdateReqDto {
  final String? title;
  final String? content;

  PostUpdateReqDto(
    this.title,
    this.content,
  );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
