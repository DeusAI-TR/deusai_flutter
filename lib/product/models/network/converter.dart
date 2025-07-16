import 'package:json_annotation/json_annotation.dart';

class Converter<T> implements JsonConverter<T, Object?> {
  const Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      // case UserData:
      //   return UserData.fromJson(json as Map<String, dynamic>) as T;
      case bool:
        return json as T;
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T object) => object;
}
