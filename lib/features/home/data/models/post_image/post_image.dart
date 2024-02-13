import 'package:equatable/equatable.dart';

import 'formats.dart';

class PostImage extends Equatable {
  final int? id;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PostImage({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
        id: json['id'] as int?,
        name: json['name'] as String?,
        alternativeText: json['alternativeText'] as dynamic,
        caption: json['caption'] as dynamic,
        width: json['width'] as int?,
        height: json['height'] as int?,
        formats: json['formats'] == null
            ? null
            : Formats.fromJson(json['formats'] as Map<String, dynamic>),
        hash: json['hash'] as String?,
        ext: json['ext'] as String?,
        mime: json['mime'] as String?,
        size: (json['size'] as num?)?.toDouble(),
        url: json['url'] as String?,
        previewUrl: json['previewUrl'] as dynamic,
        provider: json['provider'] as String?,
        providerMetadata: json['provider_metadata'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'alternativeText': alternativeText,
        'caption': caption,
        'width': width,
        'height': height,
        'formats': formats?.toJson(),
        'hash': hash,
        'ext': ext,
        'mime': mime,
        'size': size,
        'url': url,
        'previewUrl': previewUrl,
        'provider': provider,
        'provider_metadata': providerMetadata,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      alternativeText,
      caption,
      width,
      height,
      formats,
      hash,
      ext,
      mime,
      size,
      url,
      previewUrl,
      provider,
      providerMetadata,
      createdAt,
      updatedAt,
    ];
  }
}
