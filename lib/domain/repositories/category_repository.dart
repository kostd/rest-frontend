import 'package:rest_frontend/domain/entities/category.dart';

abstract class CategoryRepository {
  // #TODO: в будущем должен возвращать stream или future
  List<Category> getAllCategories();
}
