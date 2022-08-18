import 'package:get/get.dart';
import 'package:rest_frontend/data/fixtures/category_fixture.dart';
import 'package:rest_frontend/domain/entities/category.dart';
import 'package:rest_frontend/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryFixture _categoryFixture = Get.find();
  @override
  List<Category> getAllCategories() {
    // #TODO: в зависимости от флажка "деморежим" брать данные или из фикстуры, или
    // из grahql-клиента
    return _categoryFixture.getAllCategories();
  }
}
