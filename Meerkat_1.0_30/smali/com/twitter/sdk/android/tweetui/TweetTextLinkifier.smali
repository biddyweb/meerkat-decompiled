.class final Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier;
.super Ljava/lang/Object;
.source "TweetTextLinkifier.java"


# static fields
.field private static final PHOTO_TYPE:Ljava/lang/String; = "photo"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addUrlEntities(Landroid/text/SpannableStringBuilder;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;Lcom/twitter/sdk/android/tweetui/LinkClickListener;I)V
    .locals 9
    .param p0, "spannable"    # Landroid/text/SpannableStringBuilder;
    .param p2, "lastPhoto"    # Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    .param p3, "listener"    # Lcom/twitter/sdk/android/tweetui/LinkClickListener;
    .param p4, "linkColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;",
            ">;",
            "Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;",
            "Lcom/twitter/sdk/android/tweetui/LinkClickListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 147
    :cond_0
    return-void

    .line 108
    :cond_1
    const/4 v3, 0x0

    .line 112
    .local v3, "offset":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;

    .line 113
    .local v6, "url":Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;
    iget v7, v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    sub-int v5, v7, v3

    .line 114
    .local v5, "start":I
    iget v7, v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->end:I

    sub-int v0, v7, v3

    .line 115
    .local v0, "end":I
    if-ltz v5, :cond_2

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7

    if-gt v0, v7, :cond_2

    .line 119
    if-eqz p2, :cond_3

    iget v7, p2, Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;->start:I

    iget v8, v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    if-ne v7, v8, :cond_3

    .line 120
    const-string v7, ""

    invoke-virtual {p0, v5, v0, v7}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 121
    sub-int v2, v0, v5

    .line 122
    .local v2, "len":I
    sub-int/2addr v0, v2

    .line 123
    add-int/2addr v3, v2

    goto :goto_0

    .line 124
    .end local v2    # "len":I
    :cond_3
    iget-object v7, v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->displayUrl:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 125
    iget-object v7, v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->displayUrl:Ljava/lang/String;

    invoke-virtual {p0, v5, v0, v7}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 126
    iget-object v7, v6, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->displayUrl:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v7, v5

    sub-int v2, v0, v7

    .line 127
    .restart local v2    # "len":I
    sub-int/2addr v0, v2

    .line 128
    add-int/2addr v3, v2

    .line 130
    new-instance v4, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;

    invoke-direct {v4, p3, v6, p4}, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$2;-><init>(Lcom/twitter/sdk/android/tweetui/LinkClickListener;Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;I)V

    .line 143
    .local v4, "span":Landroid/text/style/CharacterStyle;
    const/16 v7, 0x21

    invoke-virtual {p0, v4, v5, v0, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_0
.end method

.method private static getLastPhotoEntity(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;)Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    .locals 6
    .param p0, "formattedTweetText"    # Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    .prologue
    const/4 v3, 0x0

    .line 151
    if-nez p0, :cond_1

    move-object v0, v3

    .line 164
    :cond_0
    :goto_0
    return-object v0

    .line 153
    :cond_1
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->mediaEntities:Ljava/util/List;

    .line 155
    .local v2, "mediaEntityList":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v0, v3

    goto :goto_0

    .line 158
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_3

    .line 159
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;

    .line 160
    .local v0, "entity":Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    const-string v4, "photo"

    iget-object v5, v0, Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;->type:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 158
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .end local v0    # "entity":Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    :cond_3
    move-object v0, v3

    .line 164
    goto :goto_0
.end method

.method static linkifyUrls(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;Lcom/twitter/sdk/android/tweetui/LinkClickListener;ZI)Ljava/lang/CharSequence;
    .locals 6
    .param p0, "tweetText"    # Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    .param p1, "listener"    # Lcom/twitter/sdk/android/tweetui/LinkClickListener;
    .param p2, "stripLastPhotoEntity"    # Z
    .param p3, "linkColor"    # I

    .prologue
    .line 33
    if-nez p0, :cond_0

    const/4 v3, 0x0

    .line 60
    :goto_0
    return-object v3

    .line 35
    :cond_0
    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->text:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 36
    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->text:Ljava/lang/String;

    goto :goto_0

    .line 39
    :cond_1
    new-instance v3, Landroid/text/SpannableStringBuilder;

    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->text:Ljava/lang/String;

    invoke-direct {v3, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 42
    .local v3, "spannable":Landroid/text/SpannableStringBuilder;
    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->urlEntities:Ljava/util/List;

    .line 44
    .local v4, "urls":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->mediaEntities:Ljava/util/List;

    .line 47
    .local v2, "media":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;>;"
    if-eqz p2, :cond_2

    .line 48
    invoke-static {p0}, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier;->getLastPhotoEntity(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;)Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;

    move-result-object v1

    .line 57
    .local v1, "lastPhoto":Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    :goto_1
    invoke-static {v4, v2}, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier;->mergeAndSortEntities(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 59
    .local v0, "combined":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    invoke-static {v3, v0, v1, p1, p3}, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier;->addUrlEntities(Landroid/text/SpannableStringBuilder;Ljava/util/List;Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;Lcom/twitter/sdk/android/tweetui/LinkClickListener;I)V

    goto :goto_0

    .line 50
    .end local v0    # "combined":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    .end local v1    # "lastPhoto":Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "lastPhoto":Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    goto :goto_1
.end method

.method static mergeAndSortEntities(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "urls":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    .local p1, "media":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;>;"
    if-nez p1, :cond_0

    .line 90
    .end local p0    # "urls":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    :goto_0
    return-object p0

    .line 75
    .restart local p0    # "urls":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 77
    .local v0, "combined":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 78
    new-instance v1, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$1;

    invoke-direct {v1}, Lcom/twitter/sdk/android/tweetui/TweetTextLinkifier$1;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move-object p0, v0

    .line 90
    goto :goto_0
.end method
