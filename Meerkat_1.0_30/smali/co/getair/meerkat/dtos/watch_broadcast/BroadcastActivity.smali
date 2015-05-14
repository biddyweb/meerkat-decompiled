.class public Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;
.super Ljava/lang/Object;
.source "BroadcastActivity.java"


# instance fields
.field message:Ljava/lang/String;

.field title:Ljava/lang/String;

.field user:Lco/getair/meerkat/dtos/User;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "watcher"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->user:Lco/getair/meerkat/dtos/User;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
