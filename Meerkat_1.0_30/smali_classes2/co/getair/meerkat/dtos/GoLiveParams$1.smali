.class final Lco/getair/meerkat/dtos/GoLiveParams$1;
.super Ljava/lang/Object;
.source "GoLiveParams.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/dtos/GoLiveParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lco/getair/meerkat/dtos/GoLiveParams;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lco/getair/meerkat/dtos/GoLiveParams;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 31
    new-instance v0, Lco/getair/meerkat/dtos/GoLiveParams;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lco/getair/meerkat/dtos/GoLiveParams;-><init>(Landroid/os/Parcel;Lco/getair/meerkat/dtos/GoLiveParams$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/GoLiveParams$1;->createFromParcel(Landroid/os/Parcel;)Lco/getair/meerkat/dtos/GoLiveParams;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lco/getair/meerkat/dtos/GoLiveParams;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 35
    new-array v0, p1, [Lco/getair/meerkat/dtos/GoLiveParams;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/GoLiveParams$1;->newArray(I)[Lco/getair/meerkat/dtos/GoLiveParams;

    move-result-object v0

    return-object v0
.end method
