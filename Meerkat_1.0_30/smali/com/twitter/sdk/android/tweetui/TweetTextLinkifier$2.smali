.class final Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;
.super Landroid/text/style/ClickableSpan;
.source "TweetTextLinkifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier;->addUrlEntities(Landroid/text/SpannableStringBuilder;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;Lcom/twitter/sdk/android/tweetui/LinkClickListener;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$linkColor:I

.field final synthetic val$listener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

.field final synthetic val$url:Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/LinkClickListener;Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;I)V
    .locals 0

    .prologue
    .line 130
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$listener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$url:Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;

    iput p3, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$linkColor:I

    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "widget"    # Landroid/view/View;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$listener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    if-nez v0, :cond_0

    .line 135
    :goto_0
    return-void

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$listener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$url:Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;

    iget-object v1, v1, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/twitter/sdk/android/tweetui/LinkClickListener;->onUrlClicked(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1
    .param p1, "ds"    # Landroid/text/TextPaint;

    .prologue
    .line 139
    iget v0, p0, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;->val$linkColor:I

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setColor(I)V

    .line 140
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 141
    return-void
.end method
