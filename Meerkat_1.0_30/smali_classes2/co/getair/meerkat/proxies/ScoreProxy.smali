.class public Lco/getair/meerkat/proxies/ScoreProxy;
.super Ljava/lang/Object;
.source "ScoreProxy.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getBucket()Ljava/util/ArrayList;
    .locals 3

    .prologue
    .line 30
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v1

    const-string v2, "inboxProxy"

    invoke-virtual {v1, v2}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/InboxProxy;

    .line 31
    .local v0, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    const-string v1, "score"

    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/InboxProxy;->getBucket(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    return-object v1
.end method

.method public static getScore()I
    .locals 5

    .prologue
    .line 18
    const/4 v0, 0x0

    .line 19
    .local v0, "result":I
    invoke-static {}, Lco/getair/meerkat/proxies/ScoreProxy;->getBucket()Ljava/util/ArrayList;

    move-result-object v2

    .line 20
    .local v2, "scores":Ljava/util/ArrayList;
    if-eqz v2, :cond_0

    .line 21
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 22
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 23
    .local v1, "scoreEntry":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "o"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->intValue()I

    move-result v0

    .line 26
    .end local v1    # "scoreEntry":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return v0
.end method
