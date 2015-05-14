.class public Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UnsubscribeFromScheduledStreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->unscheduleStreamNotification(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V

    return-void
.end method

.method private unscheduleStreamNotification(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    .locals 4
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .prologue
    .line 61
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 63
    .local v1, "ownerActivity":Landroid/app/Activity;
    invoke-static {v1, p1}, Lco/getair/meerkat/notifications/PendingNotificationBroadcastReceiver;->createPendingNotificationIntent(Landroid/content/Context;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)Landroid/app/PendingIntent;

    move-result-object v2

    .line 66
    .local v2, "pendingIntent":Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {v1, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 67
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 68
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 31
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 33
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .line 34
    .local v0, "streamFeedItemProxy":Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
    new-instance v1, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;

    invoke-direct {v1, p0, v0}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;-><init>(Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->unsubscribeToSchduledStream(Ljava/lang/Runnable;)V

    .line 58
    return-void
.end method
