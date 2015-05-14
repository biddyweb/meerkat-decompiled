.class public final enum Lco/getair/meerkat/dtos/Influencer$Type;
.super Ljava/lang/Enum;
.source "Influencer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/dtos/Influencer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lco/getair/meerkat/dtos/Influencer$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lco/getair/meerkat/dtos/Influencer$Type;

.field public static final enum InfluencerTypeBroadcaster:Lco/getair/meerkat/dtos/Influencer$Type;

.field public static final enum InfluencerTypeFeatured:Lco/getair/meerkat/dtos/Influencer$Type;

.field public static final enum InfluencerTypeLiker:Lco/getair/meerkat/dtos/Influencer$Type;

.field public static final enum InfluencerTypeNone:Lco/getair/meerkat/dtos/Influencer$Type;

.field public static final enum InfluencerTypeRestreamer:Lco/getair/meerkat/dtos/Influencer$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 14
    new-instance v0, Lco/getair/meerkat/dtos/Influencer$Type;

    const-string v1, "InfluencerTypeNone"

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/dtos/Influencer$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeNone:Lco/getair/meerkat/dtos/Influencer$Type;

    new-instance v0, Lco/getair/meerkat/dtos/Influencer$Type;

    const-string v1, "InfluencerTypeFeatured"

    invoke-direct {v0, v1, v3}, Lco/getair/meerkat/dtos/Influencer$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeFeatured:Lco/getair/meerkat/dtos/Influencer$Type;

    new-instance v0, Lco/getair/meerkat/dtos/Influencer$Type;

    const-string v1, "InfluencerTypeLiker"

    invoke-direct {v0, v1, v4}, Lco/getair/meerkat/dtos/Influencer$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeLiker:Lco/getair/meerkat/dtos/Influencer$Type;

    new-instance v0, Lco/getair/meerkat/dtos/Influencer$Type;

    const-string v1, "InfluencerTypeRestreamer"

    invoke-direct {v0, v1, v5}, Lco/getair/meerkat/dtos/Influencer$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeRestreamer:Lco/getair/meerkat/dtos/Influencer$Type;

    new-instance v0, Lco/getair/meerkat/dtos/Influencer$Type;

    const-string v1, "InfluencerTypeBroadcaster"

    invoke-direct {v0, v1, v6}, Lco/getair/meerkat/dtos/Influencer$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeBroadcaster:Lco/getair/meerkat/dtos/Influencer$Type;

    const/4 v0, 0x5

    new-array v0, v0, [Lco/getair/meerkat/dtos/Influencer$Type;

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeNone:Lco/getair/meerkat/dtos/Influencer$Type;

    aput-object v1, v0, v2

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeFeatured:Lco/getair/meerkat/dtos/Influencer$Type;

    aput-object v1, v0, v3

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeLiker:Lco/getair/meerkat/dtos/Influencer$Type;

    aput-object v1, v0, v4

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeRestreamer:Lco/getair/meerkat/dtos/Influencer$Type;

    aput-object v1, v0, v5

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeBroadcaster:Lco/getair/meerkat/dtos/Influencer$Type;

    aput-object v1, v0, v6

    sput-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->$VALUES:[Lco/getair/meerkat/dtos/Influencer$Type;

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
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lco/getair/meerkat/dtos/Influencer$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lco/getair/meerkat/dtos/Influencer$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/Influencer$Type;

    return-object v0
.end method

.method public static values()[Lco/getair/meerkat/dtos/Influencer$Type;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->$VALUES:[Lco/getair/meerkat/dtos/Influencer$Type;

    invoke-virtual {v0}, [Lco/getair/meerkat/dtos/Influencer$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lco/getair/meerkat/dtos/Influencer$Type;

    return-object v0
.end method
