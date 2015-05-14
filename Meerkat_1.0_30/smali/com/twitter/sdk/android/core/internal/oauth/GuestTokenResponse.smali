.class Lcom/twitter/sdk/android/core/internal/oauth/GuestTokenResponse;
.super Ljava/lang/Object;
.source "GuestTokenResponse.java"


# instance fields
.field public final guestToken:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "guest_token"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "guestToken"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/oauth/GuestTokenResponse;->guestToken:Ljava/lang/String;

    .line 12
    return-void
.end method
