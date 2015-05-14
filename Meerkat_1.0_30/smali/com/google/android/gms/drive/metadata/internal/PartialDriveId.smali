.class public Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final zzFG:I

.field final zzSh:Ljava/lang/String;

.field final zzSi:J

.field final zzSj:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/drive/metadata/internal/zzl;

    invoke-direct {v0}, Lcom/google/android/gms/drive/metadata/internal/zzl;-><init>()V

    sput-object v0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;JI)V
    .locals 1
    .param p1, "versionCode"    # I
    .param p2, "resourceId"    # Ljava/lang/String;
    .param p3, "sqlId"    # J
    .param p5, "resourceType"    # I

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzFG:I

    iput-object p2, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzSh:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzSi:J

    iput p5, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzSj:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/drive/metadata/internal/zzl;->zza(Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzt(J)Lcom/google/android/gms/drive/DriveId;
    .locals 7

    new-instance v0, Lcom/google/android/gms/drive/DriveId;

    iget-object v1, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzSh:Ljava/lang/String;

    iget-wide v2, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzSi:J

    iget v6, p0, Lcom/google/android/gms/drive/metadata/internal/PartialDriveId;->zzSj:I

    move-wide v4, p1

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/drive/DriveId;-><init>(Ljava/lang/String;JJI)V

    return-object v0
.end method
