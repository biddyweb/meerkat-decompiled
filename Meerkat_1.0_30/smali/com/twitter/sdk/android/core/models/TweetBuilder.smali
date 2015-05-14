.class public Lcom/twitter/sdk/android/core/models/TweetBuilder;
.super Ljava/lang/Object;
.source "TweetBuilder.java"


# instance fields
.field private coordinates:Lcom/twitter/sdk/android/core/models/Coordinates;

.field private createdAt:Ljava/lang/String;

.field private currentUserRetweet:Ljava/lang/Object;

.field private entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

.field private favoriteCount:Ljava/lang/Integer;

.field private favorited:Z

.field private filterLevel:Ljava/lang/String;

.field private id:J

.field private idStr:Ljava/lang/String;

.field private inReplyToScreenName:Ljava/lang/String;

.field private inReplyToStatusId:J

.field private inReplyToStatusIdStr:Ljava/lang/String;

.field private inReplyToUserId:J

.field private inReplyToUserIdStr:Ljava/lang/String;

.field private lang:Ljava/lang/String;

.field private place:Lcom/twitter/sdk/android/core/models/Place;

.field private possiblySensitive:Z

.field private retweetCount:I

.field private retweeted:Z

.field private retweetedStatus:Lcom/twitter/sdk/android/core/models/Tweet;

.field private scopes:Ljava/lang/Object;

.field private source:Ljava/lang/String;

.field private text:Ljava/lang/String;

.field private truncated:Z

.field private user:Lcom/twitter/sdk/android/core/models/User;

.field private withheldCopyright:Z

.field private withheldInCountries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private withheldScope:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->id:J

    return-void
.end method


# virtual methods
.method public build()Lcom/twitter/sdk/android/core/models/Tweet;
    .locals 34

    .prologue
    .line 176
    new-instance v2, Lcom/twitter/sdk/android/core/models/Tweet;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->coordinates:Lcom/twitter/sdk/android/core/models/Coordinates;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->createdAt:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->currentUserRetweet:Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->favoriteCount:Ljava/lang/Integer;

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->favorited:Z

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->filterLevel:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->id:J

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->idStr:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToScreenName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToStatusId:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToStatusIdStr:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToUserId:J

    move-wide/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToUserIdStr:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->lang:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->place:Lcom/twitter/sdk/android/core/models/Place;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->possiblySensitive:Z

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->scopes:Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->retweetCount:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->retweeted:Z

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->retweetedStatus:Lcom/twitter/sdk/android/core/models/Tweet;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->source:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->text:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->truncated:Z

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->user:Lcom/twitter/sdk/android/core/models/User;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->withheldCopyright:Z

    move/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->withheldInCountries:Ljava/util/List;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->withheldScope:Ljava/lang/String;

    move-object/from16 v33, v0

    invoke-direct/range {v2 .. v33}, Lcom/twitter/sdk/android/core/models/Tweet;-><init>(Lcom/twitter/sdk/android/core/models/Coordinates;Ljava/lang/String;Ljava/lang/Object;Lcom/twitter/sdk/android/core/models/TweetEntities;Ljava/lang/Integer;ZLjava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/models/Place;ZLjava/lang/Object;IZLcom/twitter/sdk/android/core/models/Tweet;Ljava/lang/String;Ljava/lang/String;ZLcom/twitter/sdk/android/core/models/User;ZLjava/util/List;Ljava/lang/String;)V

    return-object v2
.end method

