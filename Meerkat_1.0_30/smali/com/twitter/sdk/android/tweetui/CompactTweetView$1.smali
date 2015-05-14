.class Lcom/twitter/sdk/android/tweetui/CompactTweetView$1;
.super Ljava/lang/Object;
.source "CompactTweetView.java"

# interfaces
.implements Lcom/squareup/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/CompactTweetView;->setTweetPhoto(Lcom/twitter/sdk/android/core/models/MediaEntity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/CompactTweetView;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/CompactTweetView;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView$1;->this$0:Lcom/twitter/sdk/android/tweetui/CompactTweetView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView$1;->this$0:Lcom/twitter/sdk/android/tweetui/CompactTweetView;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/CompactTweetView;->setErrorImage()V

    .line 69
    return-void
.end method

.method public onSuccess()V
    .locals 0

    .prologue
    .line 64
    return-void
.end method
