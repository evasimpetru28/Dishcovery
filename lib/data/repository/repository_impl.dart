import 'package:dio/dio.dart';
import 'package:dishcovery/data/models/recipe_model.dart';
import 'package:dishcovery/data/repository/repository.dart';

import '../../utils/log_utils.dart';
import '../response_status.dart';
import 'base_repository.dart';

class RepositoryImpl extends BaseRepository implements Repository {
  @override
  set internetErrorStream(Stream<ResponseError> _internetErrorStream) {
    internetErrorStream;
  }

  @override
  set authorisationErrorStream(Stream _authorisationErrorStream) {
    authorisationErrorStream;
  }

  @override
  Future<ResponseStatus<List<RecipeModel>>> getRecipes() async {
    print("AAAIDHJVBFHBQEDOJLFCVBQUIH");
    try {
      var response = await apiService.getRecipes();

      List<RecipeModel> recipes = List.empty(growable: true);
      var data = response.data;

      if (data != null) {
        data.forEach((key, value) {
          print(key + " " + value);
          recipes.add(RecipeModel.fromJson(value));
        });
        return ResponseSuccess(recipes);
      }
      return ResponseNone();
    } on DioException catch (error) {
      return getResponseError(error);
    } on Error catch (error) {
      sendLog(LogUtils().convertErrorToLog(error));
      return ResponseError();
    }
  }
}
