.class public Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;
.super Ljava/lang/Object;
.source "TweetComposer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private imageUri:Landroid/net/Uri;

.field private text:Ljava/lang/String;

.field private url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    if-nez p1, :cond_0

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->context:Landroid/content/Context;

    .line 45
    return-void
.end method


# virtual methods
.method public createIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->createTwitterIntent()Landroid/content/Intent;

    move-result-object v0

    .line 101
    .local v0, "intent":Landroid/content/Intent;
    if-nez v0, :cond_0

    .line 102
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->createWebIntent()Landroid/content/Intent;

    move-result-object v0

    .line 105
    :cond_0
    return-object v0
.end method

.method createTwitterIntent()Landroid/content/Intent;
    .locals 8

    .prologue
    .line 109
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.intent.action.SEND"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 111
    .local v2, "intent":Landroid/content/Intent;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->text:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 114
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->text:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    :cond_0
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->url:Ljava/net/URL;

    if-eqz v6, :cond_2

    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 119
    const/16 v6, 0x20

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 121
    :cond_1
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    :cond_2
    const-string v6, "android.intent.extra.TEXT"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 125
    const-string v6, "text/plain"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 127
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->imageUri:Landroid/net/Uri;

    if-eqz v6, :cond_3

    .line 128
    const-string v6, "android.intent.extra.STREAM"

    iget-object v7, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->imageUri:Landroid/net/Uri;

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 129
    const-string v6, "image/jpeg"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    :cond_3
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 133
    .local v3, "packManager":Landroid/content/pm/PackageManager;
    const/high16 v6, 0x10000

    invoke-virtual {v3, v2, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v5

    .line 136
    .local v5, "resolvedInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 137
    .local v4, "resolveInfo":Landroid/content/pm/ResolveInfo;
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string v7, "com.twitter.android"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 138
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v7, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v4    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :goto_0
    return-object v2

    .restart local v2    # "intent":Landroid/content/Intent;
    :cond_5
    const/4 v2, 0x0

    goto :goto_0
.end method

.method createWebIntent()Landroid/content/Intent;
    .locals 6

    .prologue
    .line 148
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->url:Ljava/net/URL;

    if-nez v2, :cond_0

    const-string v1, ""

    .line 150
    .local v1, "url":Ljava/lang/String;
    :goto_0
    const-string v2, "https://twitter.com/intent/tweet?text=%s&url=%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->text:Ljava/lang/String;

    invoke-static {v5}, Lio/fabric/sdk/android/services/network/UrlUtils;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v1}, Lio/fabric/sdk/android/services/network/UrlUtils;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, "tweetUrl":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    return-object v2

    .line 148
    .end local v0    # "tweetUrl":Ljava/lang/String;
    .end local v1    # "url":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public image(Landroid/net/Uri;)Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;
    .locals 2
    .param p1, "imageUri"    # Landroid/net/Uri;

    .prologue
    .line 82
    if-nez p1, :cond_0

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "imageUri must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->imageUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    .line 87
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "imageUri already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_1
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->imageUri:Landroid/net/Uri;

    .line 91
    return-object p0
.end method

.method public show()V
    .locals 2

    .prologue
    .line 159
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->createIntent()Landroid/content/Intent;

    move-result-object v0

    .line 160
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 161
    return-void
.end method

.method public text(Ljava/lang/String;)Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 51
    if-nez p1, :cond_0

    .line 52
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "text must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->text:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 56
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "text already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_1
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->text:Ljava/lang/String;

    .line 60
    return-object p0
.end method

.method public url(Ljava/net/URL;)Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;
    .locals 2
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 67
    if-nez p1, :cond_0

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "url must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->url:Ljava/net/URL;

    if-eqz v0, :cond_1

    .line 72
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "url already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_1
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;->url:Ljava/net/URL;

    .line 76
    return-object p0
.end method
