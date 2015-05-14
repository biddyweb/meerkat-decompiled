.class public Lcom/twitter/sdk/android/core/models/Tweet;
.super Ljava/lang/Object;
.source "Tweet.java"


# static fields
.field public static final INVALID_ID:J = -0x1L


# instance fields
.field public final coordinates:Lcom/twitter/sdk/android/core/models/Coordinates;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "coordinates"
    .end annotation
.end field

.field public final createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation
.end field

.field public final currentUserRetweet:Ljava/lang/Object;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "current_user_retweet"
    .end annotation
.end field

.field public final entities:Lcom/twitter/sdk/android/core/models/TweetEntities;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "entities"
    .end annotation
.end field

.field public final favoriteCount:Ljava/lang/Integer;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "favorite_count"
    .end annotation
.end field

.field public final favorited:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "favorited"
    .end annotation
.end field

.field public final filterLevel:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "filter_level"
    .end annotation
.end field

.field public final id:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field public final idStr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id_str"
    .end annotation
.end field

.field public final inReplyToScreenName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "in_reply_to_screen_name"
    .end annotation
.end field

.field public final inReplyToStatusId:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "in_reply_to_status_id"
    .end annotation
.end field

.field public final inReplyToStatusIdStr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "in_reply_to_status_id_str"
    .end annotation
.end field

.field public final inReplyToUserId:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "in_reply_to_user_id"
    .end annotation
.end field

.field public final inReplyToUserIdStr:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "in_reply_to_user_id_str"
    .end annotation
.end field

.field public final lang:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "lang"
    .end annotation
.end field

.field public final place:Lcom/twitter/sdk/android/core/models/Place;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "place"
    .end annotation
.end field

.field public final possiblySensitive:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "possibly_sensitive"
    .end annotation
.end field

.field public final retweetCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "retweet_count"
    .end annotation
.end field

.field public final retweeted:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "retweeted"
    .end annotation
.end field

.field public final retweetedStatus:Lcom/twitter/sdk/android/core/models/Tweet;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "retweeted_status"
    .end annotation
.end field

.field public final scopes:Ljava/lang/Object;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "scopes"
    .end annotation
.end field

.field public final source:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "source"
    .end annotation
.end field

.field public final text:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "text"
    .end annotation
.end field

.field public final truncated:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "truncated"
    .end annotation
.end field

.field public final user:Lcom/twitter/sdk/android/core/models/User;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user"
    .end annotation
.end field

.field public final withheldCopyright:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "withheld_copyright"
    .end annotation
.end field

