.class synthetic Lco/getair/meerkat/mediators/LandingMediator$1;
.super Ljava/lang/Object;
.source "LandingMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/LandingMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$co$getair$meerkat$mediators$LandingMediator$ScreenToOpen:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 86
    invoke-static {}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->values()[Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lco/getair/meerkat/mediators/LandingMediator$1;->$SwitchMap$co$getair$meerkat$mediators$LandingMediator$ScreenToOpen:[I

    :try_start_0
    sget-object v0, Lco/getair/meerkat/mediators/LandingMediator$1;->$SwitchMap$co$getair$meerkat$mediators$LandingMediator$ScreenToOpen:[I

    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->WATCH:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    invoke-virtual {v1}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lco/getair/meerkat/mediators/LandingMediator$1;->$SwitchMap$co$getair$meerkat$mediators$LandingMediator$ScreenToOpen:[I

    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->FEED:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    invoke-virtual {v1}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
