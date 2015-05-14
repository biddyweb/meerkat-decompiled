.class public final enum Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;
.super Ljava/lang/Enum;
.source "H265TrackImplOld.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PARSE_STATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

.field public static final enum AUD_SEI_SLICE:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

.field public static final enum SEI_SLICE:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

.field public static final enum SLICE_OES_EOB:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 461
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    const-string v1, "AUD_SEI_SLICE"

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->AUD_SEI_SLICE:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    .line 462
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    const-string v1, "SEI_SLICE"

    invoke-direct {v0, v1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->SEI_SLICE:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    .line 463
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    const-string v1, "SLICE_OES_EOB"

    invoke-direct {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->SLICE_OES_EOB:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    .line 460
    const/4 v0, 0x3

    new-array v0, v0, [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->AUD_SEI_SLICE:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    aput-object v1, v0, v2

    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->SEI_SLICE:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    aput-object v1, v0, v3

    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->SLICE_OES_EOB:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    aput-object v1, v0, v4

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->$VALUES:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

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
    .line 460
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 460
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    return-object v0
.end method

.method public static values()[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;
    .locals 1

    .prologue
    .line 460
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->$VALUES:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    invoke-virtual {v0}, [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H265TrackImplOld$PARSE_STATE;

    return-object v0
.end method
