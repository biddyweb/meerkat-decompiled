.class public Lco/getair/meerkat/utilities/MeerkatUrlBuilder;
.super Ljava/lang/Object;
.source "MeerkatUrlBuilder.java"


# static fields
.field private static final HOST:Ljava/lang/String; = "https://meerkatapp.co"

.field private static final HOST_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-string v0, "https://meerkatapp.co"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/utilities/MeerkatUrlBuilder;->HOST_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildUpon()Landroid/net/Uri$Builder;
    .locals 1

    .prologue
    .line 17
    sget-object v0, Lco/getair/meerkat/utilities/MeerkatUrlBuilder;->HOST_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static host()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lco/getair/meerkat/utilities/MeerkatUrlBuilder;->HOST_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public static scheduledBroadcast(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .locals 4
    .param p0, "user"    # Ljava/lang/String;
    .param p1, "broadcastId"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {}, Lco/getair/meerkat/utilities/MeerkatUrlBuilder;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 28
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "sch-%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 29
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static user(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1
    .param p0, "user"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-static {}, Lco/getair/meerkat/utilities/MeerkatUrlBuilder;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 22
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