.method public setCoordinates(Lcom/twitter/sdk/android/core/models/Coordinates;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "coordinates"    # Lcom/twitter/sdk/android/core/models/Coordinates;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->coordinates:Lcom/twitter/sdk/android/core/models/Coordinates;

    .line 37
    return-object p0
.end method

.method public setCreatedAt(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "createdAt"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->createdAt:Ljava/lang/String;

    .line 42
    return-object p0
.end method

.method public setCurrentUserRetweet(Ljava/lang/Object;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "currentUserRetweet"    # Ljava/lang/Object;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->currentUserRetweet:Ljava/lang/Object;

    .line 47
    return-object p0
.end method

.method public setEntities(Lcom/twitter/sdk/android/core/models/TweetEntities;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "entities"    # Lcom/twitter/sdk/android/core/models/TweetEntities;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    .line 52
    return-object p0
.end method

.method public setFavoriteCount(Ljava/lang/Integer;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "favoriteCount"    # Ljava/lang/Integer;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->favoriteCount:Ljava/lang/Integer;

    .line 57
    return-object p0
.end method

.method public setFavorited(Z)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "favorited"    # Z

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->favorited:Z

    .line 62
    return-object p0
.end method

.method public setFilterLevel(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "filterLevel"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->filterLevel:Ljava/lang/String;

    .line 67
    return-object p0
.end method

.method public setId(J)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 71
    iput-wide p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->id:J

    .line 72
    return-object p0
.end method

.method public setIdStr(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "idStr"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->idStr:Ljava/lang/String;

    .line 77
    return-object p0
.end method

.method public setInReplyToScreenName(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "inReplyToScreenName"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToScreenName:Ljava/lang/String;

    .line 82
    return-object p0
.end method

.method public setInReplyToStatusId(J)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 1
    .param p1, "inReplyToStatusId"    # J

    .prologue
    .line 86
    iput-wide p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToStatusId:J

    .line 87
    return-object p0
.end method

.method public setInReplyToStatusIdStr(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "inReplyToStatusIdStr"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToStatusIdStr:Ljava/lang/String;

    .line 92
    return-object p0
.end method

.method public setInReplyToUserId(J)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 1
    .param p1, "inReplyToUserId"    # J

    .prologue
    .line 96
    iput-wide p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToUserId:J

    .line 97
    return-object p0
.end method

.method public setInReplyToUserIdStr(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "inReplyToUserIdStr"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->inReplyToUserIdStr:Ljava/lang/String;

    .line 102
    return-object p0
.end method

.method public setLang(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "lang"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->lang:Ljava/lang/String;

    .line 107
    return-object p0
.end method

.method public setPlace(Lcom/twitter/sdk/android/core/models/Place;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "place"    # Lcom/twitter/sdk/android/core/models/Place;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->place:Lcom/twitter/sdk/android/core/models/Place;

    .line 112
    return-object p0
.end method

.method public setPossiblySensitive(Z)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "possiblySensitive"    # Z

    .prologue
    .line 116
    iput-boolean p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->possiblySensitive:Z

    .line 117
    return-object p0
.end method

.method public setRetweetCount(I)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "retweetCount"    # I

    .prologue
    .line 126
    iput p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->retweetCount:I

    .line 127
    return-object p0
.end method

.method public setRetweeted(Z)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "retweeted"    # Z

    .prologue
    .line 131
    iput-boolean p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->retweeted:Z

    .line 132
    return-object p0
.end method

.method public setRetweetedStatus(Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "retweetedStatus"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->retweetedStatus:Lcom/twitter/sdk/android/core/models/Tweet;

    .line 137
    return-object p0
.end method

.method public setScopes(Ljava/lang/Object;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "scopes"    # Ljava/lang/Object;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->scopes:Ljava/lang/Object;

    .line 122
    return-object p0
.end method

.method public setSource(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->source:Ljava/lang/String;

    .line 142
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->text:Ljava/lang/String;

    .line 147
    return-object p0
.end method

.method public setTruncated(Z)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "truncated"    # Z

    .prologue
    .line 151
    iput-boolean p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->truncated:Z

    .line 152
    return-object p0
.end method

.method public setUser(Lcom/twitter/sdk/android/core/models/User;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "user"    # Lcom/twitter/sdk/android/core/models/User;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->user:Lcom/twitter/sdk/android/core/models/User;

    .line 157
    return-object p0
.end method

.method public setWithheldCopyright(Z)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "withheldCopyright"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->withheldCopyright:Z

    .line 162
    return-object p0
.end method

.method public setWithheldInCountries(Ljava/util/List;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/twitter/sdk/android/core/models/TweetBuilder;"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, "withheldInCountries":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->withheldInCountries:Ljava/util/List;

    .line 167
    return-object p0
.end method

.method public setWithheldScope(Ljava/lang/String;)Lcom/twitter/sdk/android/core/models/TweetBuilder;
    .locals 0
    .param p1, "withheldScope"    # Ljava/lang/String;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/TweetBuilder;->withheldScope:Ljava/lang/String;

    .line 172
    return-object p0
.end method
