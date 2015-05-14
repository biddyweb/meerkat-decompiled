.class public Lco/getair/meerkat/ScheduledBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ScheduledBroadcastReceiver.java"


# static fields
.field public static final BROADCAST_ID_KEY:Ljava/lang/String; = "broadcastNameKey"

.field public static final BROADCAST_NAME_KEY:Ljava/lang/String; = "broadcastIdNameKey"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 22
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x0

    .line 28
    const-string v6, "broadcastIdNameKey"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "broadcastName":Ljava/lang/String;
    const-string v6, "broadcastNameKey"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "broadcastId":Ljava/lang/String;
    const-string v6, "notification"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/NotificationManager;

    .line 33
    .local v4, "mNotificationManager":Landroid/app/NotificationManager;
    new-instance v5, Landroid/content/Intent;

    const-class v6, Lco/getair/meerkat/activities/WatchActivity;

    invoke-direct {v5, p1, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 34
    .local v5, "newIntent":Landroid/content/Intent;
    const-string v6, "broadcastNameKey"

    invoke-virtual {p2, v6, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    const/high16 v6, 0x20000000

    invoke-virtual {p2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 36
    invoke-static {}, Lco/getair/meerkat/utilities/RandomInt;->getInt()I

    move-result v6

    invoke-static {p1, v6, v5, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 38
    .local v2, "contentIntent":Landroid/app/PendingIntent;
    new-instance v6, Landroid/app/Notification$Builder;

    invoke-direct {v6, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x7f0201d5

    .line 40
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v6

    const-string v7, "go live"

    .line 41
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    const-string v7, "Your followers are waiting for you to stream."

    new-array v8, v8, [Ljava/lang/Object;

    .line 42
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    const/4 v7, 0x1

    .line 43
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v6

    const/4 v7, 0x2

    .line 44
    invoke-static {v7}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 46
    .local v3, "mBuilder":Landroid/app/Notification$Builder;
    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 47
    invoke-static {}, Lco/getair/meerkat/utilities/RandomInt;->getInt()I

    move-result v6

    invoke-virtual {v3}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 50
    return-void
.end method
