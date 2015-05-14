.class public Lco/getair/meerkat/notifications/PendingNotificationsManager;
.super Ljava/lang/Object;
.source "PendingNotificationsManager.java"


# static fields
.field private static instance:Lco/getair/meerkat/notifications/PendingNotificationsManager;


# instance fields
.field private final GROUP_NOTIFICAITONS_ID:I

.field private final PENDING_NOTIFICATIONS_MANAGER_KEY:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private pendingNotifications:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/notifications/PendingNotification;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v1, "PendingNotificationsManagerFile"

    iput-object v1, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->PENDING_NOTIFICATIONS_MANAGER_KEY:Ljava/lang/String;

    .line 18
    const/4 v1, 0x1

    iput v1, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->GROUP_NOTIFICAITONS_ID:I

    .line 34
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v1

    const-string v2, "PendingNotificationsManagerFile"

    invoke-virtual {v1, p1, v2}, Lco/getair/meerkat/utilities/DiskWriter;->loadObject(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 35
    .local v0, "pendingNotificationList":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/notifications/PendingNotification;>;"
    if-eqz v0, :cond_0

    .end local v0    # "pendingNotificationList":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/notifications/PendingNotification;>;"
    :goto_0
    iput-object v0, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->pendingNotifications:Ljava/util/List;

    .line 36
    iput-object p1, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->context:Landroid/content/Context;

    .line 37
    return-void

    .line 35
    .restart local v0    # "pendingNotificationList":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/notifications/PendingNotification;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "pendingNotificationList":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/notifications/PendingNotification;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lco/getair/meerkat/notifications/PendingNotificationsManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const-class v1, Lco/getair/meerkat/notifications/PendingNotificationsManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->instance:Lco/getair/meerkat/notifications/PendingNotificationsManager;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lco/getair/meerkat/notifications/PendingNotificationsManager;

    invoke-direct {v0, p0}, Lco/getair/meerkat/notifications/PendingNotificationsManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->instance:Lco/getair/meerkat/notifications/PendingNotificationsManager;

    .line 30
    :cond_0
    sget-object v0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->instance:Lco/getair/meerkat/notifications/PendingNotificationsManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 26
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addNotification(Lco/getair/meerkat/notifications/PendingNotification;)V
    .locals 4
    .param p1, "newPendingNotification"    # Lco/getair/meerkat/notifications/PendingNotification;

    .prologue
    .line 40
    iget-object v0, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->pendingNotifications:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 41
    invoke-static {}, Lco/getair/meerkat/utilities/DiskWriter;->getInstance()Lco/getair/meerkat/utilities/DiskWriter;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->context:Landroid/content/Context;

    iget-object v2, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->pendingNotifications:Ljava/util/List;

    const-string v3, "PendingNotificationsManagerFile"

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/utilities/DiskWriter;->saveObject(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public cleanNotificationCenter()V
    .locals 3

    .prologue
    .line 50
    iget-object v1, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->pendingNotifications:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 52
    iget-object v1, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->context:Landroid/content/Context;

    const-string v2, "notification"

    .line 53
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 55
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 56
    return-void
.end method

.method public getGroupNotificationsId()I
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x1

    return v0
.end method

.method public getGroupedNotificationTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 59
    invoke-virtual {p0}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getPendingNotifications()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getPendingNotifications()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " people are live now"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "Live now"

    goto :goto_0
.end method

.method public getPendingNotifications()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/notifications/PendingNotification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/notifications/PendingNotificationsManager;->pendingNotifications:Ljava/util/List;

    .line 46
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/notifications/PendingNotification;>;"
    return-object v0
.end method
