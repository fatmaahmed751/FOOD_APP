class DessertsModel{
 final  String image;
 final String name;
 final double rate;
 final String categoryName;

  DessertsModel({
    required this.image, required this.name, required this.rate,required this.categoryName});
 factory DessertsModel.fromJson(Map<String ,dynamic> json){
  return DessertsModel(
      image : json['image'],
    name : json['name'],
    rate : json['rate'],
    categoryName : json['category_name'],
  );
  }
}