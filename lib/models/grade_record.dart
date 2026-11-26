class GradeRecord {
  final String id;
  final String studentId;
  final String subject;
  final double score;
  final double maxScore;
  final String term;

  GradeRecord({
    required this.id,
    required this.studentId,
    required this.subject,
    required this.score,
    required this.maxScore,
    required this.term,
  });

  factory GradeRecord.fromJson(Map<String, dynamic> json) {
    return GradeRecord(
      id: json['id'] ?? '',
      studentId: json['student_id'] ?? '',
      subject: json['subject'] ?? 'Subject',
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      maxScore: (json['max_score'] as num?)?.toDouble() ?? 100.0,
      term: json['term'] ?? 'Term 1',
    );
  }
}