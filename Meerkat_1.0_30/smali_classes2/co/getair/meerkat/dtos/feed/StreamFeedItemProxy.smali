.class public abstract Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "StreamFeedItemProxy.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lco/getair/meerkat/dtos/feed/BroadcastSummary;",
        ">",
        "Lorg/puremvc/java/multicore/patterns/proxy/Proxy;",
        "Ljava/lang/Comparable",
        "<",
        "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;",
        ">;"
    }
.end annotation


# instance fields
.field protected final RESTREAM_URL_KEY:Ljava/lang/String;

.field protected final SUBSCRIBE_URL_KEY:Ljava/lang/String;

.field protected final UNSUBSCRIBE_URL_KEY:Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field didRestream:Z

.field followupActions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field influencer:Lco/getair/meerkat/dtos/Influencer;

.field streamId:Ljava/lang/String;

.field version:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;IZLjava/lang/String;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V
    .locals 2
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "version"    # I
    .param p4, "didRestream"    # Z
    .param p5, "streamId"    # Ljava/lang/String;
    .param p6, "influencer"    # Lco/getair/meerkat/dtos/Influencer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            "IZ",
            "Ljava/lang/String;",
            "Lco/getair/meerkat/dtos/Influencer;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    .local p7, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 55
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 27
    const-string v0, "subscribe"

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->SUBSCRIBE_URL_KEY:Ljava/lang/String;

    .line 28
    const-string v0, "unsubscribe"

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->UNSUBSCRIBE_URL_KEY:Ljava/lang/String;

    .line 29
    const-string v0, "restreams"

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->RESTREAM_URL_KEY:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->influencer:Lco/getair/meerkat/dtos/Influencer;

    .line 40
    iput v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->version:I

    .line 42
    iput-boolean v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->didRestream:Z

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->streamId:Ljava/lang/String;

    .line 57
    iput-object p5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->streamId:Ljava/lang/String;

    .line 59
    iput-boolean p4, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->didRestream:Z

    .line 61
    iput p3, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->version:I

    .line 63
    iput-object p6, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->influencer:Lco/getair/meerkat/dtos/Influencer;

    .line 65
    iput-object p7, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->followupActions:Ljava/util/HashMap;

    .line 67
    iput-object p2, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    .line 68
    return-void
.end method


# virtual methods
.method public didRestream()Z
    .locals 1

    .prologue
    .line 198
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    iget-boolean v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->didRestream:Z

    return v0
.end method

.method public abstract getBroadcastSummary()Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public getFollowupActions()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->followupActions:Ljava/util/HashMap;

    return-object v0
.end method

.method public getInfluencer()Lco/getair/meerkat/dtos/Influencer;
    .locals 1

    .prologue
    .line 100
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->influencer:Lco/getair/meerkat/dtos/Influencer;

    return-object v0
.end method

.method public getScore()I
    .locals 3

    .prologue
    .line 75
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    const/4 v0, 0x0

    .line 77
    .local v0, "relevancyBoost":I
    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->influencer:Lco/getair/meerkat/dtos/Influencer;

    if-eqz v1, :cond_0

    .line 78
    sget-object v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$9;->$SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

    iget-object v2, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->influencer:Lco/getair/meerkat/dtos/Influencer;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 96
    :cond_0
    :goto_0
    return v0

    .line 80
    :pswitch_0
    const/16 v0, 0x2710

    .line 81
    goto :goto_0

    .line 83
    :pswitch_1
    const/16 v0, 0x7d0

    .line 84
    goto :goto_0

    .line 86
    :pswitch_2
    const/16 v0, 0x3e8

    .line 87
    goto :goto_0

    .line 89
    :pswitch_3
    const/16 v0, 0x1388

    .line 90
    goto :goto_0

    .line 78
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public abstract getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
.end method

.method public restreamSchduledStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 8
    .param p1, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    const/4 v1, 0x1

    .line 152
    const-string v3, "%s?auth=%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->followupActions:Ljava/util/HashMap;

    const-string v7, "restreams"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    iget-object v5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v5}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, "restreamScheduledStreamUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$5;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$5;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;

    invoke-direct {v5, p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$6;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 171
    .local v0, "getStreamSummary":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 172
    return-void
.end method

.method public setDidRestream(Z)V
    .locals 0
    .param p1, "didRestream"    # Z

    .prologue
    .line 194
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    iput-boolean p1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->didRestream:Z

    .line 195
    return-void
.end method

.method public subscribeToSchduledStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 8
    .param p1, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    const/4 v1, 0x1

    .line 108
    const-string v3, "%s?auth=%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->followupActions:Ljava/util/HashMap;

    const-string v7, "subscribe"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    iget-object v5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v5}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 110
    .local v2, "subscribeToStreamUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$1;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$1;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;

    invoke-direct {v5, p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$2;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 127
    .local v0, "getStreamSummary":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 128
    return-void
.end method

.method public unrestreamScheduledStream()V
    .locals 7

    .prologue
    .line 175
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    const-string v1, "%s?auth=%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->followupActions:Ljava/util/HashMap;

    const-string v6, "restreams"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v5}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 177
    .local v2, "unrestreamScheduledStreamUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x3

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;

    invoke-direct {v4, p0}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V

    new-instance v5, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$8;

    invoke-direct {v5, p0}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$8;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 190
    .local v0, "getStreamSummary":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 191
    return-void
.end method

.method public unsubscribeToSchduledStream(Ljava/lang/Runnable;)V
    .locals 8
    .param p1, "success"    # Ljava/lang/Runnable;

    .prologue
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy<TT;>;"
    const/4 v1, 0x1

    .line 131
    const-string v3, "%s?auth=%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->followupActions:Ljava/util/HashMap;

    const-string v7, "unsubscribe"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    iget-object v5, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v5}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, "subscribeToStreamUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$3;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Ljava/lang/Runnable;)V

    new-instance v5, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;

    invoke-direct {v5, p0}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;-><init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 148
    .local v0, "getStreamSummary":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 149
    return-void
.end method
