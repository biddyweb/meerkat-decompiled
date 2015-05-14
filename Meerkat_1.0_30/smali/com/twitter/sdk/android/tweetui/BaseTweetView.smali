.class public abstract Lcom/twitter/sdk/android/tweetui/BaseTweetView;
.super Landroid/widget/LinearLayout;
.source "BaseTweetView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;,
        Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_STYLE:I

.field private static final EMPTY_STRING:Ljava/lang/String; = ""

.field static final INVALID_ID:J = -0x1L

.field static final MEDIA_BG_DARK_OPACITY:D = 0.12

.field static final MEDIA_BG_LIGHT_OPACITY:D = 0.08

.field private static final SCRIBE_CLICK_ACTION:Ljava/lang/String; = "click"

.field private static final SCRIBE_IMPRESSION_ACTION:Ljava/lang/String; = "impression"

.field static final SECONDARY_TEXT_COLOR_DARK_OPACITY:D = 0.35

.field static final SECONDARY_TEXT_COLOR_LIGHT_OPACITY:D = 0.4

.field private static final SYNDICATED_SDK_IMPRESSION_COMPONENT:Ljava/lang/String; = ""

.field private static final SYNDICATED_SDK_IMPRESSION_ELEMENT:Ljava/lang/String; = ""

.field private static final SYNDICATED_SDK_IMPRESSION_PAGE:Ljava/lang/String; = "tweet"

.field private static final TAG:Ljava/lang/String; = "TweetUi"

.field private static final TFW_CLIENT_EVENT_ELEMENT:Ljava/lang/String; = ""

.field private static final TFW_CLIENT_EVENT_PAGE:Ljava/lang/String; = "android"

.field private static final TFW_CLIENT_EVENT_SECTION:Ljava/lang/String; = "tweet"


# instance fields
.field actionColor:I

.field avatarView:Landroid/widget/ImageView;

.field birdLogoResId:I

.field containerBgColor:I

.field containerView:Landroid/widget/RelativeLayout;

.field contentView:Landroid/widget/TextView;

.field final dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

.field fullNameView:Landroid/widget/TextView;

.field private linkClickListener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

.field mediaBg:Landroid/graphics/drawable/ColorDrawable;

.field mediaBgColor:I

.field mediaPhotoView:Landroid/widget/ImageView;

.field private permalinkUri:Landroid/net/Uri;

.field photoErrorResId:I

.field primaryTextColor:I

.field screenNameView:Landroid/widget/TextView;

.field secondaryTextColor:I

.field timestampView:Landroid/widget/TextView;

.field tweet:Lcom/twitter/sdk/android/core/models/Tweet;

.field private tweetViewMetric:Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;

.field twitterLogoView:Landroid/widget/ImageView;

