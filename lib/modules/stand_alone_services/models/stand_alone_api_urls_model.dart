class StandAloneApiUrlsModel {
  const StandAloneApiUrlsModel({
    required this.dashboardApi,
    required this.getStandAlonPackagesApi,
    required this.addCartApi,
  });

  final ApiPathQueryModel dashboardApi;
  final ApiPathQueryModel getStandAlonPackagesApi;
  final ApiPathQueryModel addCartApi;
}

class ApiPathQueryModel {
  const ApiPathQueryModel({required this.path, this.queryParams});

  final String path;
  final Map<String, String>? queryParams;
}
