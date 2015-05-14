.class Lcom/twitter/sdk/android/tweetui/BaseTweetView$4;
.super Ljava/lang/Object;
.source "BaseTweetView.java"

# interfaces
.implements Lcom/twitter/sdk/android/tweetui/LinkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getLinkClickListener()Lcom/twitter/sdk/android/tweetui/LinkClickListener;
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
    .line 754
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$4;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPhotoClicked(Lcom/twitter/sdk/android/core/models/MediaEntity;)V
    .locals 0
    .param p1, "mediaEntity"    # Lcom/twitter/sdk/android/core/models/MediaEntity;

    .prologue
    .line 766
    return-void
.end method

.method public onUrlClicked(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 757
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 761
    :goto_0
    return-void

    .line 759
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 760
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$4;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
