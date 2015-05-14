.class public Lcom/twitter/sdk/android/tweetui/TweetView;
.super Lcom/twitter/sdk/android/tweetui/BaseTweetView;
.source "TweetView.java"


# static fields
.field private static final VIEW_TYPE_NAME:Ljava/lang/String; = "default"


# instance fields
.field shareButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p3, "styleResId"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;I)V

    .line 26
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p3, "styleResId"    # I
    .param p4, "dependencyProvider"    # Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V

    .line 30
    return-void
.end method

.method private setShareButtonGone()V
    .locals 5

    .prologue
    .line 113
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 116
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/twitter/sdk/android/tweetui/R$dimen;->tw__tweet_container_padding_bottom:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v0, v1

    .line 118
    .local v0, "bottomPaddingPx":I
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getPaddingLeft()I

    move-result v2

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v3}, Landroid/widget/RelativeLayout;->getPaddingTop()I

    move-result v3

    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getPaddingRight()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 120
    return-void
.end method

.method private setShareButtonVisibility(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 2
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 73
    invoke-static {p1}, Lcom/twitter/sdk/android/tweetui/TweetUtils;->isTweetResolvable(Lcom/twitter/sdk/android/core/models/Tweet;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/TweetView;->setShareButtonVisible()V

    .line 75
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    new-instance v1, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;

    invoke-direct {v1, p1}, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;-><init>(Lcom/twitter/sdk/android/core/models/Tweet;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    :goto_0
    return-void

    .line 77
    :cond_0
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/TweetView;->setShareButtonGone()V

    .line 78
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private setShareButtonVisible()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 83
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 85
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v5}, Landroid/widget/RelativeLayout;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v6}, Landroid/widget/RelativeLayout;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->containerView:Landroid/widget/RelativeLayout;

    invoke-virtual {v7}, Landroid/widget/RelativeLayout;->getPaddingRight()I

    move-result v7

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 88
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/twitter/sdk/android/tweetui/R$dimen;->tw__tweet_share_margin_left:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v3, v4

    .line 90
    .local v3, "leftMarginPx":I
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    invoke-virtual {v4}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v4, 0x3

    sget v5, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_text:I

    invoke-virtual {v2, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 94
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/twitter/sdk/android/tweetui/R$dimen;->tw__tweet_share_extra_bottom_margin:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v0, v4

    .line 99
    .local v0, "extraBottomMarginPx":I
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->contentView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 101
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/twitter/sdk/android/tweetui/R$dimen;->tw__tweet_share_extra_top_margin:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v1, v4

    .line 103
    .local v1, "extraTopMarginPx":I
    invoke-virtual {v2, v3, v1, v8, v0}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 104
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .end local v1    # "extraTopMarginPx":I
    :goto_0
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    invoke-virtual {v4}, Landroid/widget/Button;->requestLayout()V

    .line 110
    return-void

    .line 106
    :cond_0
    invoke-virtual {v2, v3, v8, v8, v0}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 107
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method private setVerifiedCheck(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 2
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 127
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-boolean v0, v0, Lcom/twitter/sdk/android/core/models/User;->verified:Z

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->verifiedCheckView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 132
    :goto_0
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->verifiedCheckView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method protected applyStyles()V
    .locals 2

    .prologue
    .line 68
    invoke-super {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->applyStyles()V

    .line 69
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->actionColor:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 70
    return-void
.end method

.method findSubviews()V
    .locals 1

    .prologue
    .line 48
    invoke-super {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findSubviews()V

    .line 49
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_media:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/TweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->mediaPhotoView:Landroid/widget/ImageView;

    .line 50
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_share:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/TweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->shareButton:Landroid/widget/Button;

    .line 51
    return-void
.end method

.method protected getLayout()I
    .locals 1

    .prologue
    .line 43
    sget v0, Lcom/twitter/sdk/android/tweetui/R$layout;->tw__tweet:I

    return v0
.end method

.method getViewTypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    const-string v0, "default"

    return-object v0
.end method

.method render()V
    .locals 1

    .prologue
    .line 61
    invoke-super {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->render()V

    .line 62
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/TweetView;->setVerifiedCheck(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 63
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/TweetView;->setShareButtonVisibility(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 64
    return-void
.end method
