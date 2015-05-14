.class public Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
.super Ljava/lang/Object;
.source "WatchersCountParams.java"


# instance fields
.field currentWatchersCount:I

.field totalWatchersCount:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "currentWatchersCount"    # I
    .param p2, "totalWatchersCount"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->currentWatchersCount:I

    .line 12
    iput p2, p0, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->totalWatchersCount:I

    .line 13
    return-void
.end method


# virtual methods
.method public getCurrentWatchersCount()I
    .locals 1

    .prologue
    .line 16
    iget v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->currentWatchersCount:I

    return v0
.end method

.method public getTotalWatchersCount()I
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->totalWatchersCount:I

    return v0
.end method
