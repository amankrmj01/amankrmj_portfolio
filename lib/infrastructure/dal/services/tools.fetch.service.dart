import 'package:portfolio/domain/models/tools_model/tools.model.dart';
import 'abstract.fetch.service.dart';

class ToolsFetchService extends FetchService<ToolsModel> {
  ToolsFetchService() : super('tools', (json) => ToolsModel.fromJson(json));
}
