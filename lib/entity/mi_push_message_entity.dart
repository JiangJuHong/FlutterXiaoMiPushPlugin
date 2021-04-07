class MiPushMessageEntity {
  final bool? arrivedMessage;
  final String? content;
  final String? description;
  final MiPushMessageExtra? extra;
  final String? messageId;
  final int? messageType;
  final bool? notified;
  final int? notifyId;
  final int? notifyType;
  final int? passThrough;
  final String? title;

  MiPushMessageEntity({
    this.arrivedMessage,
    this.content,
    this.description,
    this.extra,
    this.messageId,
    this.messageType,
    this.notified,
    this.notifyId,
    this.notifyType,
    this.passThrough,
    this.title,
  });

  factory MiPushMessageEntity.fromJson(Map<String, dynamic> json) {
    return MiPushMessageEntity(
      arrivedMessage: json['arrivedMessage'],
      content: json['content'],
      description: json['description'],
      extra: json['extra'] == null
          ? null
          : MiPushMessageExtra.fromJson(json['extra']),
      messageId: json['messageId'],
      messageType: json['messageType'],
      notified: json['notified'],
      notifyId: json['notifyId'],
      notifyType: json['notifyType'],
      passThrough: json['passThrough'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'arrivedMessage': arrivedMessage,
        'content': content,
        'description': description,
        'extra': extra == null ? null : extra!.toJson(),
        'messageId': messageId,
        'messageType': messageType,
        'notified': notified,
        'notifyId': notifyId,
        'notifyType': notifyType,
        'passThrough': passThrough,
        'title': title,
      };
}

class MiPushMessageExtra {
  final String? highPriorityEvent;
  final String? feTs;
  final String? planId;
  final String? source;
  final String? notifyForeground;
  final String? mTs;

  MiPushMessageExtra({
    this.highPriorityEvent,
    this.feTs,
    this.planId,
    this.source,
    this.notifyForeground,
    this.mTs,
  });

  factory MiPushMessageExtra.fromJson(Map<String, dynamic> json) {
    return MiPushMessageExtra(
      highPriorityEvent: json['high_priority_event'],
      feTs: json['fe_ts'],
      planId: json['__planId__'],
      source: json['source'],
      notifyForeground: json['notify_foreground'],
      mTs: json['__m_ts'],
    );
  }

  Map<String, dynamic> toJson() => {
        'high_priority_event': highPriorityEvent,
        'fe_ts': feTs,
        '__planId__': planId,
        'source': source,
        'notify_foreground': notifyForeground,
        '__m_ts': mTs,
      };
}
