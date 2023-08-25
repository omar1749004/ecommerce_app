class CetegoriesModel {
  int cId ;
  String cName;
  String cArName;
  String cImageNmae ;
   String cCreat ;
   CetegoriesModel({
    required this.cCreat,
    required this.cId,
    required this.cName,
    required this.cArName,required this.cImageNmae});
  factory CetegoriesModel.fromjsone(dynamic data)
  {
   
    return CetegoriesModel(
      cCreat: data["categories_creat"],
      cId:data["categories_id"],
    cName:data["categories_name"],
    cArName: data["categories_name_ar"],
    cImageNmae: data["categories_image"]
    );
   
    
  }
}
