.class public Lcom/google/android/gms/internal/zzro;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Lcom/google/android/gms/internal/zzrp;


# instance fields
.field private final content:[B

.field private final type:Ljava/lang/String;

.field final versionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzrp;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzrp;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzro;->CREATOR:Lcom/google/android/gms/internal/zzrp;

    return-void
.end method

.method constructor <init>(I[BLjava/lang/String;)V
    .locals 7

    const/16 v6, 0x3e8

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    array-length v0, p2

    if-gt v0, v6, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "Content length(%d) must not exceed MAX_CONTENT_SIZE_BYTES(%d)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    array-length v5, p2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v1

    invoke-static {v0, v3, v4}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/String;[Ljava/lang/Object;)V

    iput p1, p0, Lcom/google/android/gms/internal/zzro;->versionCode:I

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzro;->content:[B

    invoke-static {p3}, Lcom/google/android/gms/common/internal/zzx;->zzl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzro;->type:Ljava/lang/String;

    return-void

    :cond_0
    move v0, v2

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzro;->CREATOR:Lcom/google/android/gms/internal/zzrp;

    const/4 v0, 0x0

    return v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzro;->type:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    sget-object v0, Lcom/google/android/gms/internal/zzro;->CREATOR:Lcom/google/android/gms/internal/zzrp;

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/zzrp;->zza(Lcom/google/android/gms/internal/zzro;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzro()[B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzro;->content:[B

    return-object v0
.end method
