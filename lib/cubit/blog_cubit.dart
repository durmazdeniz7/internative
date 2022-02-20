

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_native/entities/blog.dart';
import 'package:inter_native/repo/blog_dao.dart';

class BlogCubit extends Cubit<List<Blog>> {
  BlogCubit() : super(<Blog>[]);
final BlogDao _blogDao=BlogDao();

Future<void> getBlog()async{
  var list=await _blogDao.getBlog();
  emit(list);
}
Future<void> getBlogWithCagetoyId(String categoryId)async{
  var list=await _blogDao.getBlogWithCagetoyId(categoryId);
  emit(list);

}
  
  
}