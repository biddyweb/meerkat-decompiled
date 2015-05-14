.class public Lco/getair/meerkat/utilities/TwitterUrlBuilder;
.super Ljava/lang/Object;
.source "TwitterUrlBuilder.java"


# static fields
.field public static final TWITTER_URL:Ljava/lang/String; = "https://twitter.com"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static forUser(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "username"    # Ljava/lang/String;

    .prologue
    .line 12
    const-string v0, "%s/%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "https://twitter.com"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
