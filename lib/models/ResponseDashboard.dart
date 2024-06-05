class ResponseDashboard {
  List<Notifications>? notification;
  List<Sessions>? sessions;
  List<Banners>? banners;

  ResponseDashboard({this.notification, this.sessions, this.banners});

  ResponseDashboard.fromJson(Map<dynamic, dynamic> json) {
    if (json['notification'] != null) {
      notification = <Notifications>[];
      json['notification'].forEach((v) {
        notification!.add(Notifications.fromJson(v));
      });
    }
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  int? id;
  int? userId;
  int? conversationId;
  int? sender;
  String? type;
  String? slug;
  String? subtype;
  String? status;
  String? receiverType;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Notifications(
      {this.id,
      this.userId,
      this.conversationId,
      this.sender,
      this.type,
      this.slug,
      this.subtype,
      this.status,
      this.receiverType,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Notifications.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    conversationId = json['conversation_id'];
    sender = json['sender'];
    type = json['type'];
    slug = json['slug'];
    subtype = json['subtype'];
    status = json['status'];
    receiverType = json['receiver_type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['conversation_id'] = this.conversationId;
    data['sender'] = this.sender;
    data['type'] = this.type;
    data['slug'] = this.slug;
    data['subtype'] = this.subtype;
    data['status'] = this.status;
    data['receiver_type'] = this.receiverType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class Sessions {
  int? id;
  int? clientId;
  int? coachId;
  String? sessionDate;
  String? sessionTime;
  Null? notes;
  Null? clientNotes;
  String? title;
  Null? subTitle;
  Null? rescheduleSessionDate;
  Null? rescheduleSessionTime;
  Null? rescheduleSessionOn;
  String? sessionId;
  String? status;
  String? sessionFrom;
  String? isDeleted;
  String? createdAt;
  String? updatedAt;
  Null? sessionShare;
  Null? rating;
  String? currentStatus;
  String? sessionWithImage;
  String? sessionWith;

  Sessions(
      {this.id,
      this.clientId,
      this.coachId,
      this.sessionDate,
      this.sessionTime,
      this.notes,
      this.clientNotes,
      this.title,
      this.subTitle,
      this.rescheduleSessionDate,
      this.rescheduleSessionTime,
      this.rescheduleSessionOn,
      this.sessionId,
      this.status,
      this.sessionFrom,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.sessionShare,
      this.rating,
      this.currentStatus,
      this.sessionWithImage,
      this.sessionWith});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    coachId = json['coach_id'];
    sessionDate = json['session_date'];
    sessionTime = json['session_time'];
    notes = json['notes'];
    clientNotes = json['client_notes'];
    title = json['title'];
    subTitle = json['sub_title'];
    rescheduleSessionDate = json['reschedule_session_date'];
    rescheduleSessionTime = json['reschedule_session_time'];
    rescheduleSessionOn = json['reschedule_session_on'];
    sessionId = json['session_id'];
    status = json['status'];
    sessionFrom = json['session_from'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sessionShare = json['session_share'];
    rating = json['rating'];
    currentStatus = json['current_status'];
    sessionWithImage = json['session_with_image'];
    sessionWith = json['session_with'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['coach_id'] = this.coachId;
    data['session_date'] = this.sessionDate;
    data['session_time'] = this.sessionTime;
    data['notes'] = this.notes;
    data['client_notes'] = this.clientNotes;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['reschedule_session_date'] = this.rescheduleSessionDate;
    data['reschedule_session_time'] = this.rescheduleSessionTime;
    data['reschedule_session_on'] = this.rescheduleSessionOn;
    data['session_id'] = this.sessionId;
    data['status'] = this.status;
    data['session_from'] = this.sessionFrom;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['session_share'] = this.sessionShare;
    data['rating'] = this.rating;
    data['current_status'] = this.currentStatus;
    data['session_with_image'] = this.sessionWithImage;
    data['session_with'] = this.sessionWith;
    return data;
  }
}

class Banners {
  String? image;
  int? id;
  String? title;
  String? content;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Banners(
      {this.image,
      this.id,
      this.title,
      this.content,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Banners.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['deletedAt'] = this.deletedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
