class AiModel {
  final String id;
  final int created;
  final String root;

  AiModel({
    required this.id,
    required this.root,
    required this.created,
  });

  factory AiModel.fromJson(Map<String, dynamic> json) => AiModel(
    id: json["id"],
    root: json["root"],
    created: json["created"],
  );

  static List<AiModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => AiModel.fromJson(data)).toList();
  }
}