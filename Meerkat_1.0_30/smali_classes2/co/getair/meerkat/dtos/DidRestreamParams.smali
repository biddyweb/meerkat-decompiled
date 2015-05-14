.class public Lco/getair/meerkat/dtos/DidRestreamParams;
.super Ljava/lang/Object;
.source "DidRestreamParams.java"


# instance fields
.field tweetId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "tweetId"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lco/getair/meerkat/dtos/DidRestreamParams;->tweetId:Ljava/lang/String;

    .line 11
    return-void
.end method


# virtual methods
.method public getTweetId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lco/getair/meerkat/dtos/DidRestreamParams;->tweetId:Ljava/lang/String;

    return-object v0
.end method
