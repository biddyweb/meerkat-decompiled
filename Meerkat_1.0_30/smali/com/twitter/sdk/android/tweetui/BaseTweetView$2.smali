.class Lcom/twitter/sdk/android/tweetui/BaseTweetView$2;
.super Ljava/lang/Object;
.source "BaseTweetView.java"

# interfaces
.implements Lcom/squareup/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweetPhoto(Lcom/twitter/sdk/android/core/models/MediaEntity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V
    .locals 0

    .prologue
    .line 674
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$2;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 1

    .prologue
    .line 680
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$2;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setErrorImage()V

    .line 681
    return-void
.end method

.method public onSuccess()V
    .locals 0

    .prologue
    .line 676
    return-void
.end method
