.class public Lcom/twitter/sdk/android/tweetui/CompactTweetView;
.super Lcom/twitter/sdk/android/tweetui/BaseTweetView;
.source "CompactTweetView.java"


# static fields
.field private static final VIEW_TYPE_NAME:Ljava/lang/String; = "compact"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
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
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p3, "styleResId"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;I)V

    .line 24
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p3, "styleResId"    # I
    .param p4, "dependencyProvider"    # Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V

    .line 29
    return-void
.end method


# virtual methods
.method protected getLayout()I
    .locals 1

    .prologue
    .line 42
    sget v0, Lcom/twitter/sdk/android/tweetui/R$layout;->tw__tweet_compact:I

    return v0
.end method

.method getViewTypeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    const-string v0, "compact"

    return-object v0
.end method

.method render()V
    .locals 1

    .prologue
    .line 47
    invoke-super {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->render()V

    .line 49
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;->screenNameView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->requestLayout()V

    .line 50
    return-void
.end method

.method protected setTweetPhoto(Lcom/twitter/sdk/android/core/models/MediaEntity;)V
    .locals 4
    .param p1, "photoEntity"    # Lcom/twitter/sdk/android/core/models/MediaEntity;

    .prologue
    .line 54
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getImageLoader()Lcom/squareup/picasso/Picasso;

    move-result-object v0

    .line 56
    .local v0, "imageLoader":Lcom/squareup/picasso/Picasso;
    if-nez v0, :cond_0

    .line 72
    :goto_0
    return-void

    .line 58
    :cond_0
    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/MediaEntity;->mediaUrlHttps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;->mediaBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v2}, Lcom/squareup/picasso/RequestCreator;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/picasso/RequestCreator;->fit()Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/picasso/RequestCreator;->centerCrop()Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    new-instance v3, Lcom/twitter/sdk/android/tweetui/CompactTweetView$1;

    invoke-direct {v3, p0}, Lcom/twitter/sdk/android/tweetui/CompactTweetView$1;-><init>(Lcom/twitter/sdk/android/tweetui/CompactTweetView;)V

    invoke-virtual {v1, v2, v3}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    .line 71
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
