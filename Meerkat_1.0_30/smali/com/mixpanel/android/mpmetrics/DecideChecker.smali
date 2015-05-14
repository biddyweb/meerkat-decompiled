.class Lcom/mixpanel/android/mpmetrics/DecideChecker;
.super Ljava/lang/Object;
.source "DecideChecker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;,
        Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    }
.end annotation


# static fields
.field private static final EMPTY_JSON_ARRAY:Lorg/json/JSONArray;

.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.DecideChecker"


# instance fields
.field private final mChecks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/mpmetrics/DecideMessages;",
            ">;"
        }
    .end annotation
.end field

.field private final mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 255
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    sput-object v0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->EMPTY_JSON_ARRAY:Lorg/json/JSONArray;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MPConfig;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "config"    # Lcom/mixpanel/android/mpmetrics/MPConfig;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mContext:Landroid/content/Context;

    .line 40
    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    .line 41
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mChecks:Ljava/util/List;

    .line 42
    return-void
.end method

.method static synthetic access$000()Lorg/json/JSONArray;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->EMPTY_JSON_ARRAY:Lorg/json/JSONArray;

    return-object v0
.end method

.method private getDecideResponseFromServer(Ljava/lang/String;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/ServerMessage;)Ljava/lang/String;
    .locals 12
    .param p1, "unescapedToken"    # Ljava/lang/String;
    .param p2, "unescapedDistinctId"    # Ljava/lang/String;
    .param p3, "poster"    # Lcom/mixpanel/android/mpmetrics/ServerMessage;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 174
    :try_start_0
    const-string v7, "utf-8"

    invoke-static {p1, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 175
    .local v3, "escapedToken":Ljava/lang/String;
    if-eqz p2, :cond_2

    .line 176
    const-string v7, "utf-8"

    invoke-static {p2, v7}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 184
    .local v2, "escapedId":Ljava/lang/String;
    :goto_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "?version=1&lib=android&token="

    .line 185
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 186
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 188
    .local v4, "queryBuilder":Ljava/lang/StringBuilder;
    if-eqz v2, :cond_0

    .line 189
    const-string v7, "&distinct_id="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 194
    .local v0, "checkQuery":Ljava/lang/String;
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    invoke-virtual {v7}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableFallback()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 195
    new-array v6, v11, [Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDecideEndpoint()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    .line 201
    .local v6, "urls":[Ljava/lang/String;
    :goto_1
    sget-boolean v7, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v7, :cond_1

    .line 202
    const-string v7, "MixpanelAPI.DecideChecker"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Querying decide server at "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v6, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const-string v7, "MixpanelAPI.DecideChecker"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "    (with fallback "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v6, v11

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    :cond_1
    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mContext:Landroid/content/Context;

    invoke-virtual {p3, v7, v6}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->getUrls(Landroid/content/Context;[Ljava/lang/String;)[B

    move-result-object v5

    .line 207
    .local v5, "response":[B
    if-nez v5, :cond_4

    .line 208
    const/4 v7, 0x0

    .line 211
    :goto_2
    return-object v7

    .line 178
    .end local v0    # "checkQuery":Ljava/lang/String;
    .end local v2    # "escapedId":Ljava/lang/String;
    .end local v4    # "queryBuilder":Ljava/lang/StringBuilder;
    .end local v5    # "response":[B
    .end local v6    # "urls":[Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    .restart local v2    # "escapedId":Ljava/lang/String;
    goto/16 :goto_0

    .line 180
    .end local v2    # "escapedId":Ljava/lang/String;
    .end local v3    # "escapedToken":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 181
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Mixpanel library requires utf-8 string encoding to be available"

    invoke-direct {v7, v8, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 197
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "checkQuery":Ljava/lang/String;
    .restart local v2    # "escapedId":Ljava/lang/String;
    .restart local v3    # "escapedToken":Ljava/lang/String;
    .restart local v4    # "queryBuilder":Ljava/lang/StringBuilder;
    :cond_3
    const/4 v7, 0x2

    new-array v6, v7, [Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDecideEndpoint()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    .line 198
    invoke-virtual {v8}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDecideFallbackEndpoint()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v11

    .restart local v6    # "urls":[Ljava/lang/String;
    goto/16 :goto_1

    .line 211
    .restart local v5    # "response":[B
    :cond_4
    :try_start_1
    new-instance v7, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v7, v5, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 212
    :catch_1
    move-exception v1

    .line 213
    .restart local v1    # "e":Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "UTF not supported on this platform?"

    invoke-direct {v7, v8, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method

.method private static getDisplayWidth(Landroid/view/Display;)I
    .locals 3
    .param p0, "display"    # Landroid/view/Display;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 242
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xd

    if-ge v1, v2, :cond_0

    .line 243
    invoke-virtual {p0}, Landroid/view/Display;->getWidth()I

    move-result v1

    .line 247
    :goto_0
    return v1

    .line 245
    :cond_0
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 246
    .local v0, "displaySize":Landroid/graphics/Point;
    invoke-virtual {p0, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 247
    iget v1, v0, Landroid/graphics/Point;->x:I

    goto :goto_0
.end method

.method private static getNotificationImage(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/ServerMessage;)Landroid/graphics/Bitmap;
    .locals 10
    .param p0, "notification"    # Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "poster"    # Lcom/mixpanel/android/mpmetrics/ServerMessage;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 218
    const/4 v3, 0x0

    .line 219
    .local v3, "ret":Landroid/graphics/Bitmap;
    new-array v4, v9, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getImage2xUrl()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v8

    .line 221
    .local v4, "urls":[Ljava/lang/String;
    const-string v6, "window"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    .line 222
    .local v5, "wm":Landroid/view/WindowManager;
    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 223
    .local v0, "display":Landroid/view/Display;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->getDisplayWidth(Landroid/view/Display;)I

    move-result v1

    .line 225
    .local v1, "displayWidth":I
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getType()Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;

    move-result-object v6

    sget-object v7, Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;->TAKEOVER:Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;

    if-ne v6, v7, :cond_0

    const/16 v6, 0x2d0

    if-lt v1, v6, :cond_0

    .line 226
    const/4 v6, 0x2

    new-array v4, v6, [Ljava/lang/String;

    .end local v4    # "urls":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getImage4xUrl()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v8

    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getImage2xUrl()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v9

    .line 229
    .restart local v4    # "urls":[Ljava/lang/String;
    :cond_0
    invoke-virtual {p2, p1, v4}, Lcom/mixpanel/android/mpmetrics/ServerMessage;->getUrls(Landroid/content/Context;[Ljava/lang/String;)[B

    move-result-object v2

    .line 230
    .local v2, "response":[B
    if-eqz v2, :cond_1

    .line 231
    array-length v6, v2

    invoke-static {v2, v8, v6}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 236
    :goto_0
    return-object v3

    .line 233
    :cond_1
    const-string v6, "MixpanelAPI.DecideChecker"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to download images from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static parseDecideResponse(Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    .locals 15
    .param p0, "responseString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v8, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;

    invoke-direct {v8}, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;-><init>()V

    .line 104
    .local v8, "ret":Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .local v7, "response":Lorg/json/JSONObject;
    const/4 v11, 0x0

    .line 111
    .local v11, "surveys":Lorg/json/JSONArray;
    const-string v12, "surveys"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 113
    :try_start_1
    const-string v12, "surveys"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v11

    .line 119
    :cond_0
    :goto_0
    if-eqz v11, :cond_1

    .line 120
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v1, v12, :cond_1

    .line 122
    :try_start_2
    invoke-virtual {v11, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 123
    .local v10, "surveyJson":Lorg/json/JSONObject;
    new-instance v9, Lcom/mixpanel/android/mpmetrics/Survey;

    invoke-direct {v9, v10}, Lcom/mixpanel/android/mpmetrics/Survey;-><init>(Lorg/json/JSONObject;)V

    .line 124
    .local v9, "survey":Lcom/mixpanel/android/mpmetrics/Survey;
    iget-object v12, v8, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->surveys:Ljava/util/List;

    invoke-interface {v12, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lcom/mixpanel/android/mpmetrics/BadDecideObjectException; {:try_start_2 .. :try_end_2} :catch_3

    .line 120
    .end local v9    # "survey":Lcom/mixpanel/android/mpmetrics/Survey;
    .end local v10    # "surveyJson":Lorg/json/JSONObject;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 105
    .end local v1    # "i":I
    .end local v7    # "response":Lorg/json/JSONObject;
    .end local v11    # "surveys":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Lorg/json/JSONException;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Mixpanel endpoint returned unparsable result:\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 107
    .local v2, "message":Ljava/lang/String;
    new-instance v12, Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;

    invoke-direct {v12, v2, v0}, Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;-><init>(Ljava/lang/String;Lorg/json/JSONException;)V

    throw v12

    .line 114
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "message":Ljava/lang/String;
    .restart local v7    # "response":Lorg/json/JSONObject;
    .restart local v11    # "surveys":Lorg/json/JSONArray;
    :catch_1
    move-exception v0

    .line 115
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Mixpanel endpoint returned non-array JSON for surveys: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 125
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "i":I
    :catch_2
    move-exception v0

    .line 126
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Received a strange response from surveys service: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 127
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_3
    move-exception v0

    .line 128
    .local v0, "e":Lcom/mixpanel/android/mpmetrics/BadDecideObjectException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Received a strange response from surveys service: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 133
    .end local v0    # "e":Lcom/mixpanel/android/mpmetrics/BadDecideObjectException;
    .end local v1    # "i":I
    :cond_1
    const/4 v5, 0x0

    .line 134
    .local v5, "notifications":Lorg/json/JSONArray;
    const-string v12, "notifications"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 136
    :try_start_3
    const-string v12, "notifications"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_4

    move-result-object v5

    .line 142
    :cond_2
    :goto_3
    if-eqz v5, :cond_3

    .line 143
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v12

    const/4 v13, 0x2

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 144
    .local v6, "notificationsToRead":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    if-ge v1, v6, :cond_3

    .line 146
    :try_start_4
    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 147
    .local v4, "notificationJson":Lorg/json/JSONObject;
    new-instance v3, Lcom/mixpanel/android/mpmetrics/InAppNotification;

    invoke-direct {v3, v4}, Lcom/mixpanel/android/mpmetrics/InAppNotification;-><init>(Lorg/json/JSONObject;)V

    .line 148
    .local v3, "notification":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    iget-object v12, v8, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->notifications:Ljava/util/List;

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Lcom/mixpanel/android/mpmetrics/BadDecideObjectException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_7

    .line 144
    .end local v3    # "notification":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .end local v4    # "notificationJson":Lorg/json/JSONObject;
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 137
    .end local v1    # "i":I
    .end local v6    # "notificationsToRead":I
    :catch_4
    move-exception v0

    .line 138
    .local v0, "e":Lorg/json/JSONException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Mixpanel endpoint returned non-array JSON for notifications: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 149
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "i":I
    .restart local v6    # "notificationsToRead":I
    :catch_5
    move-exception v0

    .line 150
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Received a strange response from notifications service: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .line 151
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_6
    move-exception v0

    .line 152
    .local v0, "e":Lcom/mixpanel/android/mpmetrics/BadDecideObjectException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Received a strange response from notifications service: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .line 153
    .end local v0    # "e":Lcom/mixpanel/android/mpmetrics/BadDecideObjectException;
    :catch_7
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Not enough memory to show load notification from package: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .line 159
    .end local v0    # "e":Ljava/lang/OutOfMemoryError;
    .end local v1    # "i":I
    .end local v6    # "notificationsToRead":I
    :cond_3
    const-string v12, "event_bindings"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 161
    :try_start_5
    const-string v12, "event_bindings"

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    iput-object v12, v8, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->eventBindings:Lorg/json/JSONArray;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_8

    .line 167
    :cond_4
    :goto_6
    return-object v8

    .line 162
    :catch_8
    move-exception v0

    .line 163
    .local v0, "e":Lorg/json/JSONException;
    const-string v12, "MixpanelAPI.DecideChecker"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Mixpanel endpoint returned non-array JSON for event bindings: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6
.end method

.method private runDecideCheck(Ljava/lang/String;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/ServerMessage;)Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    .locals 8
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "distinctId"    # Ljava/lang/String;
    .param p3, "poster"    # Lcom/mixpanel/android/mpmetrics/ServerMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-direct {p0, p1, p2, p3}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->getDecideResponseFromServer(Ljava/lang/String;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/ServerMessage;)Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "responseString":Ljava/lang/String;
    sget-boolean v5, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v5, :cond_0

    .line 74
    const-string v5, "MixpanelAPI.DecideChecker"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Mixpanel decide server response was:\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :cond_0
    new-instance v3, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;

    invoke-direct {v3}, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;-><init>()V

    .line 78
    .local v3, "parsed":Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    if-eqz v4, :cond_1

    .line 79
    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->parseDecideResponse(Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;

    move-result-object v3

    .line 82
    :cond_1
    iget-object v5, v3, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->notifications:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 83
    .local v2, "notificationIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mixpanel/android/mpmetrics/InAppNotification;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 84
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mixpanel/android/mpmetrics/InAppNotification;

    .line 85
    .local v1, "notification":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mContext:Landroid/content/Context;

    invoke-static {v1, v5, p3}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->getNotificationImage(Lcom/mixpanel/android/mpmetrics/InAppNotification;Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/ServerMessage;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 86
    .local v0, "image":Landroid/graphics/Bitmap;
    if-nez v0, :cond_2

    .line 87
    const-string v5, "MixpanelAPI.DecideChecker"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not retrieve image for notification "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", will not show the notification."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {v1, v0}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->setImage(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 95
    .end local v0    # "image":Landroid/graphics/Bitmap;
    .end local v1    # "notification":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    :cond_3
    return-object v3
.end method


# virtual methods
.method public addDecideCheck(Lcom/mixpanel/android/mpmetrics/DecideMessages;)V
    .locals 1
    .param p1, "check"    # Lcom/mixpanel/android/mpmetrics/DecideMessages;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mChecks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    return-void
.end method

.method public runDecideChecks(Lcom/mixpanel/android/mpmetrics/ServerMessage;)V
    .locals 8
    .param p1, "poster"    # Lcom/mixpanel/android/mpmetrics/ServerMessage;

    .prologue
    .line 49
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideChecker;->mChecks:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 50
    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mixpanel/android/mpmetrics/DecideMessages;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 51
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mixpanel/android/mpmetrics/DecideMessages;

    .line 52
    .local v4, "updates":Lcom/mixpanel/android/mpmetrics/DecideMessages;
    invoke-virtual {v4}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->getDistinctId()Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "distinctId":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v4}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->getToken()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v0, p1}, Lcom/mixpanel/android/mpmetrics/DecideChecker;->runDecideCheck(Ljava/lang/String;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/ServerMessage;)Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;

    move-result-object v3

    .line 55
    .local v3, "result":Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    iget-object v5, v3, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->surveys:Ljava/util/List;

    iget-object v6, v3, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->notifications:Ljava/util/List;

    iget-object v7, v3, Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;->eventBindings:Lorg/json/JSONArray;

    invoke-virtual {v4, v5, v6, v7}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->reportResults(Ljava/util/List;Ljava/util/List;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    .end local v3    # "result":Lcom/mixpanel/android/mpmetrics/DecideChecker$Result;
    :catch_0
    move-exception v1

    .line 57
    .local v1, "e":Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;
    const-string v5, "MixpanelAPI.DecideChecker"

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 60
    .end local v0    # "distinctId":Ljava/lang/String;
    .end local v1    # "e":Lcom/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException;
    .end local v4    # "updates":Lcom/mixpanel/android/mpmetrics/DecideMessages;
    :cond_0
    return-void
.end method
