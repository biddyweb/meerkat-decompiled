.class public interface abstract Lcom/twitter/sdk/android/tweetui/internal/Timeline;
.super Ljava/lang/Object;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract newer(Ljava/lang/Integer;Ljava/lang/Long;Lcom/twitter/sdk/android/core/Callback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Ljava/util/List",
            "<TT;>;>;)V"
        }
    .end annotation
.end method

.method public abstract older(Ljava/lang/Integer;Ljava/lang/Long;Lcom/twitter/sdk/android/core/Callback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Ljava/util/List",
            "<TT;>;>;)V"
        }
    .end annotation
.end method
