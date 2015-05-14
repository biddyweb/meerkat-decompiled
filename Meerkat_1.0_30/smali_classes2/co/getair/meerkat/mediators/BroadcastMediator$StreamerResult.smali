.class public final enum Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;
.super Ljava/lang/Enum;
.source "BroadcastMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "StreamerResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

.field public static final enum cancelled:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

.field public static final enum connectionIssues:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

.field public static final enum failure:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

.field public static final enum success:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 105
    new-instance v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    const-string v1, "success"

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->success:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    new-instance v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    const-string v1, "failure"

    invoke-direct {v0, v1, v3}, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->failure:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    new-instance v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    const-string v1, "connectionIssues"

    invoke-direct {v0, v1, v4}, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->connectionIssues:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    new-instance v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    const-string v1, "cancelled"

    invoke-direct {v0, v1, v5}, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->cancelled:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    .line 104
    const/4 v0, 0x4

    new-array v0, v0, [Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    sget-object v1, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->success:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    aput-object v1, v0, v2

    sget-object v1, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->failure:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    aput-object v1, v0, v3

    sget-object v1, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->connectionIssues:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    aput-object v1, v0, v4

    sget-object v1, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->cancelled:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    aput-object v1, v0, v5

    sput-object v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->$VALUES:[Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

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
    .line 104
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 104
    const-class v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    return-object v0
.end method

.method public static values()[Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;
    .locals 1

    .prologue
    .line 104
    sget-object v0, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->$VALUES:[Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    invoke-virtual {v0}, [Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    return-object v0
.end method
