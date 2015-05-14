.class public Lco/getair/meerkat/dtos/GoLiveParams;
.super Ljava/lang/Object;
.source "GoLiveParams.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lco/getair/meerkat/dtos/GoLiveParams;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field caption:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    new-instance v0, Lco/getair/meerkat/dtos/GoLiveParams$1;

    invoke-direct {v0}, Lco/getair/meerkat/dtos/GoLiveParams$1;-><init>()V

    sput-object v0, Lco/getair/meerkat/dtos/GoLiveParams;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/dtos/GoLiveParams;->caption:Ljava/lang/String;

    .line 41
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lco/getair/meerkat/dtos/GoLiveParams$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lco/getair/meerkat/dtos/GoLiveParams$1;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lco/getair/meerkat/dtos/GoLiveParams;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "caption"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lco/getair/meerkat/dtos/GoLiveParams;->caption:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public getCaption()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lco/getair/meerkat/dtos/GoLiveParams;->caption:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 26
    iget-object v0, p0, Lco/getair/meerkat/dtos/GoLiveParams;->caption:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 27
    return-void
.end method
