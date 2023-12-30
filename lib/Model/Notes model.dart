class NotesModels {
  int? notesId;
  String? notesTitle;
  String? notesContent;
  int? notesUser;

  NotesModels(
      {this.notesId, this.notesTitle, this.notesContent, this.notesUser});

  NotesModels.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesContent = json['notes_content'];
    notesUser = json['notes_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_id'] = this.notesId;
    data['notes_title'] = this.notesTitle;
    data['notes_content'] = this.notesContent;
    data['notes_user'] = this.notesUser;
    return data;
  }
}