.class public Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;
.super Ljava/lang/Object;
.source "BroadcastBeganParams.java"


# instance fields
.field caption:Ljava/lang/String;

.field link:Ljava/lang/String;

.field locationText:Ljava/lang/String;

.field shareText:Ljava/lang/String;

.field tweetCompletion:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "caption"    # Ljava/lang/String;
    .param p2, "link"    # Ljava/lang/String;
    .param p3, "locationText"    # Ljava/lang/String;
    .param p4, "shareText"    # Ljava/lang/String;
    .param p5, "tweetCompletion"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->caption:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->link:Ljava/lang/String;

    .line 19
    iput-object p3, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->locationText:Ljava/lang/String;

    .line 20
    iput-object p4, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->shareText:Ljava/lang/String;

    .line 21
    iput-object p5, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->tweetCompletion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .line 22
    return-void
.end method


# virtual methods
.method public getCaption()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->caption:Ljava/lang/String;

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->link:Ljava/lang/String;

    return-object v0
.end method

.method public getLocationText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->locationText:Ljava/lang/String;

    return-object v0
.end method

.method public getShareText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->shareText:Ljava/lang/String;

    return-object v0
.end method

.method public getTweetCompletion()Lco/getair/meerkat/utilities/RunnableWithResultObject;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->tweetCompletion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    return-object v0
.end method
