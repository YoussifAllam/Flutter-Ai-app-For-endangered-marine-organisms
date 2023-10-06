class Detection {
  final double time;
  final ImageInfo image;
  final List<Prediction> predictions;

  Detection({
    required this.time,
    required this.image,
    required this.predictions,
  });

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
      time: json['time'],
      image: ImageInfo.fromJson(json['image']),
      predictions: List<Prediction>.from(
        json['predictions'].map((prediction) => Prediction.fromJson(prediction)),
      ),
    );
  }
}

class ImageInfo {
  final double width;
  final double height;

  ImageInfo({
    required this.width,
    required this.height,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      width: json['width'],
      height: json['height'],
    );
  }
}

class Prediction {
  final double x;
  final double y;
  final double width;
  final double height;
  final double confidence;
  final String classType;
  final int classId;

  Prediction({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.confidence,
    required this.classType,
    required this.classId,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      x: json['x'],
      y: json['y'],
      width: json['width'],
      height: json['height'],
      confidence: json['confidence'],
      classType: json['class'],
      classId: json['class_id'],
    );
  }
}

class Temperatures {
  List<TemperaturesDatum> data;
  Meta meta;

  Temperatures({
    required this.data,
    required this.meta,
  });

}

class TemperaturesDatum {
  int id;
  PurpleAttributes attributes;

  TemperaturesDatum({
    required this.id,
    required this.attributes,
  });

}

class PurpleAttributes {
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  Photos photos;
  Category category;

  PurpleAttributes({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.photos,
    required this.category,
  });

}

class Category {
  Data data;

  Category({
    required this.data,
  });

}

class Data {
  int id;
  DataAttributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

}

class DataAttributes {
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;

  DataAttributes({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

}

class Photos {
  List<PhotosDatum> data;

  Photos({
    required this.data,
  });

}

class PhotosDatum {
  int id;
  FluffyAttributes attributes;

  PhotosDatum({
    required this.id,
    required this.attributes,
  });

}

class FluffyAttributes {
  String name;
  dynamic alternativeText;
  dynamic caption;
  int width;
  int height;
  Formats formats;
  String hash;
  Ext ext;
  Mime mime;
  double size;
  String url;
  dynamic previewUrl;
  Provider provider;
  dynamic providerMetadata;
  DateTime createdAt;
  DateTime updatedAt;

  FluffyAttributes({
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

}

enum Ext {
  JPG,
  PNG
}

class Formats {
  Thumbnail thumbnail;
  Thumbnail? small;
  Thumbnail? medium;
  Thumbnail? large;

  Formats({
    required this.thumbnail,
    this.small,
    this.medium,
    this.large,
  });

}

class Thumbnail {
  String name;
  String hash;
  Ext ext;
  Mime mime;
  dynamic path;
  int width;
  int height;
  double size;
  String url;

  Thumbnail({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.url,
  });

}

enum Mime {
  IMAGE_JPEG,
  IMAGE_PNG
}

enum Provider {
  LOCAL
}

class Meta {
  Pagination pagination;

  Meta({
    required this.pagination,
  });

}

class Pagination {
  int page;
  int pageSize;
  int pageCount;
  int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

}



class Datum {
  int id;
  Attributes attributes;

  Datum({
    required this.id,
    required this.attributes,
  });

}

class Attributes {
  String name;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;

  Attributes({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

}



class Items {
  String name;
  String description;
  String photo1;
  String photo2;
  String category;

  Items({
    required this.name,
    required this.description,
    required this.photo1,
    required this.photo2,
    required this.category,
  });

}



class Temperat {
  List<Datum> data;
  Meta meta;

  Temperat({
    required this.data,
    required this.meta,
  });

}





