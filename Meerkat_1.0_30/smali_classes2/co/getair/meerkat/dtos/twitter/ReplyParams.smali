.class public Lco/getair/meerkat/dtos/twitter/ReplyParams;
.super Ljava/lang/Object;
.source "ReplyParams.java"


# instance fields
.field content:Ljava/lang/String;

.field originalTweetUsername:Ljava/lang/String;

.field tweetId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "tweetId"    # Ljava/lang/String;
    .param p3, "originalTweetUsername"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lco/getair/meerkat/dtos/twitter/ReplyParams;->content:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lco/getair/meerkat/dtos/twitter/ReplyParams;->tweetId:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lco/getair/meerkat/dtos/twitter/ReplyParams;->originalTweetUsername:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lco/getair/meerkat/dtos/twitter/ReplyParams;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalTweetUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lco/getair/meerkat/dtos/twitter/ReplyParams;->originalTweetUsername:Ljava/lang/String;

    return-object v0
.end method

.method public getTweetId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/getair/meerkat/dtos/twitter/ReplyParams;->tweetId:Ljava/lang/String;

    return-object v0
.end method
