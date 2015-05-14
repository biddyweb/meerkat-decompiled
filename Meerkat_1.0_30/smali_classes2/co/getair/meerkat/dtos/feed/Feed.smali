.class public Lco/getair/meerkat/dtos/feed/Feed;
.super Ljava/lang/Object;
.source "Feed.java"


# instance fields
.field private broadcastUrl:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private influencerIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/HashMap;)V
    .locals 1
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
    .line 18
    .local p1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-string v0, "id"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 21
    const-string v0, "id"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/Feed;->id:Ljava/lang/String;

    .line 24
    :cond_0
    const-string v0, "broadcast"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 26
    const-string v0, "broadcast"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/Feed;->broadcastUrl:Ljava/lang/String;

    .line 30
    :cond_1
    const-string v0, "influencers"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 32
    const-string v0, "influencers"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/Feed;->influencerIds:Ljava/util/ArrayList;

    .line 34
    :cond_2
    return-void
.end method


# virtual methods
.method public getBroadcastUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/Feed;->broadcastUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/Feed;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getInfluencerIds()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/Feed;->influencerIds:Ljava/util/ArrayList;

    return-object v0
.end method

.method public setBroadcastUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "broadcastUrl"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/Feed;->broadcastUrl:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/Feed;->id:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setInfluencerIds(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "influencerIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/Feed;->influencerIds:Ljava/util/ArrayList;

    .line 48
    return-void
.end method
