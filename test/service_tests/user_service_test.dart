import 'package:easypost/easypost.dart';
import 'package:easypost/src/constants.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'user_service_test.reflectable.dart';

void main() {
  group('Users', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create child user', () async {
      Client client = TestUtils.setUpVCRClient("users", "create_child_user");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      expect(user, isNotNull);
      expect(user, isA<User>());
      expect(user.id, isNotNull);

      await client.users.deleteChildUser(user.id);
    });

    test('retrieve child user', () async {
      Client client = TestUtils.setUpVCRClient("users", "retrieve_child_user");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final retrievedUser = await client.users.retrieveChildUser(user.id);

      expect(retrievedUser, isNotNull);
      expect(retrievedUser, isA<User>());
      expect(retrievedUser.id, user.id);

      await client.users.deleteChildUser(user.id);
    });

    test('retrieve self', () async {
      Client client = TestUtils.setUpVCRClient("users", "retrieve_self");
      client.enableProductionMode();

      final user = await client.users.retrieveMe();

      expect(user, isNotNull);
      expect(user, isA<User>());
      expect(user.id, isNotNull);
    });

    test('list all child users', () async {
      Client client = TestUtils.setUpVCRClient("users", "list_child_users");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final listChildUsersParams = ListChildUsers();

      final childUserCollection = await client.users.listChildUsers(parameters: listChildUsersParams);

      expect(childUserCollection, isNotNull);
      expect(childUserCollection, isA<ChildUserCollection>());

      await client.users.deleteChildUser(user.id);
    });

    test('get next page of child users', () async {
      Client client = TestUtils.setUpVCRClient("users", "get_next_page_of_child_users");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final listChildUsersParams = ListChildUsers();

      final childUserCollection = await client.users.listChildUsers(parameters: listChildUsersParams);

      try {
        // Test the next page if it exists
        final nextPage = await client.users.getNextPageOfChildUsers(childUserCollection);
        expect(nextPage, isNotNull);
        expect(nextPage, isA<ChildUserCollection>());
        expect(nextPage.children!.length > 0, true);
        expect(nextPage.children![0].id, startsWith(ModelPrefixes.user));
      } on PaginationException catch (e) {
        // If there is no next page, the exception will be caught here
        expect(e, isA<PaginationException>());
        expect(e.message, ErrorMessages.noMorePagesToRetrieve);
      }

      await client.users.deleteChildUser(user.id);
    });

    test('delete child user', () async {
      Client client = TestUtils.setUpVCRClient("users", "delete_child_user");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final success = await client.users.deleteChildUser(user.id);

      expect(success, true);
    });

    test('update child user', () async {
      Client client = TestUtils.setUpVCRClient("users", "update_child_user");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final updateUserParams = UpdateUser();
      updateUserParams.name = "Updated Name";

      final updatedUser = await client.users.updateUser(user.id, updateUserParams);

      expect(updatedUser, isNotNull);
      expect(updatedUser, isA<User>());
      expect(updatedUser.id, user.id);
      expect(updatedUser.name, updateUserParams.name);

      await client.users.deleteChildUser(user.id);
    });

    test('update self', () async {
      Client client = TestUtils.setUpVCRClient("users", "update_self");
      client.enableProductionMode();

      final updateUserParams = UpdateUser();
      updateUserParams.name = "Updated Name";

      final updatedUser = await client.users.updateMe(updateUserParams);

      expect(updatedUser, isNotNull);
      expect(updatedUser, isA<User>());
      expect(updatedUser.id, isNotNull);
      expect(updatedUser.name, updateUserParams.name);
    });

    test('retrieve user brand', () async {
      Client client = TestUtils.setUpVCRClient("users", "retrieve_user_brand");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final brand = await client.users.retrieveBrand(user.id);

      expect(brand, isNotNull);
      expect(brand, isA<Brand>());

      await client.users.deleteChildUser(user.id);
    });

    test('update user brand', () async {
      Client client = TestUtils.setUpVCRClient("users", "update_user_brand");
      client.enableProductionMode();

      final createUserParams = Fixtures.createChildUser;

      final user = await client.users.createChildUser(createUserParams);

      final updateBrandParams = UpdateBrand();
      updateBrandParams.colorHexCode = "#000000";

      final updatedBrand = await client.users.updateBrand(user.id, updateBrandParams);

      expect(updatedBrand, isNotNull);
      expect(updatedBrand, isA<Brand>());
      expect(updatedBrand.colorHexCode, updateBrandParams.colorHexCode);

      await client.users.deleteChildUser(user.id);
    });
  });
}
