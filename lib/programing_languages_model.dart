// To parse this JSON data, do
//
//     final programmingLanguageList = programmingLanguageListFromJson(jsonString);

import 'dart:convert';

ProgrammingLanguageList programmingLanguageListFromJson(String str) =>
    ProgrammingLanguageList.fromJson(json.decode(str));

String programmingLanguageListToJson(ProgrammingLanguageList data) =>
    json.encode(data.toJson());

class ProgrammingLanguageList {
  ProgrammingLanguageList({
    this.programmingLanguages,
  });

  ProgrammingLanguages programmingLanguages;

  factory ProgrammingLanguageList.fromJson(Map<String, dynamic> json) =>
      ProgrammingLanguageList(
        programmingLanguages:
            ProgrammingLanguages.fromJson(json["programmingLanguages"]),
      );

  Map<String, dynamic> toJson() => {
        "programmingLanguages": programmingLanguages.toJson(),
      };
}

class ProgrammingLanguages {
  ProgrammingLanguages({
    this.edges,
  });

  List<Edge> edges;

  factory ProgrammingLanguages.fromJson(Map<String, dynamic> json) =>
      ProgrammingLanguages(
        edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class Edge {
  Edge({
    this.node,
  });

  Node node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class Node {
  Node({
    this.id,
    this.name,
    this.stronglyTyped,
  });

  String id;
  String name;
  bool stronglyTyped;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        name: json["name"],
        stronglyTyped: json["stronglyTyped"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stronglyTyped": stronglyTyped,
      };
}
