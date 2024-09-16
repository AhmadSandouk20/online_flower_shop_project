class Review {
  late String dateOfReview;
  late String reviewrUserName;
  late String comment;
  late double reviewDegree;

  Review({
    required this.comment,
    required this.dateOfReview,
    required this.reviewDegree,
    required this.reviewrUserName,
  });

  Review.fromJson(data) {
    comment = data["comment"];
    dateOfReview = data["dateOfReview"];
    reviewDegree = data["reviewDegree"];
    reviewrUserName = data["reviewrUserName"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["comment"] = comment;
    data["dateOfReview"] = dateOfReview;
    data["reviewDegree"] = reviewDegree;
    data["reviewrUserName"] = reviewrUserName;

    return data;
  }
}
