import 'package:dishcovery/data/models/recipe_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/repository/repository.dart';
import '../../../data/response_status.dart';
import '../../../utils/service_locator.dart';
import '../base/base_bloc.dart';

class RecipeBloc extends BaseBloc {
  final _repository = serviceLocator<Repository>();

  late PublishSubject<List<RecipeModel>> _recipeListModel;

  Stream<List<RecipeModel>> get recipeListStream => _recipeListModel.stream;

  List<RecipeModel> _recipeList = [];

  getRecipeList() async {
    print("flermpiogheruob");
    ResponseStatus<List<RecipeModel>> responseStatus =
        await _repository.getRecipes();

    if (responseStatus is ResponseSuccess) {
      var model = (responseStatus as ResponseSuccess).data;
      print("BBBBBBBBBBBBBBBBBBB");
      print(model);

      for(RecipeModel recipeModel in model) {
        _recipeList.add(recipeModel);
      }
      _recipeListModel.sink.add(_recipeList);
    }
    if (responseStatus is ResponseError) {
      print("CCCCCCCCCCCCCCCCCC");
      errorModel.sink.add(responseStatus as ResponseError);
    }
  }

  // _indexCoworkersList(List<RecipeModel> list){
  //   String indexLetter = ' ';
  //   String coworkerFirstNameFirstLetter;
  //   List<RecipeModel> newList = [];
  //
  //   for(RecipeModel model in list){
  //     coworkerFirstNameFirstLetter = model.firstName.toUpperCase()[0].toString();
  //
  //     if(coworkerFirstNameFirstLetter != indexLetter){
  //       indexLetter = coworkerFirstNameFirstLetter;
  //       newList.add(RecipeModel.withLetter(indexLetter));
  //     }
  //
  //     newList.add(model);
  //   }
  //
  //   _coworkerList = newList;
  //   _coworkerListModel.sink.add(newList);
  // }

  // saveAccountData() async {
  //   MultipartFile? multipart;
  //   if (newProfileImage != null) {
  //     multipart = await MultipartFile.fromFile(newProfileImage!.path,
  //         contentType: MediaType.parse('multipart/form-data'));
  //   }
  //
  //   ResponseStatus<Object> responseStatus =
  //       await _repository.saveAccountChanges(temporaryAccountData, multipart);
  //
  //   if (responseStatus is ResponseNone) {
  //     newProfileImage = null;
  //     getAccountData();
  //   }
  //
  //   if (responseStatus is ResponseError) {
  //     errorModel.sink.add(responseStatus as ResponseError);
  //   }
  // }

  @override
  initSubjects() {
    super.initSubjects();
    _recipeListModel = PublishSubject<List<RecipeModel>>();
  }

  @override
  dispose() {
    super.dispose();
    _recipeListModel.close();
  }
}
