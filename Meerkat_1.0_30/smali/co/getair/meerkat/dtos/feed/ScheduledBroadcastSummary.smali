.class public Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;
.super Lco/getair/meerkat/dtos/feed/BroadcastSummary;
.source "ScheduledBroadcastSummary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;
    }
.end annotation


# instance fields
.field private location:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;

.field private subscribers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method public getLocation()Lcom/google/common/base/Optional;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 27
    iget-object v2, p0, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->location:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;

    invoke-static {v2}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    .line 29
    .local v0, "locationOptional":Lcom/google/common/base/Optional;, "Lcom/google/common/base/Optional<Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;>;"
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;

    invoke-static {v2}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;->access$100(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 33
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;

    invoke-static {v2}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;->access$000(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 36
    .local v1, "s":Ljava/lang/String;
    invoke-static {v1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v2

    .line 39
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v2

    goto :goto_0
.end method

.method public getSubscribers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->subscribers:Ljava/util/ArrayList;

    return-object v0
.end method
