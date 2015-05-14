.class public Lco/getair/meerkat/dtos/feed/FeedLiveStream;
.super Lco/getair/meerkat/dtos/feed/FeedStream;
.source "FeedLiveStream.java"


# direct methods
.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p1, "liveStreamMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p1}, Lco/getair/meerkat/dtos/feed/FeedStream;-><init>(Ljava/util/Map;)V

    .line 16
    return-void
.end method


# virtual methods
.method protected getLinkUrlKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 11
    const-string v0, "broadcast"

    return-object v0
.end method
