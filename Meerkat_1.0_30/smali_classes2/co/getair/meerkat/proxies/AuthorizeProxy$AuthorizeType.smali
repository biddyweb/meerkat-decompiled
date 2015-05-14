.class public final enum Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;
.super Ljava/lang/Enum;
.source "AuthorizeProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/proxies/AuthorizeProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AuthorizeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

.field public static final enum LOGIN:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

.field public static final enum PERIODIC:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

.field public static final enum SIGNUP:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    new-instance v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    const-string v1, "PERIODIC"

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->PERIODIC:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    new-instance v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    const-string v1, "SIGNUP"

    invoke-direct {v0, v1, v3}, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->SIGNUP:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    new-instance v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    const-string v1, "LOGIN"

    invoke-direct {v0, v1, v4}, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->LOGIN:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    sget-object v1, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->PERIODIC:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    aput-object v1, v0, v2

    sget-object v1, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->SIGNUP:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    aput-object v1, v0, v3

    sget-object v1, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->LOGIN:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    aput-object v1, v0, v4

    sput-object v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->$VALUES:[Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

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
    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 45
    const-class v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    return-object v0
.end method

.method public static values()[Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->$VALUES:[Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    invoke-virtual {v0}, [Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    return-object v0
.end method
