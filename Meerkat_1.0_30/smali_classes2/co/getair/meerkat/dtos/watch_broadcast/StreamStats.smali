.class public Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;
.super Ljava/lang/Object;
.source "StreamStats.java"


# instance fields
.field commentsCount:I

.field likesCount:I

.field restreamsCount:I

.field watchersCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->likesCount:I

    .line 8
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->commentsCount:I

    .line 9
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->restreamsCount:I

    .line 10
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->watchersCount:I

    .line 20
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 1
    .param p1, "commentsCount"    # I
    .param p2, "likesCount"    # I
    .param p3, "restreamsCount"    # I
    .param p4, "watchersCount"    # I

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->likesCount:I

    .line 8
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->commentsCount:I

    .line 9
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->restreamsCount:I

    .line 10
    iput v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->watchersCount:I

    .line 13
    iput p1, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->commentsCount:I

    .line 14
    iput p2, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->likesCount:I

    .line 15
    iput p3, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->restreamsCount:I

    .line 16
    iput p4, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->watchersCount:I

    .line 17
    return-void
.end method


# virtual methods
.method public getCommentsCount()I
    .locals 1

    .prologue
    .line 23
    iget v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->commentsCount:I

    return v0
.end method

.method public getLikesCount()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->likesCount:I

    return v0
.end method

.method public getRestreamsCount()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->restreamsCount:I

    return v0
.end method

.method public getWatchersCount()I
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->watchersCount:I

    return v0
.end method
