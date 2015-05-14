.class public Lco/getair/meerkat/notifications/GcmIntentService;
.super Landroid/app/IntentService;
.source "GcmIntentService.java"


# instance fields
.field builder:Landroid/support/v4/app/NotificationCompat$Builder;

.field private mNotificationManager:Landroid/support/v4/app/NotificationManagerCompat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    const-string v0, "GcmIntentService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method private processNotification(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "notificationBody"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 125
    const/4 v3, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 150
    :goto_1
    return-void

    .line 125
    :sswitch_0
    const-string v4, "UpdateInbox"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :sswitch_1
    const-string v4, "GoLive"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :sswitch_2
    const-string v4, "Banned"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x2

    goto :goto_0

    .line 128
    :pswitch_0
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v3

    const-string v4, "commandGetInbox"

    invoke-virtual {v3, v4, v5, v5}, Lco/getair/meerkat/facades/ApplicationFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1

    .line 133
    :pswitch_1
    const-string v3, "body"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, p2}, Lco/getair/meerkat/notifications/GcmIntentService;->sendNotification(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_1

    .line 139
    :pswitch_2
    new-instance v2, Landroid/content/Intent;

    const-string v3, "notificationDoAuthorize"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 140
    .local v2, "intentDoAuthorize":Landroid/content/Intent;
    new-instance v0, Landroid/content/Intent;

    const-string v3, "notificationDismissWatchScreen"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 141
    .local v0, "intentDismissWatchScreen":Landroid/content/Intent;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "notificationDismissBroadcastScreen"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 143
    .local v1, "intentDismissbBroadcastScreen":Landroid/content/Intent;
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/GcmIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 144
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/GcmIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 145
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/GcmIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    goto :goto_1

    .line 125
    :sswitch_data_0
    .sparse-switch
        0x4002b71d -> :sswitch_0
        0x762a6b3e -> :sswitch_2
        0x7f686a14 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private sendNotification(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 18
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 63
    invoke-static/range {p0 .. p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/getair/meerkat/notifications/GcmIntentService;->mNotificationManager:Landroid/support/v4/app/NotificationManagerCompat;

    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 67
    .local v14, "timestamp":J
    new-instance v11, Lco/getair/meerkat/notifications/PendingNotification;

    move-object/from16 v0, p1

    invoke-direct {v11, v0, v14, v15}, Lco/getair/meerkat/notifications/PendingNotification;-><init>(Ljava/lang/String;J)V

    .line 68
    .local v11, "pendingNotification":Lco/getair/meerkat/notifications/PendingNotification;
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/notifications/GcmIntentService;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/notifications/PendingNotificationsManager;

    move-result-object v12

    .line 69
    .local v12, "pendingNotificationsManager":Lco/getair/meerkat/notifications/PendingNotificationsManager;
    invoke-virtual {v12, v11}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->addNotification(Lco/getair/meerkat/notifications/PendingNotification;)V

    .line 71
    invoke-virtual {v12}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getPendingNotifications()Ljava/util/List;

    move-result-object v5

    .line 73
    .local v5, "groupedPendingNotifications":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/notifications/PendingNotification;>;"
    if-eqz v5, :cond_5

    .line 74
    new-instance v3, Landroid/content/Intent;

    const-class v13, Lco/getair/meerkat/activities/LandingActivity;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v13}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 76
    .local v3, "groupedNotificationsIntent":Landroid/content/Intent;
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v13

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v13, v0, :cond_0

    .line 77
    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 80
    :cond_0
    const/4 v13, 0x0

    const/high16 v16, 0x50000000

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-static {v0, v13, v3, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 84
    .local v10, "pendingGroupedNotificationsIntent":Landroid/app/PendingIntent;
    new-instance v13, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    const v16, 0x7f0201d8

    .line 85
    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    const/16 v16, 0x1

    .line 86
    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 87
    invoke-virtual {v12}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getGroupedNotificationTitle()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v16

    const/4 v13, 0x0

    .line 88
    invoke-interface {v5, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/notifications/PendingNotification;

    invoke-virtual {v13}, Lco/getair/meerkat/notifications/PendingNotification;->getNotificationText()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v13, v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    const/16 v16, 0x2

    .line 90
    invoke-static/range {v16 .. v16}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 91
    invoke-virtual {v13, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v9

    .line 93
    .local v9, "mBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v16, 0x15

    move/from16 v0, v16

    if-lt v13, v0, :cond_1

    .line 94
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/notifications/GcmIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v16, 0x7f0c003b

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    invoke-virtual {v9, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setColor(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 100
    :goto_0
    new-instance v7, Landroid/support/v4/app/NotificationCompat$InboxStyle;

    invoke-direct {v7}, Landroid/support/v4/app/NotificationCompat$InboxStyle;-><init>()V

    .line 101
    .local v7, "inboxStyle":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    invoke-virtual {v12}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getGroupedNotificationTitle()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 103
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v13

    const/16 v16, 0x4

    move/from16 v0, v16

    invoke-static {v13, v0}, Ljava/lang/Math;->min(II)I

    move-result v13

    if-ge v6, v13, :cond_2

    .line 104
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/notifications/PendingNotification;

    .line 105
    .local v4, "groupedPendingNotification":Lco/getair/meerkat/notifications/PendingNotification;
    invoke-virtual {v4}, Lco/getair/meerkat/notifications/PendingNotification;->getNotificationText()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 103
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 96
    .end local v4    # "groupedPendingNotification":Lco/getair/meerkat/notifications/PendingNotification;
    .end local v6    # "i":I
    .end local v7    # "inboxStyle":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/notifications/GcmIntentService;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const/high16 v16, 0x7f030000

    move/from16 v0, v16

    invoke-static {v13, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 97
    .local v8, "largeIcon":Landroid/graphics/Bitmap;
    invoke-virtual {v9, v8}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0

    .line 108
    .end local v8    # "largeIcon":Landroid/graphics/Bitmap;
    .restart local v6    # "i":I
    .restart local v7    # "inboxStyle":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    :cond_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v13

    const/16 v16, 0x4

    move/from16 v0, v16

    if-le v13, v0, :cond_3

    .line 109
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "+"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v16

    add-int/lit8 v16, v16, -0x4

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v16, " more"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/support/v4/app/NotificationCompat$InboxStyle;->addLine(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$InboxStyle;

    .line 112
    :cond_3
    invoke-virtual {v9, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 114
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v13

    const/16 v16, 0x1

    move/from16 v0, v16

    if-le v13, v0, :cond_4

    .line 115
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v13

    invoke-virtual {v9, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 118
    :cond_4
    invoke-virtual {v9}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 119
    .local v2, "groupedNotifications":Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/notifications/GcmIntentService;->mNotificationManager:Landroid/support/v4/app/NotificationManagerCompat;

    invoke-virtual {v12}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getGroupNotificationsId()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v13, v0, v2}, Landroid/support/v4/app/NotificationManagerCompat;->notify(ILandroid/app/Notification;)V

    .line 121
    .end local v2    # "groupedNotifications":Landroid/app/Notification;
    .end local v3    # "groupedNotificationsIntent":Landroid/content/Intent;
    .end local v6    # "i":I
    .end local v7    # "inboxStyle":Landroid/support/v4/app/NotificationCompat$InboxStyle;
    .end local v9    # "mBuilder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v10    # "pendingGroupedNotificationsIntent":Landroid/app/PendingIntent;
    :cond_5
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 40
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 41
    .local v0, "extras":Landroid/os/Bundle;
    invoke-static {p0}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/gcm/GoogleCloudMessaging;

    move-result-object v1

    .line 44
    .local v1, "gcm":Lcom/google/android/gms/gcm/GoogleCloudMessaging;
    invoke-virtual {v1, p1}, Lcom/google/android/gms/gcm/GoogleCloudMessaging;->getMessageType(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v2

    .line 46
    .local v2, "messageType":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 47
    const-string v4, "gcm"

    .line 48
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 50
    const-string v4, "type"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "type":Ljava/lang/String;
    invoke-direct {p0, v3, v0}, Lco/getair/meerkat/notifications/GcmIntentService;->processNotification(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 55
    .end local v3    # "type":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/notifications/GcmBroadcastReceiver;->completeWakefulIntent(Landroid/content/Intent;)Z

    .line 56
    return-void
.end method
