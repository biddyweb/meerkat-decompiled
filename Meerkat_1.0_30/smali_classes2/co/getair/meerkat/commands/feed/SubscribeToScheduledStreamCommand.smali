.class public Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "SubscribeToScheduledStreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->scheduleStreamNotification(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V

    return-void
.end method

.method private scheduleStreamNotification(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    .locals 10
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .prologue
    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 72
    .local v1, "ownerActivity":Landroid/app/Activity;
    invoke-static {v1, p1}, Lco/getair/meerkat/notifications/PendingNotificationBroadcastReceiver;->createPendingNotificationIntent(Landroid/content/Context;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)Landroid/app/PendingIntent;

    move-result-object v2

    .line 75
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v4, Lorg/joda/time/Instant;

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    mul-long/2addr v6, v8

    invoke-direct {v4, v6, v7}, Lorg/joda/time/Instant;-><init>(J)V

    const-wide/16 v6, 0x1

    .line 76
    invoke-static {v6, v7}, Lorg/joda/time/Duration;->standardMinutes(J)Lorg/joda/time/Duration;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/joda/time/Instant;->minus(Lorg/joda/time/ReadableDuration;)Lorg/joda/time/Instant;

    move-result-object v3

    .line 79
    .local v3, "wakeUp":Lorg/joda/time/Instant;
    const-string v4, "alarm"

    invoke-virtual {v1, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 80
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    const/4 v4, 0x0

    invoke-virtual {v3}, Lorg/joda/time/Instant;->getMillis()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 81
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 38
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .line 39
    .local v1, "streamFeedItemProxy":Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
    new-instance v0, Lco/getair/meerkat/dtos/DidSubscribeParams;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getTweetId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lco/getair/meerkat/dtos/DidSubscribeParams;-><init>(Ljava/lang/String;)V

    .line 40
    .local v0, "didSubscribeParams":Lco/getair/meerkat/dtos/DidSubscribeParams;
    new-instance v2, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;

    invoke-direct {v2, p0, v0, v1}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;-><init>(Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;Lco/getair/meerkat/dtos/DidSubscribeParams;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->subscribeToSchduledStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 67
    return-void
.end method
