class Datamodel {
  int? i0;
  String? s1;
  String? s2;
  int? i3;
  int? notesId;
  String? notesTitle;
  String? notesContent;
  int? notesUser;

  Datamodel(
      {this.i0,
      this.s1,
      this.s2,
      this.i3,
      this.notesId,
      this.notesTitle,
      this.notesContent,
      this.notesUser});

  Datamodel.fromJson(Map<String, dynamic> json) {
    i0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    i3 = json['3'];
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesContent = json['notes_content'];
    notesUser = json['notes_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.i0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.i3;
    data['notes_id'] = this.notesId;
    data['notes_title'] = this.notesTitle;
    data['notes_content'] = this.notesContent;
    data['notes_user'] = this.notesUser;
    return data;
  }
}