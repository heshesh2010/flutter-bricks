import "../../../../../core/adapters/dio_adapter.dart";
{{#addTemplateCode}}import "../../models/request/{{name.snakeCase()}}_params.dart";
import "../../models/response/{{name.snakeCase()}}_model.dart";{{/addTemplateCode}}
import 'package:injectable/injectable.dart';
import "../../../../../core/network/api/network_apis_constants.dart";

/// Remote data source for the {{name.pascalCase()}} collection
abstract class {{name.pascalCase()}}RemoteDataSource {

  {{#areCommentsOn}}/*
  A remote data source is responsible for abstracting the API layer from the data layer. 
  The data source's main functions are:
    Data Retrieval: It fetches data from the specified source. This could involve making a network request to an API, querying a database, or reading a file.
    Data Storage: It saves data back to the source. This could involve making a POST request to an API, executing an INSERT query on a database, or writing to a file.
    Data Conversion: It often converts the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}Future<{{name.pascalCase()}}ResponseModel> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  });{{/addTemplateCode}}
  
}

/// Remote data source for the {{name.pascalCase()}} collection
@Injectable(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  /// Remote data source for the {{name.pascalCase()}} collection
 {{name.pascalCase()}}RemoteDataSourceImpl({required this.dio});

  /// Dio adapter instance
  final DioAdapter dio;

  {{#areCommentsOn}}/*
  The remote data source implementation is responsible for making the actual API requests. 
  It is responsible for converting the data into a format that the rest of the application can use. This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */{{/areCommentsOn}}

  {{#addTemplateCode}}@override
  Future<{{name.pascalCase()}}ResponseModel> get{{name.pascalCase()}}({
    required {{name.pascalCase()}}Params {{name.camelCase()}}Params,
  }) async {
    final response = await dio.get(
      ApiConstants.   ,
    
    );

   return {{name.pascalCase()}}ResponseModel.fromJson( response.data);
   
  }{{/addTemplateCode}}
 
}
