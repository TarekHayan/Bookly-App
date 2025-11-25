import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json['smallThumbnail'] as String?,
    thumbnail: json['thumbnail'] as String?,
  );

  // صورة آمنة
  String get safeThumbnail =>
      thumbnail ?? "https://via.placeholder.com/300x450?text=No+Image";

  String get safeSmallThumbnail =>
      smallThumbnail ?? "https://via.placeholder.com/150x220?text=No+Image";

  Map<String, dynamic> toJson() => {
    'smallThumbnail': smallThumbnail,
    'thumbnail': thumbnail,
  };

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
