.class public Lco/getair/meerkat/notifications/PendingNotificationBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PendingNotificationBroadcastReceiver.java"


# static fields
.field public static final EXTRA_BROADCASTER_HANDLE:Ljava/lang/String; = "broadcasterHandle"

.field private static final SCHEDULED_BROADCAST_NOTIFICATION_ID:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static createPendingNotificationIntent(Landroid/content/Context;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)Landroid/app/PendingIntent;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .prologue
    const/4 v4, 0x0

    .line 27
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/notifications/PendingNotificationBroadcastReceiver;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "broadcasterHandle"

    .line 28
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getTwitterHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 30
    .local v0, "notificationIntent":Landroid/content/Intent;
    invoke-static {p0, v4, v0, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 36
    const-string v5, "broadcasterHandle"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "broadcasterUsername":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-class v5, Lco/getair/meerkat/activities/FeedActivity;

    invoke-direct {v2, p1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 39
    .local v2, "feedIntent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x7f030000

    invoke-static {v5, v6}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 41
    .local v3, "largeIcon":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/app/Notification$Builder;

    invoke-direct {v5, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 42
    invoke-virtual {v5, v7}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 43
    invoke-virtual {v5, v3}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v5

    const v6, 0x7f0201d8

    .line 44
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v5

    const-string v6, "Meerkat"

    .line 45
    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    const-string v6, "%s\'s stream is about to start"

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v8

    .line 46
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v5

    .line 47
    invoke-static {p1, v8, v2, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 49
    .local v1, "builder":Landroid/app/Notification$Builder;
    const-string v5, "notification"

    .line 50
    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/NotificationManager;

    .line 52
    .local v4, "notificationManager":Landroid/app/NotificationManager;
    const/4 v5, 0x2

    invoke-virtual {v1}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 53
    return-void
.end method
