.class Lcom/digits/sdk/android/DigitsSessionResponse;
.super Ljava/lang/Object;
.source "DigitsSessionResponse.java"


# instance fields
.field public screenName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "screen_name"
    .end annotation
.end field

.field public secret:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "oauth_token_secret"
    .end annotation
.end field

.field public token:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "oauth_token"
    .end annotation
.end field

.field public userId:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user_id"
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .locals 4

    .prologue
    .line 16
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->token:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->secret:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->screenName:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/digits/sdk/android/DigitsSessionResponse;->userId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
