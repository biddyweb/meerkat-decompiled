.class public Lco/getair/meerkat/dtos/ScheduleBroadcastParams;
.super Ljava/lang/Object;
.source "ScheduleBroadcastParams.java"


# instance fields
.field caption:Ljava/lang/String;

.field coverImage:Landroid/graphics/Bitmap;

.field timeOfBroadcast:Ljava/util/Date;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Date;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "caption"    # Ljava/lang/String;
    .param p2, "timeOfBroadcast"    # Ljava/util/Date;
    .param p3, "coverImage"    # Landroid/graphics/Bitmap;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->caption:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->timeOfBroadcast:Ljava/util/Date;

    .line 19
    iput-object p3, p0, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->coverImage:Landroid/graphics/Bitmap;

    .line 20
    return-void
.end method


# virtual methods
.method public getCaption()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->caption:Ljava/lang/String;

    return-object v0
.end method

.method public getCoverImage()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->coverImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getTimeOfBroadcast()Ljava/util/Date;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->timeOfBroadcast:Ljava/util/Date;

    return-object v0
.end method
