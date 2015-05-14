.class final Lcom/google/android/gms/fitness/data/Bucket$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/fitness/data/Bucket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/google/android/gms/fitness/data/Bucket;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    check-cast p1, Lcom/google/android/gms/fitness/data/Bucket;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/google/android/gms/fitness/data/Bucket;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/fitness/data/Bucket$1;->zza(Lcom/google/android/gms/fitness/data/Bucket;Lcom/google/android/gms/fitness/data/Bucket;)I

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/fitness/data/Bucket;Lcom/google/android/gms/fitness/data/Bucket;)I
    .locals 4

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/fitness/data/Bucket;->getStartTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v2}, Lcom/google/android/gms/fitness/data/Bucket;->getStartTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzmd;->compare(JJ)I

    move-result v0

    return v0
.end method
