.class public Lco/getair/meerkat/dtos/feed/ScheduledStreamSubscribedParams;
.super Ljava/lang/Object;
.source "ScheduledStreamSubscribedParams.java"


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
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/ScheduledStreamSubscribedParams;->tweetId:Ljava/lang/String;

    .line 11
    return-void
.end method
