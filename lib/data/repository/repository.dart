import 'package:dishcovery/data/models/recipe_model.dart';

import '../response_status.dart';

abstract class Repository {
  Future<ResponseStatus<List<RecipeModel>>> getRecipes();
}
