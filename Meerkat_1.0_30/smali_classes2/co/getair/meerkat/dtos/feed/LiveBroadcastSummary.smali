.class public Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
.super Lco/getair/meerkat/dtos/feed/BroadcastSummary;
.source "LiveBroadcastSummary.java"


# static fields
.field public static final TRENDING_TAG:Ljava/lang/String; = "trending"


# instance fields
.field private influencers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private likesCount:I

.field private location:Ljava/lang/String;

.field private tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private watchersCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;-><init>()V

    .line 23
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->tags:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getInfluencers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->influencers:Ljava/util/List;

    return-object v0
.end method

.method public getLikesCount()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->likesCount:I

    return v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->location:Ljava/lang/String;

    return-object v0
.end method

.method public getWatchersCount()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->watchersCount:I

    return v0
.end method

.method public isTrending()Z
    .locals 2

    .prologue
    .line 46
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->tags:Ljava/util/List;

    const-string v1, "trending"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
