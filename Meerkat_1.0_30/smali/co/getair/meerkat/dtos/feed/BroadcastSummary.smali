.class public abstract Lco/getair/meerkat/dtos/feed/BroadcastSummary;
.super Ljava/lang/Object;
.source "BroadcastSummary.java"


# instance fields
.field private activities:Ljava/util/List;

.field private broadcaster:Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

.field private caption:Ljava/lang/String;

.field private commentsCount:I

.field private coverImageUrl:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "cover"
    .end annotation
.end field

.field private endTime:J

.field private id:Ljava/lang/String;

.field private restreamsCount:I

.field private status:Ljava/lang/String;

.field private tweetId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivities()Ljava/util/List;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->activities:Ljava/util/List;

    return-object v0
.end method

.method public getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->broadcaster:Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    return-object v0
.end method

.method public getCaption()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->caption:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentsCount()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->commentsCount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getCoverImageUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->coverImageUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getEndTime()J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->endTime:J

    return-wide v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getRestreamsCount()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->restreamsCount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getTweetId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->tweetId:Ljava/lang/String;

    return-object v0
.end method

.method public setRestreamsCount(I)V
    .locals 0
    .param p1, "restreamsCount"    # I

    .prologue
    .line 57
    iput p1, p0, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->restreamsCount:I

    .line 58
    return-void
.end method
