.class Lcom/google/android/gms/common/api/zzh$zzb;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field public final zzNC:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

.field public final zzNz:Lcom/google/android/gms/common/api/GoogleApiClient;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzh$zzb;->zzNz:Lcom/google/android/gms/common/api/GoogleApiClient;

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzh$zzb;->zzNC:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;Lcom/google/android/gms/common/api/zzh$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/api/zzh$zzb;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method
