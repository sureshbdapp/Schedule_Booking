/// success : true
/// data : {"notification":[{"id":1377,"user_id":1,"conversation_id":602,"sender":151,"type":"push","slug":"your session status set as completed by Nickie Froiland","subtype":"session_status","status":"1","receiver_type":"client","createdAt":"2024-05-28T15:23:17.000Z","updatedAt":"2024-05-28T15:23:17.000Z","deletedAt":null},{"id":1360,"user_id":1,"conversation_id":437,"sender":151,"type":"push","slug":"your session status set as completed by Nickie Froiland","subtype":"session_status","status":"1","receiver_type":"client","createdAt":"2024-05-15T18:31:19.000Z","updatedAt":"2024-05-15T18:31:19.000Z","deletedAt":null}],"sessions":[{"id":606,"client_id":1,"coach_id":112,"session_date":"2024-06-03","session_time":"16:30:00","notes":null,"client_notes":null,"title":" Nickie, Eric - 1:1","sub_title":null,"reschedule_session_date":null,"reschedule_session_time":null,"reschedule_session_on":null,"session_id":"AAMkADNkMjk3MGUzLWRmYjYtNDg1OC1iNjQ4LWQ1Y2JiYTY5N2VkMgFRAAgI3INgHJ5AAEYAAAAAPUCemVtImUGaMTqVrOc_RQcAQWSDYfMF5UiFkKQpPJlv7wAAAAABDQAAQWSDYfMF5UiFkKQpPJlv7wACyyT6FAAAEA==","status":"completed","session_from":"sync","is_deleted":"0","createdAt":"2024-05-02T22:03:30.000Z","updatedAt":"2024-06-03T18:23:00.000Z","session_share":null,"rating":null,"current_status":"past","session_with_image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1700604856170.png","session_with":"Nickie Froiland"},{"id":609,"client_id":1,"coach_id":112,"session_date":"2024-06-10","session_time":"16:30:00","notes":null,"client_notes":null,"title":" Nickie, Eric - 1:1","sub_title":null,"reschedule_session_date":null,"reschedule_session_time":null,"reschedule_session_on":null,"session_id":"AAMkADNkMjk3MGUzLWRmYjYtNDg1OC1iNjQ4LWQ1Y2JiYTY5N2VkMgFRAAgI3IjgRYKAAEYAAAAAPUCemVtImUGaMTqVrOc_RQcAQWSDYfMF5UiFkKQpPJlv7wAAAAABDQAAQWSDYfMF5UiFkKQpPJlv7wACyyT6FAAAEA==","status":"upcoming","session_from":"sync","is_deleted":"0","createdAt":"2024-05-02T22:03:30.000Z","updatedAt":"2024-05-02T22:03:30.000Z","session_share":null,"rating":null,"current_status":"upcoming","session_with_image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1700604856170.png","session_with":"Nickie Froiland"}],"banners":[{"image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1698841065084.png","id":1,"title":"Your Further Faster Journey Begins Here!","content":"!","deletedAt":null,"createdAt":"2023-11-01T12:17:46.000Z","updatedAt":"2023-11-21T22:49:37.000Z"},{"image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1700606924745.jpeg","id":2,"title":"What can you let go of today?","content":"!","deletedAt":null,"createdAt":"2023-11-16T10:30:35.000Z","updatedAt":"2023-11-21T22:48:45.000Z"}]}
/// message : "Data fetched"

