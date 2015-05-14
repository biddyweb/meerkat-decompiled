.class public Lco/getair/meerkat/commands/feed/GetLiveParams;
.super Ljava/lang/Object;
.source "GetLiveParams.java"


# instance fields
.field shouldFilter:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "shouldFilter"    # Z

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/commands/feed/GetLiveParams;->shouldFilter:Z

    .line 10
    iput-boolean p1, p0, Lco/getair/meerkat/commands/feed/GetLiveParams;->shouldFilter:Z

    .line 11
    return-void
.end method
