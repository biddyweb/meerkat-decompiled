.class public final enum Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
.super Ljava/lang/Enum;
.source "StreamFeedItemProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

.field public static final enum Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

.field public static final enum Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    const-string v1, "Live"

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    .line 35
    new-instance v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    const-string v1, "Scheduled"

    invoke-direct {v0, v1, v3}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    .line 33
    const/4 v0, 0x2

    new-array v0, v0, [Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    sget-object v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    aput-object v1, v0, v2

    sget-object v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    aput-object v1, v0, v3

    sput-object v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->$VALUES:[Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    return-object v0
.end method

.method public static values()[Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->$VALUES:[Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    invoke-virtual {v0}, [Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    return-object v0
.end method
