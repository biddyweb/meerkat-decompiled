.class synthetic Lco/getair/meerkat/mediators/FeedMediator$11;
.super Ljava/lang/Object;
.source "FeedMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/FeedMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

.field static final synthetic $SwitchMap$co$getair$meerkat$dtos$feed$StreamFeedItemProxy$Type:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 576
    invoke-static {}, Lco/getair/meerkat/dtos/Influencer$Type;->values()[Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

    :try_start_0
    sget-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeFeatured:Lco/getair/meerkat/dtos/Influencer$Type;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeRestreamer:Lco/getair/meerkat/dtos/Influencer$Type;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

    sget-object v1, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeLiker:Lco/getair/meerkat/dtos/Influencer$Type;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 257
    :goto_2
    invoke-static {}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->values()[Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$feed$StreamFeedItemProxy$Type:[I

    :try_start_3
    sget-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$feed$StreamFeedItemProxy$Type:[I

    sget-object v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v0, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$feed$StreamFeedItemProxy$Type:[I

    sget-object v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    return-void

    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    goto :goto_3

    .line 576
    :catch_2
    move-exception v0

    goto :goto_2

    :catch_3
    move-exception v0

    goto :goto_1

    :catch_4
    move-exception v0

    goto :goto_0
.end method