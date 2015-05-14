.class final enum Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
.super Ljava/lang/Enum;
.source "LandingMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/LandingMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ScreenToOpen"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

.field public static final enum ADDRESS_BOOK:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

.field public static final enum FEED:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

.field public static final enum PHONE_VERIFICATION:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

.field public static final enum WATCH:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 28
    new-instance v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    const-string v1, "FEED"

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->FEED:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    new-instance v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    const-string v1, "WATCH"

    invoke-direct {v0, v1, v3}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->WATCH:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    new-instance v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    const-string v1, "PHONE_VERIFICATION"

    invoke-direct {v0, v1, v4}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->PHONE_VERIFICATION:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    new-instance v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    const-string v1, "ADDRESS_BOOK"

    invoke-direct {v0, v1, v5}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->ADDRESS_BOOK:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    .line 27
    const/4 v0, 0x4

    new-array v0, v0, [Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->FEED:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    aput-object v1, v0, v2

    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->WATCH:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    aput-object v1, v0, v3

    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->PHONE_VERIFICATION:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    aput-object v1, v0, v4

    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->ADDRESS_BOOK:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    aput-object v1, v0, v5

    sput-object v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->$VALUES:[Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

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
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    return-object v0
.end method

.method public static values()[Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->$VALUES:[Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    invoke-virtual {v0}, [Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    return-object v0
.end method
