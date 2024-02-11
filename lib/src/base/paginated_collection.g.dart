// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedCollection<ListObjectType, ListParametersType>
    _$PaginatedCollectionFromJson<ListObjectType extends ModelWithId,
            ListParametersType extends Parameters>(Map<String, dynamic> json) =>
        PaginatedCollection<ListObjectType, ListParametersType>(
          json['object'],
          json['mode'],
          json['has_more'] as bool?,
        );

Map<String, dynamic> _$PaginatedCollectionToJson<
            ListObjectType extends ModelWithId,
            ListParametersType extends Parameters>(
        PaginatedCollection<ListObjectType, ListParametersType> instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
    };
