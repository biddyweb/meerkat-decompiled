.class public Lco/getair/meerkat/dtos/twitter/TweetParams;
.super Ljava/lang/Object;
.source "TweetParams.java"


# instance fields
.field completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

.field tweetText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/utilities/RunnableWithResultObject;Ljava/lang/String;)V
    .locals 0
    .param p1, "completion"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;
    .param p2, "tweetText"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lco/getair/meerkat/dtos/twitter/TweetParams;->completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .line 14
    iput-object p2, p0, Lco/getair/meerkat/dtos/twitter/TweetParams;->tweetText:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public getCompletion()Lco/getair/meerkat/utilities/RunnableWithResultObject;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lco/getair/meerkat/dtos/twitter/TweetParams;->completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    return-object v0
.end method

.method public getTweetText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/getair/meerkat/dtos/twitter/TweetParams;->tweetText:Ljava/lang/String;

    return-object v0
.end method