.field public final withheldInCountries:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "withheld_in_countries"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final withheldScope:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "withheld_scope"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/models/Coordinates;Ljava/lang/String;Ljava/lang/Object;Lcom/twitter/sdk/android/core/models/TweetEntities;Ljava/lang/Integer;ZLjava/lang/String;JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/models/Place;ZLjava/lang/Object;IZLcom/twitter/sdk/android/core/models/Tweet;Ljava/lang/String;Ljava/lang/String;ZLcom/twitter/sdk/android/core/models/User;ZLjava/util/List;Ljava/lang/String;)V
    .locals 2
    .param p1, "coordinates"    # Lcom/twitter/sdk/android/core/models/Coordinates;
    .param p2, "createdAt"    # Ljava/lang/String;
    .param p3, "currentUserRetweet"    # Ljava/lang/Object;
    .param p4, "entities"    # Lcom/twitter/sdk/android/core/models/TweetEntities;
    .param p5, "favoriteCount"    # Ljava/lang/Integer;
    .param p6, "favorited"    # Z
    .param p7, "filterLevel"    # Ljava/lang/String;
    .param p8, "id"    # J
    .param p10, "idStr"    # Ljava/lang/String;
    .param p11, "inReplyToScreenName"    # Ljava/lang/String;
    .param p12, "inReplyToStatusId"    # J
    .param p14, "inReplyToStatusIdStr"    # Ljava/lang/String;
    .param p15, "inReplyToUserId"    # J
    .param p17, "inReplyToUserIdStr"    # Ljava/lang/String;
    .param p18, "lang"    # Ljava/lang/String;
    .param p19, "place"    # Lcom/twitter/sdk/android/core/models/Place;
    .param p20, "possiblySensitive"    # Z
    .param p21, "scopes"    # Ljava/lang/Object;
    .param p22, "retweetCount"    # I
    .param p23, "retweeted"    # Z
    .param p24, "retweetedStatus"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .param p25, "source"    # Ljava/lang/String;
    .param p26, "text"    # Ljava/lang/String;
    .param p27, "truncated"    # Z
    .param p28, "user"    # Lcom/twitter/sdk/android/core/models/User;
    .param p29, "withheldCopyright"    # Z
    .param p31, "withheldScope"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/models/Coordinates;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Lcom/twitter/sdk/android/core/models/TweetEntities;",
            "Ljava/lang/Integer;",
            "Z",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/models/Place;",
            "Z",
            "Ljava/lang/Object;",
            "IZ",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/twitter/sdk/android/core/models/User;",
            "Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 234
    .local p30, "withheldInCountries":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 235
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/Tweet;->coordinates:Lcom/twitter/sdk/android/core/models/Coordinates;

    .line 236
    iput-object p2, p0, Lcom/twitter/sdk/android/core/models/Tweet;->createdAt:Ljava/lang/String;

    .line 237
    iput-object p3, p0, Lcom/twitter/sdk/android/core/models/Tweet;->currentUserRetweet:Ljava/lang/Object;

    .line 238
    iput-object p4, p0, Lcom/twitter/sdk/android/core/models/Tweet;->entities:Lcom/twitter/sdk/android/core/models/TweetEntities;

    .line 239
    iput-object p5, p0, Lcom/twitter/sdk/android/core/models/Tweet;->favoriteCount:Ljava/lang/Integer;

    .line 240
    iput-boolean p6, p0, Lcom/twitter/sdk/android/core/models/Tweet;->favorited:Z

    .line 241
    iput-object p7, p0, Lcom/twitter/sdk/android/core/models/Tweet;->filterLevel:Ljava/lang/String;

    .line 242
    iput-wide p8, p0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    .line 243
    iput-object p10, p0, Lcom/twitter/sdk/android/core/models/Tweet;->idStr:Ljava/lang/String;

    .line 244
    iput-object p11, p0, Lcom/twitter/sdk/android/core/models/Tweet;->inReplyToScreenName:Ljava/lang/String;

    .line 245
    iput-wide p12, p0, Lcom/twitter/sdk/android/core/models/Tweet;->inReplyToStatusId:J

    .line 246
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->inReplyToStatusIdStr:Ljava/lang/String;

    .line 247
    move-wide/from16 v0, p15

    iput-wide v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->inReplyToUserId:J

    .line 248
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->inReplyToUserIdStr:Ljava/lang/String;

    .line 249
    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->lang:Ljava/lang/String;

    .line 250
    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->place:Lcom/twitter/sdk/android/core/models/Place;

    .line 251
    move/from16 v0, p20

    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->possiblySensitive:Z

    .line 252
    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->scopes:Ljava/lang/Object;

    .line 253
    move/from16 v0, p22

    iput v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->retweetCount:I

    .line 254
    move/from16 v0, p23

    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->retweeted:Z

    .line 255
    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->retweetedStatus:Lcom/twitter/sdk/android/core/models/Tweet;

    .line 256
    move-object/from16 v0, p25

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->source:Ljava/lang/String;

    .line 257
    move-object/from16 v0, p26

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->text:Ljava/lang/String;

    .line 258
    move/from16 v0, p27

    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->truncated:Z

    .line 259
    move-object/from16 v0, p28

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    .line 260
    move/from16 v0, p29

    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->withheldCopyright:Z

    .line 261
    move-object/from16 v0, p30

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->withheldInCountries:Ljava/util/List;

    .line 262
    move-object/from16 v0, p31

    iput-object v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->withheldScope:Ljava/lang/String;

    .line 263
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 267
    if-nez p1, :cond_1

    .line 270
    :cond_0
    :goto_0
    return v1

    .line 268
    :cond_1
    instance-of v2, p1, Lcom/twitter/sdk/android/core/models/Tweet;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 269
    check-cast v0, Lcom/twitter/sdk/android/core/models/Tweet;

    .line 270
    .local v0, "other":Lcom/twitter/sdk/android/core/models/Tweet;
    iget-wide v2, p0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    iget-wide v4, v0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 275
    iget-wide v0, p0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    long-to-int v0, v0

    return v0
.end method
