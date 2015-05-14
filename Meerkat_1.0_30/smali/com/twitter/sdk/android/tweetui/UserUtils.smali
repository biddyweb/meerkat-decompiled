.class final Lcom/twitter/sdk/android/tweetui/UserUtils;
.super Ljava/lang/Object;
.source "UserUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/tweetui/UserUtils$1;,
        Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static formatScreenName(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "screenName"    # Ljava/lang/CharSequence;

    .prologue
    .line 58
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 59
    const-string p0, ""

    .line 65
    .end local p0    # "screenName":Ljava/lang/CharSequence;
    :cond_0
    :goto_0
    return-object p0

    .line 62
    .restart local p0    # "screenName":Ljava/lang/CharSequence;
    :cond_1
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0x40

    if-eq v0, v1, :cond_0

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method static getProfileImageUrlHttps(Lcom/twitter/sdk/android/core/models/User;Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;)Ljava/lang/String;
    .locals 3
    .param p0, "user"    # Lcom/twitter/sdk/android/core/models/User;
    .param p1, "size"    # Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;

    .prologue
    .line 32
    if-eqz p0, :cond_2

    iget-object v1, p0, Lcom/twitter/sdk/android/core/models/User;->profileImageUrlHttps:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 33
    iget-object v0, p0, Lcom/twitter/sdk/android/core/models/User;->profileImageUrlHttps:Ljava/lang/String;

    .line 34
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_0

    if-nez v0, :cond_1

    .line 50
    .end local v0    # "url":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 38
    .restart local v0    # "url":Ljava/lang/String;
    :cond_1
    sget-object v1, Lcom/twitter/sdk/android/tweetui/UserUtils$1;->$SwitchMap$com$twitter$sdk$android$tweetui$UserUtils$AvatarSize:[I

    invoke-virtual {p1}, Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 44
    :pswitch_0
    sget-object v1, Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;->NORMAL:Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;->getSuffix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/twitter/sdk/android/tweetui/UserUtils$AvatarSize;->getSuffix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 50
    .end local v0    # "url":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 38
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
