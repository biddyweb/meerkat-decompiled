.class public Lcom/google/android/gms/internal/zzmp;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final zzZU:Lcom/google/android/gms/internal/zzmp;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzmp;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzmp;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzmp;->zzZU:Lcom/google/android/gms/internal/zzmp;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzc(Lcom/google/android/gms/fitness/data/DataType;)Lcom/google/android/gms/internal/zzxc$zzc;
    .locals 6

    new-instance v2, Lcom/google/android/gms/internal/zzxc$zzc;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzxc$zzc;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/fitness/data/DataType;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzxc$zzc;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/fitness/data/DataType;->getFields()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzxc$zzd;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzxc$zzc;->zzaIf:[Lcom/google/android/gms/internal/zzxc$zzd;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v4, v2, Lcom/google/android/gms/internal/zzxc$zzc;->zzaIf:[Lcom/google/android/gms/internal/zzxc$zzd;

    sget-object v5, Lcom/google/android/gms/internal/zzmq;->zzZV:Lcom/google/android/gms/internal/zzmq;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/Field;

    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/zzmq;->zzb(Lcom/google/android/gms/fitness/data/Field;)Lcom/google/android/gms/internal/zzxc$zzd;

    move-result-object v0

    aput-object v0, v4, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    return-object v2
.end method
