import 'package:newsapp_1/model/category_model.dart';

List<CategoryModel> getCategory(){
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.image="images/business.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.image="images/entertainment.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.image="images/general.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image="images/health.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.image="images/science.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  
  categoryModel.categoryName = "Sport";
  categoryModel.image="images/sport.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  
  return category;
  }