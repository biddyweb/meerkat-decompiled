.class public Lco/getair/meerkat/notifications/PendingNotification;
.super Ljava/lang/Object;
.source "PendingNotification.java"


# instance fields
.field private notificationText:Ljava/lang/String;

.field private timestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 0
    .param p1, "notificationText"    # Ljava/lang/String;
    .param p2, "timestamp"    # J

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lco/getair/meerkat/notifications/PendingNotification;->notificationText:Ljava/lang/String;

    .line 13
    iput-wide p2, p0, Lco/getair/meerkat/notifications/PendingNotification;->timestamp:J

    .line 14
    return-void
.end method


# virtual methods
.method public getNotificationText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lco/getair/meerkat/notifications/PendingNotification;->notificationText:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 21
    iget-wide v0, p0, Lco/getair/meerkat/notifications/PendingNotification;->timestamp:J

    return-wide v0
.end method