.field verifiedCheckView:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    sget v0, Lcom/twitter/sdk/android/tweetui/R$style;->tw__TweetLightStyle:I

    sput v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->DEFAULT_STYLE:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 148
    new-instance v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-direct {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V

    .line 149
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 174
    new-instance v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-direct {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V

    .line 175
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "dependencyProvider"    # Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 190
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 191
    iput-object p4, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .line 192
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->initXmlAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 193
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->inflateView(Landroid/content/Context;)V

    .line 194
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "dependencyProvider"    # Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .prologue
    .line 159
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 160
    iput-object p3, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .line 161
    invoke-direct {p0, p1, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->initXmlAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 162
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->inflateView(Landroid/content/Context;)V

    .line 163
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 105
    sget v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->DEFAULT_STYLE:I

    invoke-direct {p0, p1, p2, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;I)V

    .line 106
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p3, "styleResId"    # I

    .prologue
    .line 115
    new-instance v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-direct {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V

    .line 116
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;ILcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p3, "styleResId"    # I
    .param p4, "dependencyProvider"    # Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .prologue
    .line 127
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 129
    iput-object p4, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    .line 130
    invoke-direct {p0, p3}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->initAttributes(I)V

    .line 131
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->inflateView(Landroid/content/Context;)V

    .line 132
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findSubviews()V

    .line 133
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->applyStyles()V

    .line 134
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->isTweetUiEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    :goto_0
    return-void

    .line 135
    :cond_0
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->initComponents()V

    .line 136
    invoke-virtual {p0, p2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweet(Lcom/twitter/sdk/android/core/models/Tweet;)V

    goto :goto_0
.end method

.method private inflateView(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 299
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 300
    .local v1, "localInflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getLayout()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 303
    .local v2, "v":Landroid/view/View;
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v0, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 305
    .local v0, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 306
    invoke-virtual {p0, v2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->addView(Landroid/view/View;)V

    .line 307
    return-void
.end method

.method private initAttributes(I)V
    .locals 3
    .param p1, "styleResId"    # I

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget-object v2, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__TweetView:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 205
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_0
    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setStyleAttributes(Landroid/content/res/TypedArray;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 209
    return-void

    .line 207
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private initComponents()V
    .locals 1

    .prologue
    .line 347
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getMetricsManager()Lcom/twitter/cobalt/metrics/MetricsManager;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getTweetViewMetric(Lcom/twitter/cobalt/metrics/MetricsManager;)Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweetViewMetric:Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;

    .line 348
    return-void
.end method

.method private initXmlAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    .line 219
    if-nez p2, :cond_0

    .line 229
    :goto_0
    return-void

    .line 221
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget-object v2, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__TweetView:[I

    invoke-virtual {v1, p2, v2, v3, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 224
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_0
    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setXmlDataAttributes(Landroid/content/res/TypedArray;)V

    .line 225
    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setStyleAttributes(Landroid/content/res/TypedArray;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private loadTweet()V
    .locals 6

    .prologue
    .line 448
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getTweetId()J

    move-result-wide v2

    .line 450
    .local v2, "tweetId":J
    new-instance v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;

    invoke-direct {v0, p0, v2, v3}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$1;-><init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;J)V

    .line 462
    .local v0, "repoCb":Lcom/twitter/sdk/android/tweetui/LoadCallback;, "Lcom/twitter/sdk/android/tweetui/LoadCallback<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getTweetUi()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getTweetRepository()Lcom/twitter/sdk/android/tweetui/TweetRepository;

    move-result-object v1

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getTweetId()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5, v0}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->loadTweet(JLcom/twitter/sdk/android/tweetui/LoadCallback;)V

    .line 463
    return-void
.end method

.method private setName(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 2
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 561
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    if-eqz v0, :cond_0

    .line 562
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->fullNameView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v1, v1, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/Utils;->stringOrEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 566
    :goto_0
    return-void

    .line 564
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->fullNameView:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private setPermalinkLauncher()V
    .locals 2

    .prologue
    .line 475
    new-instance v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$PermalinkClickListener;-><init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V

    .line 477
    .local v0, "listener":Landroid/view/View$OnClickListener;
    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 479
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 480
    return-void
.end method

.method private setScreenName(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 2
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 573
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    if-eqz v0, :cond_0

    .line 574
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->screenNameView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v1, v1, Lcom/twitter/sdk/android/core/models/User;->screenName:Ljava/lang/String;

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/Utils;->stringOrEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/UserUtils;->formatScreenName(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 579
    :goto_0
    return-void

    .line 577
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->screenNameView:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private setStyleAttributes(Landroid/content/res/TypedArray;)V
    .locals 7
    .param p1, "a"    # Landroid/content/res/TypedArray;

    .prologue
    const/4 v2, -0x1

    const/high16 v3, -0x1000000

    .line 258
    sget v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__TweetView_tw__container_bg_color:I

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/twitter/sdk/android/tweetui/R$color;->tw__tweet_light_container_bg_color:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->containerBgColor:I

    .line 260
    sget v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__TweetView_tw__primary_text_color:I

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/twitter/sdk/android/tweetui/R$color;->tw__tweet_light_primary_text_color:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->primaryTextColor:I

    .line 262
    sget v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__TweetView_tw__action_color:I

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/twitter/sdk/android/tweetui/R$color;->tw__tweet_action_color:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {p1, v1, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->actionColor:I

    .line 267
    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->containerBgColor:I

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/ColorUtils;->isLightColor(I)Z

    move-result v0

    .line 269
    .local v0, "isLightBg":Z
    if-eqz v0, :cond_0

    .line 270
    sget v1, Lcom/twitter/sdk/android/tweetui/R$drawable;->tw__ic_tweet_photo_error_light:I

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->photoErrorResId:I

    .line 271
    sget v1, Lcom/twitter/sdk/android/tweetui/R$drawable;->tw__ic_logo_blue:I

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->birdLogoResId:I

    .line 278
    :goto_0
    if-eqz v0, :cond_1

    const-wide v4, 0x3fd999999999999aL    # 0.4

    :goto_1
    if-eqz v0, :cond_2

    move v1, v2

    :goto_2
    iget v6, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->primaryTextColor:I

    invoke-static {v4, v5, v1, v6}, Lcom/twitter/sdk/android/tweetui/ColorUtils;->calculateOpacityTransform(DII)I

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->secondaryTextColor:I

    .line 285
    if-eqz v0, :cond_3

    const-wide v4, 0x3fb47ae147ae147bL    # 0.08

    :goto_3
    if-eqz v0, :cond_4

    :goto_4
    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->containerBgColor:I

    invoke-static {v4, v5, v3, v1}, Lcom/twitter/sdk/android/tweetui/ColorUtils;->calculateOpacityTransform(DII)I

    move-result v1

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBgColor:I

    .line 291
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBgColor:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBg:Landroid/graphics/drawable/ColorDrawable;

    .line 292
    return-void

    .line 273
    :cond_0
    sget v1, Lcom/twitter/sdk/android/tweetui/R$drawable;->tw__ic_tweet_photo_error_dark:I

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->photoErrorResId:I

    .line 274
    sget v1, Lcom/twitter/sdk/android/tweetui/R$drawable;->tw__ic_logo_white:I

    iput v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->birdLogoResId:I

    goto :goto_0

    .line 278
    :cond_1
    const-wide v4, 0x3fd6666666666666L    # 0.35

    goto :goto_1

    :cond_2
    move v1, v3

    goto :goto_2

    .line 285
    :cond_3
    const-wide v4, 0x3fbeb851eb851eb8L    # 0.12

    goto :goto_3

    :cond_4
    move v3, v2

    goto :goto_4
.end method

.method private setText(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 4
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 587
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 590
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 591
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    .line 592
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 594
    :cond_0
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getLinkifiedText(Lcom/twitter/sdk/android/core/models/Tweet;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/Utils;->charSeqOrEmpty(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 595
    .local v0, "tweetText":Ljava/lang/CharSequence;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 596
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 597
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 602
    :goto_0
    return-void

    .line 599
    :cond_1
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 600
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private setTimestamp(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 8
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 610
    if-eqz p1, :cond_0

    iget-object v3, p1, Lcom/twitter/sdk/android/core/models/Tweet;->createdAt:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p1, Lcom/twitter/sdk/android/core/models/Tweet;->createdAt:Ljava/lang/String;

    invoke-static {v3}, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->isValidTimestamp(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 612
    iget-object v3, p1, Lcom/twitter/sdk/android/core/models/Tweet;->createdAt:Ljava/lang/String;

    invoke-static {v3}, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->apiTimeToLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 614
    .local v0, "createdAtTimestamp":Ljava/lang/Long;
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v3, v4, v5, v6, v7}, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->getRelativeTimeString(Landroid/content/res/Resources;JJ)Ljava/lang/String;

    move-result-object v2

    .line 617
    .local v2, "timestamp":Ljava/lang/String;
    invoke-static {v2}, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->dotPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 622
    .end local v0    # "createdAtTimestamp":Ljava/lang/Long;
    .end local v2    # "timestamp":Ljava/lang/String;
    .local v1, "formattedTimestamp":Ljava/lang/String;
    :goto_0
    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->timestampView:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 623
    return-void

    .line 619
    .end local v1    # "formattedTimestamp":Ljava/lang/String;
    :cond_0
    const-string v1, ""

    .restart local v1    # "formattedTimestamp":Ljava/lang/String;
    goto :goto_0
.end method

.method private setXmlDataAttributes(Landroid/content/res/TypedArray;)V
    .locals 6
    .param p1, "a"    # Landroid/content/res/TypedArray;

    .prologue
    .line 237
    sget v1, Lcom/twitter/sdk/android/tweetui/R$styleable;->tw__TweetView_tw__tweet_id:I

    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-wide/16 v4, -0x1

    invoke-static {v1, v4, v5}, Lcom/twitter/sdk/android/tweetui/Utils;->numberOrDefault(Ljava/lang/String;J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 239
    .local v2, "tweetId":J
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gtz v1, :cond_0

    .line 240
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v4, "Invalid tw__tweet_id"

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 244
    :cond_0
    const/4 v1, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setPermalinkUri(Ljava/lang/String;Ljava/lang/Long;)V

    .line 245
    new-instance v1, Lcom/twitter/sdk/android/core/models/TweetBuilder;

    invoke-direct {v1}, Lcom/twitter/sdk/android/core/models/TweetBuilder;-><init>()V

    invoke-virtual {v1, v2, v3}, Lcom/twitter/sdk/android/core/models/TweetBuilder;->setId(J)Lcom/twitter/sdk/android/core/models/TweetBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/models/TweetBuilder;->build()Lcom/twitter/sdk/android/core/models/Tweet;

    move-result-object v0

    .line 248
    .local v0, "tweet":Lcom/twitter/sdk/android/core/models/Tweet;
    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    .line 249
    return-void
.end method


# virtual methods
.method protected applyStyles()V
    .locals 2

    .prologue
    .line 546
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->containerView:Landroid/widget/RelativeLayout;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->containerBgColor:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 547
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->avatarView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 548
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 549
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->fullNameView:Landroid/widget/TextView;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->primaryTextColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 550
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->screenNameView:Landroid/widget/TextView;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->secondaryTextColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 551
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->primaryTextColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 552
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->timestampView:Landroid/widget/TextView;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->secondaryTextColor:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 553
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->twitterLogoView:Landroid/widget/ImageView;

    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->birdLogoResId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 554
    return-void
.end method

.method protected clearMediaBackground()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 688
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 689
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 693
    :goto_0
    return-void

    .line 691
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method findSubviews()V
    .locals 1

    .prologue
    .line 363
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_view:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->containerView:Landroid/widget/RelativeLayout;

    .line 364
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_author_avatar:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->avatarView:Landroid/widget/ImageView;

    .line 365
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_author_full_name:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->fullNameView:Landroid/widget/TextView;

    .line 366
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_author_screen_name:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->screenNameView:Landroid/widget/TextView;

    .line 367
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_author_verified:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->verifiedCheckView:Landroid/widget/ImageView;

    .line 368
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_media:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    .line 369
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_text:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->contentView:Landroid/widget/TextView;

    .line 370
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__tweet_timestamp:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->timestampView:Landroid/widget/TextView;

    .line 371
    sget v0, Lcom/twitter/sdk/android/tweetui/R$id;->tw__twitter_logo:I

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->twitterLogoView:Landroid/widget/ImageView;

    .line 372
    return-void
.end method

.method abstract getLayout()I
.end method

.method protected getLinkClickListener()Lcom/twitter/sdk/android/tweetui/LinkClickListener;
    .locals 1

    .prologue
    .line 753
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->linkClickListener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    if-nez v0, :cond_0

    .line 754
    new-instance v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$4;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$4;-><init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->linkClickListener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    .line 769
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->linkClickListener:Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    return-object v0
.end method

.method protected getLinkifiedText(Lcom/twitter/sdk/android/core/models/Tweet;)Ljava/lang/CharSequence;
    .locals 4
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 719
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getTweetUi()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v2

    invoke-virtual {v2}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getTweetRepository()Lcom/twitter/sdk/android/tweetui/TweetRepository;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->formatTweetText(Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    move-result-object v0

    .line 722
    .local v0, "formattedText":Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    if-nez v0, :cond_0

    const/4 v2, 0x0

    .line 726
    :goto_0
    return-object v2

    .line 724
    :cond_0
    iget-object v2, p1, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    invoke-static {v2}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->hasPhotoUrl(Lcom/twitter/sdk/android/core/models/TweetEntities;)Z

    move-result v1

    .line 726
    .local v1, "stripPhotoEntity":Z
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getLinkClickListener()Lcom/twitter/sdk/android/tweetui/LinkClickListener;

    move-result-object v2

    iget v3, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->actionColor:I

    invoke-static {v0, v2, v1, v3}, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier;->linkifyUrls(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;Lcom/twitter/sdk/android/tweetui/LinkClickListener;ZI)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_0
.end method

.method getPermalinkUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 466
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->permalinkUri:Landroid/net/Uri;

    return-object v0
.end method

.method getSyndicatedSdkClickNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .locals 2

    .prologue
    .line 531
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    invoke-direct {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;-><init>()V

    const-string v1, "android"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setClient(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "tweet"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setPage(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getViewTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setSection(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setComponent(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setElement(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "click"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setAction(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->builder()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v0

    return-object v0
.end method

.method getSyndicatedSdkImpressionNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .locals 2

    .prologue
    .line 504
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    invoke-direct {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;-><init>()V

    const-string v1, "android"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setClient(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "tweet"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setPage(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getViewTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setSection(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setComponent(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setElement(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "impression"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setAction(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->builder()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v0

    return-object v0
.end method

.method getTfwEventClickNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .locals 2

    .prologue
    .line 520
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    invoke-direct {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;-><init>()V

    const-string v1, "tfw"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setClient(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "android"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setPage(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "tweet"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setSection(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getViewTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setComponent(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setElement(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "click"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setAction(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->builder()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v0

    return-object v0
.end method

.method getTfwEventImpressionNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    .locals 2

    .prologue
    .line 493
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    invoke-direct {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;-><init>()V

    const-string v1, "tfw"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setClient(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "android"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setPage(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "tweet"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setSection(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getViewTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setComponent(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setElement(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    const-string v1, "impression"

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setAction(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->builder()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v0

    return-object v0
.end method

.method public getTweet()Lcom/twitter/sdk/android/core/models/Tweet;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    return-object v0
.end method

.method public getTweetId()J
    .locals 2

    .prologue
    .line 388
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    if-nez v0, :cond_0

    .line 389
    const-wide/16 v0, -0x1

    .line 391
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-wide v0, v0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    goto :goto_0
.end method

.method getTweetViewMetric(Lcom/twitter/cobalt/metrics/MetricsManager;)Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;
    .locals 1
    .param p1, "metricsManager"    # Lcom/twitter/cobalt/metrics/MetricsManager;

    .prologue
    .line 355
    new-instance v0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;

    invoke-direct {v0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;-><init>(Lcom/twitter/cobalt/metrics/MetricsManager;)V

    return-object v0
.end method

.method abstract getViewTypeName()Ljava/lang/String;
.end method

.method isTweetUiEnabled()Z
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 330
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 339
    :goto_0
    return v1

    .line 332
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getTweetUi()Lcom/twitter/sdk/android/tweetui/TweetUi;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 339
    const/4 v1, 0x1

    goto :goto_0

    .line 333
    :catch_0
    move-exception v0

    .line 334
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v2

    const-string v3, "TweetUi"

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    invoke-virtual {p0, v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setEnabled(Z)V

    goto :goto_0
.end method

.method launchPermalink()V
    .locals 3

    .prologue
    .line 483
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getPermalinkUri()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 484
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 485
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 315
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 316
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->isTweetUiEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 321
    :goto_0
    return-void

    .line 317
    :cond_0
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->initComponents()V

    .line 318
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->findSubviews()V

    .line 319
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->applyStyles()V

    .line 320
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->loadTweet()V

    goto :goto_0
.end method

.method render()V
    .locals 4

    .prologue
    .line 420
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweetViewMetric:Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->start()V

    .line 421
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setProfilePhotoView(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 422
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setName(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 423
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setScreenName(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 424
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTimestamp(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 425
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweetPhoto(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 426
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setText(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 427
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setContentDescription(Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 430
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    invoke-static {v0}, Lcom/twitter/sdk/android/tweetui/TweetUtils;->isTweetResolvable(Lcom/twitter/sdk/android/core/models/Tweet;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/User;->screenName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getTweetId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setPermalinkUri(Ljava/lang/String;Ljava/lang/Long;)V

    .line 437
    :goto_0
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setPermalinkLauncher()V

    .line 438
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->scribeImpression()V

    .line 439
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweetViewMetric:Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->finishRender()V

    .line 440
    return-void

    .line 433
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->permalinkUri:Landroid/net/Uri;

    goto :goto_0
.end method

.method scribeImpression()V
    .locals 4

    .prologue
    .line 488
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getTweetUi()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getTfwEventImpressionNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getSyndicatedSdkImpressionNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/tweetui/TweetUi;->scribe([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V

    .line 490
    return-void
.end method

.method scribePermalinkClick()V
    .locals 4

    .prologue
    .line 515
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getTweetUi()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getTfwEventClickNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getSyndicatedSdkClickNamespace()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/tweetui/TweetUi;->scribe([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V

    .line 517
    return-void
.end method

.method setContentDescription(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 10
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 731
    invoke-static {p1}, Lcom/twitter/sdk/android/tweetui/TweetUtils;->isTweetResolvable(Lcom/twitter/sdk/android/core/models/Tweet;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 732
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/twitter/sdk/android/tweetui/R$string;->tw__loading_tweet:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 750
    :goto_0
    return-void

    .line 736
    :cond_0
    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v5}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getTweetUi()Lcom/twitter/sdk/android/tweetui/TweetUi;

    move-result-object v5

    invoke-virtual {v5}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getTweetRepository()Lcom/twitter/sdk/android/tweetui/TweetRepository;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/twitter/sdk/android/tweetui/TweetRepository;->formatTweetText(Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    move-result-object v2

    .line 738
    .local v2, "formattedTweetText":Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    const/4 v4, 0x0

    .line 739
    .local v4, "tweetText":Ljava/lang/String;
    if-eqz v2, :cond_1

    iget-object v4, v2, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->text:Ljava/lang/String;

    .line 741
    :cond_1
    iget-object v5, p1, Lcom/twitter/sdk/android/core/models/Tweet;->createdAt:Ljava/lang/String;

    invoke-static {v5}, Lcom/twitter/sdk/android/tweetui/TweetDateUtils;->apiTimeToLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 742
    .local v0, "createdAt":J
    const/4 v3, 0x0

    .line 743
    .local v3, "timestamp":Ljava/lang/String;
    const-wide/16 v6, -0x1

    cmp-long v5, v0, v6

    if-eqz v5, :cond_2

    .line 744
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 747
    :cond_2
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/twitter/sdk/android/tweetui/R$string;->tw__tweet_content_description:I

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v9, v9, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    invoke-static {v9}, Lcom/twitter/sdk/android/tweetui/Utils;->stringOrEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v4}, Lcom/twitter/sdk/android/tweetui/Utils;->stringOrEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-static {v3}, Lcom/twitter/sdk/android/tweetui/Utils;->stringOrEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected setErrorImage()V
    .locals 4

    .prologue
    .line 698
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getImageLoader()Lcom/squareup/picasso/Picasso;

    move-result-object v0

    .line 700
    .local v0, "imageLoader":Lcom/squareup/picasso/Picasso;
    if-nez v0, :cond_0

    .line 712
    :goto_0
    return-void

    .line 702
    :cond_0
    iget v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->photoErrorResId:I

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->load(I)Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    new-instance v3, Lcom/twitter/sdk/android/tweetui/BaseTweetView$3;

    invoke-direct {v3, p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$3;-><init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V

    invoke-virtual {v1, v2, v3}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    goto :goto_0
.end method

.method setPermalinkUri(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 4
    .param p1, "screenName"    # Ljava/lang/String;
    .param p2, "tweetId"    # Ljava/lang/Long;

    .prologue
    .line 470
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 472
    :goto_0
    return-void

    .line 471
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/twitter/sdk/android/tweetui/TweetUtils;->getPermalink(Ljava/lang/String;J)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->permalinkUri:Landroid/net/Uri;

    goto :goto_0
.end method

.method setProfilePhotoView(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 4
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 632
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v2}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getImageLoader()Lcom/squareup/picasso/Picasso;

    move-result-object v0

    .line 634
    .local v0, "imageLoader":Lcom/squareup/picasso/Picasso;
    if-nez v0, :cond_0

    .line 645
    :goto_0
    return-void

    .line 637
    :cond_0
    if-eqz p1, :cond_1

    iget-object v2, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    if-nez v2, :cond_2

    .line 638
    :cond_1
    const/4 v1, 0x0

    .line 644
    .local v1, "url":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v2

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v2, v3}, Lcom/squareup/picasso/RequestCreator;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v2

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->avatarView:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V

    goto :goto_0

    .line 640
    .end local v1    # "url":Ljava/lang/String;
    :cond_2
    iget-object v2, p1, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    sget-object v3, Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;->REASONABLY_SMALL:Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;

    invoke-static {v2, v3}, Lcom/twitter/sdk/android/tweetui/UserUtils;->getProfileImageUrlHttps(Lcom/twitter/sdk/android/core/models/User;Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "url":Ljava/lang/String;
    goto :goto_1
.end method

.method public setTweet(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 0
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 402
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    .line 403
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->render()V

    .line 404
    return-void
.end method

.method protected setTweetPhoto(Lcom/twitter/sdk/android/core/models/MediaEntity;)V
    .locals 4
    .param p1, "photoEntity"    # Lcom/twitter/sdk/android/core/models/MediaEntity;

    .prologue
    .line 668
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->dependencyProvider:Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$DependencyProvider;->getImageLoader()Lcom/squareup/picasso/Picasso;

    move-result-object v0

    .line 670
    .local v0, "imageLoader":Lcom/squareup/picasso/Picasso;
    if-nez v0, :cond_0

    .line 683
    :goto_0
    return-void

    .line 672
    :cond_0
    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/MediaEntity;->mediaUrlHttps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBg:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v2}, Lcom/squareup/picasso/RequestCreator;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    new-instance v3, Lcom/twitter/sdk/android/tweetui/BaseTweetView$2;

    invoke-direct {v3, p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView$2;-><init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V

    invoke-virtual {v1, v2, v3}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    goto :goto_0
.end method

.method final setTweetPhoto(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 3
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 653
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->clearMediaBackground()V

    .line 655
    if-eqz p1, :cond_0

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->hasPhotoUrl(Lcom/twitter/sdk/android/core/models/TweetEntities;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 656
    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    invoke-static {v1}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->getLastPhotoEntity(Lcom/twitter/sdk/android/core/models/TweetEntities;)Lcom/twitter/sdk/android/core/models/MediaEntity;

    move-result-object v0

    .line 660
    .local v0, "photoEntity":Lcom/twitter/sdk/android/core/models/MediaEntity;
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 661
    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweetPhoto(Lcom/twitter/sdk/android/core/models/MediaEntity;)V

    .line 665
    .end local v0    # "photoEntity":Lcom/twitter/sdk/android/core/models/MediaEntity;
    :goto_0
    return-void

    .line 663
    :cond_0
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
