import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelfordImage {
  String id;
  String author;
  String url;

  @JsonKey(name: 'download_url')
  String urlFullSize;

  PixelfordImage(
      {required this.author,
      required this.url,
      required this.id,
      required this.urlFullSize});

  factory PixelfordImage.fromJson(Map<String, dynamic> json) =>
      _$PixelformImageFromJson(json);

  Map<String, dynamic> toJson() => _$PixelformImageToJson(this);
}
