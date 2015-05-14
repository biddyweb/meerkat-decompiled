.class public Lco/getair/meerkat/dtos/AddCommentParams;
.super Ljava/lang/Object;
.source "AddCommentParams.java"


# instance fields
.field broadcasterUsername:Ljava/lang/String;

.field content:Ljava/lang/String;

.field originalTweetId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "broadcasterUsername"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "originalTweetId"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lco/getair/meerkat/dtos/AddCommentParams;->broadcasterUsername:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lco/getair/meerkat/dtos/AddCommentParams;->content:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lco/getair/meerkat/dtos/AddCommentParams;->originalTweetId:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getBroadcasterUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lco/getair/meerkat/dtos/AddCommentParams;->broadcasterUsername:Ljava/lang/String;

    return-object v0
.end method

.method public getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/getair/meerkat/dtos/AddCommentParams;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalTweetId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lco/getair/meerkat/dtos/AddCommentParams;->originalTweetId:Ljava/lang/String;

    return-object v0
.end method
