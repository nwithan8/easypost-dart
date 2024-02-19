import 'dart:async';

import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/pagination_exception.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';

import '../internal/conversions.dart';

part 'paginated_collection.g.dart';

/// Superclass for all paginated collections.
@JsonSerializable(explicitToJson: true)
class PaginatedCollection<ListObjectType extends ReadOnlyModelWithId, ListParametersType extends Parameters> extends ReadOnlyModel {
  @JsonKey(name: 'has_more')
  final bool? hasMore;

  /// The [ListParametersType]-type parameter set used to initially retrieve this [PaginatedCollection], stored for reference when retrieving the next page.
  @JsonKey(includeFromJson: false, includeToJson: false)
  ListParametersType? filters;

  PaginatedCollection(objectType, mode, this.hasMore)
      : super(objectType, mode);

  @override
  Map<String, dynamic> toJson() => _$PaginatedCollectionToJson(this);

  /// Retrieves the next page of a [PaginatedCollection], using the provided [retrieveNextPageFunction] to retrieve the next page.
  Future<PaginatedCollection<ListObjectType, ListParametersType>> getNextPage(Future<PaginatedCollection<ListObjectType, ListParametersType>> Function(ListParametersType? parameters) retrieveNextPageFunction, List<ListObjectType>? currentPageItems, {int? pageSize}) {
    if (currentPageItems == null || currentPageItems.isEmpty) {
      throw PaginationException(ErrorMessages.noMorePagesToRetrieve);
    }

    if (hasMore == false) {
      throw throw PaginationException(ErrorMessages.noMorePagesToRetrieve);
    }

    ListParametersType? parameters = buildGetNextPageParameters(currentPageItems, pageSize: pageSize);

    return retrieveNextPageFunction(parameters);
  }

  /// Builds the [ListParametersType]-type parameter set to use to retrieve the next page of a [PaginatedCollection].
  /// This method should be overridden by subclasses to provide the appropriate parameters for the next page request.
  ListParametersType? buildGetNextPageParameters(List<ListObjectType>? currentPageItems, {int? pageSize}) {
    return filters;
  }
}
