
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_native/entities/category.dart';
import 'package:inter_native/repo/category_dao.dart';

class CategoryCubit extends Cubit<List<Category>> {
  CategoryCubit() : super(<Category>[]);
  final CategoryDao _categoryDao=CategoryDao();

Future<void> getCategory()async{
  var list=await _categoryDao.getCategory();
  emit(list);
}

}