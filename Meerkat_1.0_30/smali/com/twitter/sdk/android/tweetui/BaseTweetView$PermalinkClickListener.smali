.class Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;
.super Ljava/lang/Object;
.source "BaseTweetView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/tweetui/BaseTweetView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PermalinkClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V
    .locals 0

    .prologue
    .line 772
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 775
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getPermalinkUri()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    .line 779
    :goto_0
    return-void

    .line 777
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->scribePermalinkClick()V

    .line 778
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->launchPermalink()V

    goto :goto_0
.end method
