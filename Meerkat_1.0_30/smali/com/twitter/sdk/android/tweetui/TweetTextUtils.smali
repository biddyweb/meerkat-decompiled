.class final Lcom/twitter/sdk/android/tweetui/TweetTextUtils;
.super Ljava/lang/Object;
.source "TweetTextUtils.java"


# static fields
.field private static final PHOTO_TYPE:Ljava/lang/String; = "photo"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static adjustEntitiesWithOffsets(Ljava/util/List;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "entities":Ljava/util/List;, "Ljava/util/List<+Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    .local p1, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 178
    :cond_0
    return-void

    .line 164
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;

    .line 166
    .local v0, "entity":Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;
    iget v5, v0, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    .line 167
    .local v5, "start":I
    const/4 v4, 0x0

    .line 168
    .local v4, "offset":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 169
    .local v3, "index":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sub-int/2addr v6, v4

    if-gt v6, v5, :cond_2

    .line 170
    add-int/lit8 v4, v4, 0x1

    .line 174
    goto :goto_1

    .line 175
    .end local v3    # "index":Ljava/lang/Integer;
    :cond_2
    iget v6, v0, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    add-int/2addr v6, v4

    iput v6, v0, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    .line 176
    iget v6, v0, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->end:I

    add-int/2addr v6, v4

    iput v6, v0, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->end:I

    goto :goto_0
.end method

.method static adjustIndicesForEscapedChars(Ljava/util/List;Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;",
            ">;",
            "Ljava/util/List",
            "<[I>;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "entities":Ljava/util/List;, "Ljava/util/List<+Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;>;"
    .local p1, "indices":Ljava/util/List;, "Ljava/util/List<[I>;"
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 129
    :cond_0
    return-void

    .line 96
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    .line 97
    .local v9, "size":I
    const/4 v8, 0x0

    .line 98
    .local v8, "m":I
    const/4 v0, 0x0

    .line 108
    .local v0, "diff":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;

    .line 109
    .local v2, "entity":Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;
    const/4 v5, 0x0

    .line 111
    .local v5, "inDiff":I
    move v3, v8

    .local v3, "i":I
    :goto_1
    if-ge v3, v9, :cond_4

    .line 112
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [I

    .line 113
    .local v6, "index":[I
    const/4 v11, 0x0

    aget v10, v6, v11

    .line 114
    .local v10, "start":I
    const/4 v11, 0x1

    aget v1, v6, v11

    .line 116
    .local v1, "end":I
    sub-int v7, v1, v10

    .line 117
    .local v7, "len":I
    iget v11, v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    if-ge v1, v11, :cond_3

    .line 119
    add-int/2addr v0, v7

    .line 120
    add-int/lit8 v8, v8, 0x1

    .line 111
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 121
    :cond_3
    iget v11, v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->end:I

    if-ge v1, v11, :cond_2

    .line 122
    add-int/2addr v5, v7

    goto :goto_2

    .line 126
    .end local v1    # "end":I
    .end local v6    # "index":[I
    .end local v7    # "len":I
    .end local v10    # "start":I
    :cond_4
    iget v11, v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    sub-int/2addr v11, v0

    iput v11, v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->start:I

    .line 127
    iget v11, v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->end:I

    add-int v12, v0, v5

    sub-int/2addr v11, v12

    iput v11, v2, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;->end:I

    goto :goto_0
.end method

.method static adjustIndicesForSupplementaryChars(Ljava/lang/StringBuilder;Lcom/twitter/sdk/android/tweetui/FormattedTweetText;)V
    .locals 4
    .param p0, "content"    # Ljava/lang/StringBuilder;
    .param p1, "formattedTweetText"    # Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    .prologue
    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v0, "highSurrogateIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 143
    .local v2, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 144
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 146
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 150
    :cond_1
    iget-object v3, p1, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->urlEntities:Ljava/util/List;

    invoke-static {v3, v0}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->adjustEntitiesWithOffsets(Ljava/util/List;Ljava/util/List;)V

    .line 151
    iget-object v3, p1, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->mediaEntities:Ljava/util/List;

    invoke-static {v3, v0}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->adjustEntitiesWithOffsets(Ljava/util/List;Ljava/util/List;)V

    .line 152
    return-void
.end method

.method static convertEntities(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 7
    .param p0, "formattedTweetText"    # Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 44
    iget-object v6, p1, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    if-nez v6, :cond_1

    .line 61
    :cond_0
    return-void

    .line 46
    :cond_1
    iget-object v6, p1, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    iget-object v1, v6, Lcom/twitter/sdk/android/core/models/TweetEntities;->urls:Ljava/util/List;

    .line 47
    .local v1, "coreUrls":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/UrlEntity;>;"
    if-eqz v1, :cond_2

    .line 48
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/models/UrlEntity;

    .line 49
    .local v2, "entity":Lcom/twitter/sdk/android/core/models/UrlEntity;
    new-instance v4, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;

    invoke-direct {v4, v2}, Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;-><init>(Lcom/twitter/sdk/android/core/models/UrlEntity;)V

    .line 50
    .local v4, "formattedUrlEntity":Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->urlEntities:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 54
    .end local v2    # "entity":Lcom/twitter/sdk/android/core/models/UrlEntity;
    .end local v4    # "formattedUrlEntity":Lcom/twitter/sdk/android/tweetui/FormattedUrlEntity;
    .end local v5    # "i$":Ljava/util/Iterator;
    :cond_2
    iget-object v6, p1, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    iget-object v0, v6, Lcom/twitter/sdk/android/core/models/TweetEntities;->media:Ljava/util/List;

    .line 55
    .local v0, "coreMedia":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/MediaEntity;>;"
    if-eqz v0, :cond_0

    .line 56
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/models/MediaEntity;

    .line 57
    .local v2, "entity":Lcom/twitter/sdk/android/core/models/MediaEntity;
    new-instance v3, Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;

    invoke-direct {v3, v2}, Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;-><init>(Lcom/twitter/sdk/android/core/models/MediaEntity;)V

    .line 58
    .local v3, "formattedMediaEntity":Lcom/twitter/sdk/android/tweetui/FormattedMediaEntity;
    iget-object v6, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->mediaEntities:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method static format(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 4
    .param p0, "adjustedTweet"    # Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 71
    iget-object v2, p1, Lcom/twitter/sdk/android/core/models/Tweet;->text:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 80
    :goto_0
    return-void

    .line 73
    :cond_0
    sget-object v2, Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities;->HTML40:Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities;

    iget-object v3, p1, Lcom/twitter/sdk/android/core/models/Tweet;->text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities;->unescape(Ljava/lang/String;)Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities$Unescaped;

    move-result-object v1

    .line 74
    .local v1, "u":Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities$Unescaped;
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v2, v1, Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities$Unescaped;->unescaped:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->urlEntities:Ljava/util/List;

    iget-object v3, v1, Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities$Unescaped;->indices:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->adjustIndicesForEscapedChars(Ljava/util/List;Ljava/util/List;)V

    .line 77
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->mediaEntities:Ljava/util/List;

    iget-object v3, v1, Lcom/twitter/sdk/android/tweetui/internal/util/HtmlEntities$Unescaped;->indices:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->adjustIndicesForEscapedChars(Ljava/util/List;Ljava/util/List;)V

    .line 78
    invoke-static {v0, p0}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->adjustIndicesForSupplementaryChars(Ljava/lang/StringBuilder;Lcom/twitter/sdk/android/tweetui/FormattedTweetText;)V

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;->text:Ljava/lang/String;

    goto :goto_0
.end method

.method static formatTweetText(Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    .locals 1
    .param p0, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 27
    if-nez p0, :cond_0

    const/4 v0, 0x0

    .line 34
    :goto_0
    return-object v0

    .line 29
    :cond_0
    new-instance v0, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;

    invoke-direct {v0}, Lcom/twitter/sdk/android/tweetui/FormattedTweetText;-><init>()V

    .line 31
    .local v0, "adjustedTweet":Lcom/twitter/sdk/android/tweetui/FormattedTweetText;
    invoke-static {v0, p0}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->convertEntities(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 32
    invoke-static {v0, p0}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->format(Lcom/twitter/sdk/android/tweetui/FormattedTweetText;Lcom/twitter/sdk/android/core/models/Tweet;)V

    goto :goto_0
.end method

.method static getLastPhotoEntity(Lcom/twitter/sdk/android/core/models/TweetEntities;)Lcom/twitter/sdk/android/core/models/MediaEntity;
    .locals 6
    .param p0, "entities"    # Lcom/twitter/sdk/android/core/models/TweetEntities;

    .prologue
    const/4 v3, 0x0

    .line 187
    if-nez p0, :cond_1

    move-object v0, v3

    .line 199
    :cond_0
    :goto_0
    return-object v0

    .line 189
    :cond_1
    iget-object v2, p0, Lcom/twitter/sdk/android/core/models/TweetEntities;->media:Ljava/util/List;

    .line 190
    .local v2, "mediaEntityList":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/MediaEntity;>;"
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_2
    move-object v0, v3

    goto :goto_0

    .line 193
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_5

    .line 194
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/models/MediaEntity;

    .line 195
    .local v0, "entity":Lcom/twitter/sdk/android/core/models/MediaEntity;
    iget-object v4, v0, Lcom/twitter/sdk/android/core/models/MediaEntity;->type:Ljava/lang/String;

    if-eqz v4, :cond_4

    iget-object v4, v0, Lcom/twitter/sdk/android/core/models/MediaEntity;->type:Ljava/lang/String;

    const-string v5, "photo"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 193
    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .end local v0    # "entity":Lcom/twitter/sdk/android/core/models/MediaEntity;
    :cond_5
    move-object v0, v3

    .line 199
    goto :goto_0
.end method

.method static hasPhotoUrl(Lcom/twitter/sdk/android/core/models/TweetEntities;)Z
    .locals 1
    .param p0, "entities"    # Lcom/twitter/sdk/android/core/models/TweetEntities;

    .prologue
    .line 209
    invoke-static {p0}, Lcom/twitter/sdk/android/tweetui/TweetTextUtils;->getLastPhotoEntity(Lcom/twitter/sdk/android/core/models/TweetEntities;)Lcom/twitter/sdk/android/core/models/MediaEntity;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
