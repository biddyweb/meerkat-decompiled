.class public Lco/getair/meerkat/dtos/feed/FeedScheduledStream;
.super Lco/getair/meerkat/dtos/feed/FeedStream;
.source "FeedScheduledStream.java"


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
    .line 16
    .local p1, "liveStreamMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p1}, Lco/getair/meerkat/dtos/feed/FeedStream;-><init>(Ljava/util/Map;)V

    .line 17
    return-void
.end method


# virtual methods
.method protected getLinkUrlKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    const-string v0, "summary"

    return-object v0
.end method