class PluginModel {
  PluginModel({
    bool? success,
    Data? data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  PluginModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  String? _message;
  PluginModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      PluginModel(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// notification : [{"id":1377,"user_id":1,"conversation_id":602,"sender":151,"type":"push","slug":"your session status set as completed by Nickie Froiland","subtype":"session_status","status":"1","receiver_type":"client","createdAt":"2024-05-28T15:23:17.000Z","updatedAt":"2024-05-28T15:23:17.000Z","deletedAt":null},{"id":1360,"user_id":1,"conversation_id":437,"sender":151,"type":"push","slug":"your session status set as completed by Nickie Froiland","subtype":"session_status","status":"1","receiver_type":"client","createdAt":"2024-05-15T18:31:19.000Z","updatedAt":"2024-05-15T18:31:19.000Z","deletedAt":null}]
/// sessions : [{"id":606,"client_id":1,"coach_id":112,"session_date":"2024-06-03","session_time":"16:30:00","notes":null,"client_notes":null,"title":" Nickie, Eric - 1:1","sub_title":null,"reschedule_session_date":null,"reschedule_session_time":null,"reschedule_session_on":null,"session_id":"AAMkADNkMjk3MGUzLWRmYjYtNDg1OC1iNjQ4LWQ1Y2JiYTY5N2VkMgFRAAgI3INgHJ5AAEYAAAAAPUCemVtImUGaMTqVrOc_RQcAQWSDYfMF5UiFkKQpPJlv7wAAAAABDQAAQWSDYfMF5UiFkKQpPJlv7wACyyT6FAAAEA==","status":"completed","session_from":"sync","is_deleted":"0","createdAt":"2024-05-02T22:03:30.000Z","updatedAt":"2024-06-03T18:23:00.000Z","session_share":null,"rating":null,"current_status":"past","session_with_image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1700604856170.png","session_with":"Nickie Froiland"},{"id":609,"client_id":1,"coach_id":112,"session_date":"2024-06-10","session_time":"16:30:00","notes":null,"client_notes":null,"title":" Nickie, Eric - 1:1","sub_title":null,"reschedule_session_date":null,"reschedule_session_time":null,"reschedule_session_on":null,"session_id":"AAMkADNkMjk3MGUzLWRmYjYtNDg1OC1iNjQ4LWQ1Y2JiYTY5N2VkMgFRAAgI3IjgRYKAAEYAAAAAPUCemVtImUGaMTqVrOc_RQcAQWSDYfMF5UiFkKQpPJlv7wAAAAABDQAAQWSDYfMF5UiFkKQpPJlv7wACyyT6FAAAEA==","status":"upcoming","session_from":"sync","is_deleted":"0","createdAt":"2024-05-02T22:03:30.000Z","updatedAt":"2024-05-02T22:03:30.000Z","session_share":null,"rating":null,"current_status":"upcoming","session_with_image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1700604856170.png","session_with":"Nickie Froiland"}]
/// banners : [{"image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1698841065084.png","id":1,"title":"Your Further Faster Journey Begins Here!","content":"!","deletedAt":null,"createdAt":"2023-11-01T12:17:46.000Z","updatedAt":"2023-11-21T22:49:37.000Z"},{"image":"https://motus9.s3.us-east-1.amazonaws.com/motus9/1700606924745.jpeg","id":2,"title":"What can you let go of today?","content":"!","deletedAt":null,"createdAt":"2023-11-16T10:30:35.000Z","updatedAt":"2023-11-21T22:48:45.000Z"}]

class Data {
  Data({
    List<Notification>? notification,
    List<Sessions>? sessions,
    List<Banners>? banners,
  }) {
    _notification = notification;
    _sessions = sessions;
    _banners = banners;
  }

  Data.fromJson(dynamic json) {
    if (json['notification'] != null) {
      _notification = [];
      json['notification'].forEach((v) {
        _notification?.add(Notification.fromJson(v));
      });
    }
    if (json['sessions'] != null) {
      _sessions = [];
      json['sessions'].forEach((v) {
        _sessions?.add(Sessions.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      _banners = [];
      json['banners'].forEach((v) {
        _banners?.add(Banners.fromJson(v));
      });
    }
  }
  List<Notification>? _notification;
  List<Sessions>? _sessions;
  List<Banners>? _banners;
  Data copyWith({
    List<Notification>? notification,
    List<Sessions>? sessions,
    List<Banners>? banners,
  }) =>
      Data(
        notification: notification ?? _notification,
        sessions: sessions ?? _sessions,
        banners: banners ?? _banners,
      );
  List<Notification>? get notification => _notification;
  List<Sessions>? get sessions => _sessions;
  List<Banners>? get banners => _banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_notification != null) {
      map['notification'] = _notification?.map((v) => v.toJson()).toList();
    }
    if (_sessions != null) {
      map['sessions'] = _sessions?.map((v) => v.toJson()).toList();
    }
    if (_banners != null) {
      map['banners'] = _banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// image : "https://motus9.s3.us-east-1.amazonaws.com/motus9/1698841065084.png"
/// id : 1
/// title : "Your Further Faster Journey Begins Here!"
/// content : "!"
/// deletedAt : null
/// createdAt : "2023-11-01T12:17:46.000Z"
/// updatedAt : "2023-11-21T22:49:37.000Z"

class Banners {
  Banners({
    String? image,
    num? id,
    String? title,
    String? content,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    _image = image;
    _id = id;
    _title = title;
    _content = content;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Banners.fromJson(dynamic json) {
    _image = json['image'];
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _deletedAt = json['deletedAt'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _image;
  num? _id;
  String? _title;
  String? _content;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  Banners copyWith({
    String? image,
    num? id,
    String? title,
    String? content,
    dynamic deletedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Banners(
        image: image ?? _image,
        id: id ?? _id,
        title: title ?? _title,
        content: content ?? _content,
        deletedAt: deletedAt ?? _deletedAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  String? get image => _image;
  num? get id => _id;
  String? get title => _title;
  String? get content => _content;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    map['deletedAt'] = _deletedAt;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

/// id : 606
/// client_id : 1
/// coach_id : 112
/// session_date : "2024-06-03"
/// session_time : "16:30:00"
/// notes : null
/// client_notes : null
/// title : " Nickie, Eric - 1:1"
/// sub_title : null
/// reschedule_session_date : null
/// reschedule_session_time : null
/// reschedule_session_on : null
/// session_id : "AAMkADNkMjk3MGUzLWRmYjYtNDg1OC1iNjQ4LWQ1Y2JiYTY5N2VkMgFRAAgI3INgHJ5AAEYAAAAAPUCemVtImUGaMTqVrOc_RQcAQWSDYfMF5UiFkKQpPJlv7wAAAAABDQAAQWSDYfMF5UiFkKQpPJlv7wACyyT6FAAAEA=="
/// status : "completed"
/// session_from : "sync"
/// is_deleted : "0"
/// createdAt : "2024-05-02T22:03:30.000Z"
/// updatedAt : "2024-06-03T18:23:00.000Z"
/// session_share : null
/// rating : null
/// current_status : "past"
/// session_with_image : "https://motus9.s3.us-east-1.amazonaws.com/motus9/1700604856170.png"
/// session_with : "Nickie Froiland"

class Sessions {
  Sessions({
    num? id,
    num? clientId,
    num? coachId,
    String? sessionDate,
    String? sessionTime,
    dynamic notes,
    dynamic clientNotes,
    String? title,
    dynamic subTitle,
    dynamic rescheduleSessionDate,
    dynamic rescheduleSessionTime,
    dynamic rescheduleSessionOn,
    String? sessionId,
    String? status,
    String? sessionFrom,
    String? isDeleted,
    String? createdAt,
    String? updatedAt,
    dynamic sessionShare,
    dynamic rating,
    String? currentStatus,
    String? sessionWithImage,
    String? sessionWith,
  }) {
    _id = id;
    _clientId = clientId;
    _coachId = coachId;
    _sessionDate = sessionDate;
    _sessionTime = sessionTime;
    _notes = notes;
    _clientNotes = clientNotes;
    _title = title;
    _subTitle = subTitle;
    _rescheduleSessionDate = rescheduleSessionDate;
    _rescheduleSessionTime = rescheduleSessionTime;
    _rescheduleSessionOn = rescheduleSessionOn;
    _sessionId = sessionId;
    _status = status;
    _sessionFrom = sessionFrom;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _sessionShare = sessionShare;
    _rating = rating;
    _currentStatus = currentStatus;
    _sessionWithImage = sessionWithImage;
    _sessionWith = sessionWith;
  }

  Sessions.fromJson(dynamic json) {
    _id = json['id'];
    _clientId = json['client_id'];
    _coachId = json['coach_id'];
    _sessionDate = json['session_date'];
    _sessionTime = json['session_time'];
    _notes = json['notes'];
    _clientNotes = json['client_notes'];
    _title = json['title'];
    _subTitle = json['sub_title'];
    _rescheduleSessionDate = json['reschedule_session_date'];
    _rescheduleSessionTime = json['reschedule_session_time'];
    _rescheduleSessionOn = json['reschedule_session_on'];
    _sessionId = json['session_id'];
    _status = json['status'];
    _sessionFrom = json['session_from'];
    _isDeleted = json['is_deleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _sessionShare = json['session_share'];
    _rating = json['rating'];
    _currentStatus = json['current_status'];
    _sessionWithImage = json['session_with_image'];
    _sessionWith = json['session_with'];
  }
  num? _id;
  num? _clientId;
  num? _coachId;
  String? _sessionDate;
  String? _sessionTime;
  dynamic _notes;
  dynamic _clientNotes;
  String? _title;
  dynamic _subTitle;
  dynamic _rescheduleSessionDate;
  dynamic _rescheduleSessionTime;
  dynamic _rescheduleSessionOn;
  String? _sessionId;
  String? _status;
  String? _sessionFrom;
  String? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  dynamic _sessionShare;
  dynamic _rating;
  String? _currentStatus;
  String? _sessionWithImage;
  String? _sessionWith;
  Sessions copyWith({
    num? id,
    num? clientId,
    num? coachId,
    String? sessionDate,
    String? sessionTime,
    dynamic notes,
    dynamic clientNotes,
    String? title,
    dynamic subTitle,
    dynamic rescheduleSessionDate,
    dynamic rescheduleSessionTime,
    dynamic rescheduleSessionOn,
    String? sessionId,
    String? status,
    String? sessionFrom,
    String? isDeleted,
    String? createdAt,
    String? updatedAt,
    dynamic sessionShare,
    dynamic rating,
    String? currentStatus,
    String? sessionWithImage,
    String? sessionWith,
  }) =>
      Sessions(
        id: id ?? _id,
        clientId: clientId ?? _clientId,
        coachId: coachId ?? _coachId,
        sessionDate: sessionDate ?? _sessionDate,
        sessionTime: sessionTime ?? _sessionTime,
        notes: notes ?? _notes,
        clientNotes: clientNotes ?? _clientNotes,
        title: title ?? _title,
        subTitle: subTitle ?? _subTitle,
        rescheduleSessionDate: rescheduleSessionDate ?? _rescheduleSessionDate,
        rescheduleSessionTime: rescheduleSessionTime ?? _rescheduleSessionTime,
        rescheduleSessionOn: rescheduleSessionOn ?? _rescheduleSessionOn,
        sessionId: sessionId ?? _sessionId,
        status: status ?? _status,
        sessionFrom: sessionFrom ?? _sessionFrom,
        isDeleted: isDeleted ?? _isDeleted,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        sessionShare: sessionShare ?? _sessionShare,
        rating: rating ?? _rating,
        currentStatus: currentStatus ?? _currentStatus,
        sessionWithImage: sessionWithImage ?? _sessionWithImage,
        sessionWith: sessionWith ?? _sessionWith,
      );
  num? get id => _id;
  num? get clientId => _clientId;
  num? get coachId => _coachId;
  String? get sessionDate => _sessionDate;
  String? get sessionTime => _sessionTime;
  dynamic get notes => _notes;
  dynamic get clientNotes => _clientNotes;
  String? get title => _title;
  dynamic get subTitle => _subTitle;
  dynamic get rescheduleSessionDate => _rescheduleSessionDate;
  dynamic get rescheduleSessionTime => _rescheduleSessionTime;
  dynamic get rescheduleSessionOn => _rescheduleSessionOn;
  String? get sessionId => _sessionId;
  String? get status => _status;
  String? get sessionFrom => _sessionFrom;
  String? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get sessionShare => _sessionShare;
  dynamic get rating => _rating;
  String? get currentStatus => _currentStatus;
  String? get sessionWithImage => _sessionWithImage;
  String? get sessionWith => _sessionWith;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['client_id'] = _clientId;
    map['coach_id'] = _coachId;
    map['session_date'] = _sessionDate;
    map['session_time'] = _sessionTime;
    map['notes'] = _notes;
    map['client_notes'] = _clientNotes;
    map['title'] = _title;
    map['sub_title'] = _subTitle;
    map['reschedule_session_date'] = _rescheduleSessionDate;
    map['reschedule_session_time'] = _rescheduleSessionTime;
    map['reschedule_session_on'] = _rescheduleSessionOn;
    map['session_id'] = _sessionId;
    map['status'] = _status;
    map['session_from'] = _sessionFrom;
    map['is_deleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['session_share'] = _sessionShare;
    map['rating'] = _rating;
    map['current_status'] = _currentStatus;
    map['session_with_image'] = _sessionWithImage;
    map['session_with'] = _sessionWith;
    return map;
  }
}

/// id : 1377
/// user_id : 1
/// conversation_id : 602
/// sender : 151
/// type : "push"
/// slug : "your session status set as completed by Nickie Froiland"
/// subtype : "session_status"
/// status : "1"
/// receiver_type : "client"
/// createdAt : "2024-05-28T15:23:17.000Z"
/// updatedAt : "2024-05-28T15:23:17.000Z"
/// deletedAt : null

class Notification {
  Notification({
    num? id,
    num? userId,
    num? conversationId,
    num? sender,
    String? type,
    String? slug,
    String? subtype,
    String? status,
    String? receiverType,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    _id = id;
    _userId = userId;
    _conversationId = conversationId;
    _sender = sender;
    _type = type;
    _slug = slug;
    _subtype = subtype;
    _status = status;
    _receiverType = receiverType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
  }

  Notification.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _conversationId = json['conversation_id'];
    _sender = json['sender'];
    _type = json['type'];
    _slug = json['slug'];
    _subtype = json['subtype'];
    _status = json['status'];
    _receiverType = json['receiver_type'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
  }
  num? _id;
  num? _userId;
  num? _conversationId;
  num? _sender;
  String? _type;
  String? _slug;
  String? _subtype;
  String? _status;
  String? _receiverType;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  Notification copyWith({
    num? id,
    num? userId,
    num? conversationId,
    num? sender,
    String? type,
    String? slug,
    String? subtype,
    String? status,
    String? receiverType,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) =>
      Notification(
        id: id ?? _id,
        userId: userId ?? _userId,
        conversationId: conversationId ?? _conversationId,
        sender: sender ?? _sender,
        type: type ?? _type,
        slug: slug ?? _slug,
        subtype: subtype ?? _subtype,
        status: status ?? _status,
        receiverType: receiverType ?? _receiverType,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        deletedAt: deletedAt ?? _deletedAt,
      );
  num? get id => _id;
  num? get userId => _userId;
  num? get conversationId => _conversationId;
  num? get sender => _sender;
  String? get type => _type;
  String? get slug => _slug;
  String? get subtype => _subtype;
  String? get status => _status;
  String? get receiverType => _receiverType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['conversation_id'] = _conversationId;
    map['sender'] = _sender;
    map['type'] = _type;
    map['slug'] = _slug;
    map['subtype'] = _subtype;
    map['status'] = _status;
    map['receiver_type'] = _receiverType;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['deletedAt'] = _deletedAt;
    return map;
  }
}
