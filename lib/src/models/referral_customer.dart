import 'package:easypost/src/api/parameters/v2/referral_customers/list_referral_customers.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'referral_customer.g.dart';

@JsonSerializable(explicitToJson: true)
class ReferralCustomer extends User {
  ReferralCustomer(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    apiKeys,
    balance,
    children,
    email,
    name,
    parentId,
    password,
    passwordConfirmation,
    phoneNumber,
    pricePerShipment,
    rechargeAmount,
    rechargeThreshold,
    secondaryRechargeAmount,
  ) : super(
          id,
          createdAt,
          updatedAt,
          objectType,
          mode,
          apiKeys,
          balance,
          children,
          email,
          name,
          parentId,
          password,
          passwordConfirmation,
          phoneNumber,
          pricePerShipment,
          rechargeAmount,
          rechargeThreshold,
          secondaryRechargeAmount,
        );

  factory ReferralCustomer.fromJson(Map<String, dynamic> input) =>
      _$ReferralCustomerFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ReferralCustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReferralCustomerCollection
    extends PaginatedCollection<ReferralCustomer, ListReferralCustomers> {
  @JsonKey(name: 'referral_customers')
  final List<ReferralCustomer>? referralCustomers;

  ReferralCustomerCollection(id, createdAt, updatedAt, objectType, mode,
      hasMore, this.referralCustomers)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory ReferralCustomerCollection.fromJson(Map<String, dynamic> input) =>
      _$ReferralCustomerCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ReferralCustomerCollectionToJson(this);

  @override
  ListReferralCustomers buildGetNextPageParameters(List<ReferralCustomer>? currentPageItems, {int? pageSize}) {
    ListReferralCustomers parameters = filters ?? ListReferralCustomers();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}
