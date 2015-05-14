.class public Lco/getair/meerkat/dtos/WatchStartupParameters;
.super Ljava/lang/Object;
.source "WatchStartupParameters.java"


# instance fields
.field private context:Landroid/content/Context;

.field private streamId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "streamId"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lco/getair/meerkat/dtos/WatchStartupParameters;->context:Landroid/content/Context;

    .line 15
    iput-object p2, p0, Lco/getair/meerkat/dtos/WatchStartupParameters;->streamId:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lco/getair/meerkat/dtos/WatchStartupParameters;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getStreamId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lco/getair/meerkat/dtos/WatchStartupParameters;->streamId:Ljava/lang/String;

    return-object v0
.end method
