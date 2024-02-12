import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
	final String? name;
	final String? hash;
	final String? ext;
	final String? mime;
	final dynamic path;
	final int? width;
	final int? height;
	final double? size;
	final String? url;

	const Thumbnail({
		this.name, 
		this.hash, 
		this.ext, 
		this.mime, 
		this.path, 
		this.width, 
		this.height, 
		this.size, 
		this.url, 
	});

	factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
				name: json['name'] as String?,
				hash: json['hash'] as String?,
				ext: json['ext'] as String?,
				mime: json['mime'] as String?,
				path: json['path'] as dynamic,
				width: json['width'] as int?,
				height: json['height'] as int?,
				size: (json['size'] as num?)?.toDouble(),
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'hash': hash,
				'ext': ext,
				'mime': mime,
				'path': path,
				'width': width,
				'height': height,
				'size': size,
				'url': url,
			};

	@override
	List<Object?> get props {
		return [
				name,
				hash,
				ext,
				mime,
				path,
				width,
				height,
				size,
				url,
		];
	}
}
