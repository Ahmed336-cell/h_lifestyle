class Recipe{
  String Name;
  String CookTime;
 String PrepTime;
 String TotalTime;
 List<String>RecipeIngredientParts;
 String Calories;

  Recipe({required this.Name,required this.CookTime, required this.PrepTime, required this.TotalTime,
     required this.RecipeIngredientParts,required this.Calories});
}