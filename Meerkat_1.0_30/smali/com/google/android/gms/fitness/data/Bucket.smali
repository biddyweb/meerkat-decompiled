.class public Lcom/google/android/gms/fitness/data/Bucket;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/fitness/data/Bucket;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_ACTIVITY_SEGMENT:I = 0x4

.field public static final TYPE_ACTIVITY_TYPE:I = 0x3

.field public static final TYPE_SESSION:I = 0x2

.field public static final TYPE_TIME:I = 0x1

.field public static final zzYB:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/google/android/gms/fitness/data/Bucket;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final zzFG:I

.field private final zzON:J

.field private final zzYC:I

.field private final zzYD:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSet;",
            ">;"
        }
    .end annotation
.end field

.field private final zzYE:I

.field private zzYF:Z

.field private final zzYq:J

.field private final zzYs:Lcom/google/android/gms/fitness/data/Session;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/data/Bucket$1;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/data/Bucket$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/data/Bucket;->zzYB:Ljava/util/Comparator;

    new-instance v0, Lcom/google/android/gms/fitness/data/zzd;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/data/zzd;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/data/Bucket;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IJJLcom/google/android/gms/fitness/data/Session;ILjava/util/List;IZ)V
    .locals 2
    .param p1, "versionCode"    # I
    .param p2, "startTimeMillis"    # J
    .param p4, "endTimeMillis"    # J
    .param p6, "session"    # Lcom/google/android/gms/fitness/data/Session;
    .param p7, "activityType"    # I
    .param p9, "bucketType"    # I
    .param p10, "serverHasMoreData"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJJ",
            "Lcom/google/android/gms/fitness/data/Session;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSet;",
            ">;IZ)V"
        }
    .end annotation

    .prologue
    .local p8, "dataSets":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSet;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYF:Z

    iput p1, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzFG:I

    iput-wide p2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    iput-wide p4, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    iput-object p6, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYs:Lcom/google/android/gms/fitness/data/Session;

    iput p7, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    iput-object p8, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    iput p9, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    iput-boolean p10, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYF:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/fitness/data/RawBucket;Ljava/util/List;)V
    .locals 1
    .param p1, "bucket"    # Lcom/google/android/gms/fitness/data/RawBucket;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/fitness/data/RawBucket;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "uniqueDataSources":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSource;>;"
    invoke-static {p1}, Lcom/google/android/gms/internal/zzms;->zzb(Lcom/google/android/gms/fitness/data/RawBucket;)Lcom/google/android/gms/internal/zzxd$zza;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/fitness/data/Bucket;-><init>(Lcom/google/android/gms/internal/zzxd$zza;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzxd$zza;Ljava/util/List;)V
    .locals 11
    .param p1, "bucket"    # Lcom/google/android/gms/internal/zzxd$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzxd$zza;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "uniqueDataSources":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSource;>;"
    const/4 v1, 0x2

    iget-wide v2, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIq:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIr:J

    iget-object v0, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIt:Lcom/google/android/gms/internal/zzxe$zza;

    if-nez v0, :cond_0

    const/4 v6, 0x0

    :goto_0
    iget v7, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIu:I

    iget-object v0, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIv:[Lcom/google/android/gms/internal/zzxd$zzc;

    invoke-static {v0, p2}, Lcom/google/android/gms/fitness/data/Bucket;->zza([Lcom/google/android/gms/internal/zzxd$zzc;Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    iget v9, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIw:I

    iget-boolean v10, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIx:Z

    move-object v0, p0

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gms/fitness/data/Bucket;-><init>(IJJLcom/google/android/gms/fitness/data/Session;ILjava/util/List;IZ)V

    return-void

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzmw;->zzZW:Lcom/google/android/gms/internal/zzmw;

    iget-object v6, p1, Lcom/google/android/gms/internal/zzxd$zza;->zzaIt:Lcom/google/android/gms/internal/zzxe$zza;

    invoke-virtual {v0, v6}, Lcom/google/android/gms/internal/zzmw;->zza(Lcom/google/android/gms/internal/zzxe$zza;)Lcom/google/android/gms/fitness/data/Session;

    move-result-object v6

    goto :goto_0
.end method

.method private static zza([Lcom/google/android/gms/internal/zzxd$zzc;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/android/gms/internal/zzxd$zzc;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSet;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    array-length v0, p0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    array-length v2, p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, p0, v0

    new-instance v4, Lcom/google/android/gms/fitness/data/DataSet;

    invoke-direct {v4, v3, p1}, Lcom/google/android/gms/fitness/data/DataSet;-><init>(Lcom/google/android/gms/internal/zzxd$zzc;Ljava/util/List;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method private zza(Lcom/google/android/gms/fitness/data/Bucket;)Z
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    iget v1, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    iget-object v1, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzw;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    iget v1, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYF:Z

    iget-boolean v1, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYF:Z

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static zzdg(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    const-string v0, "bug"

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "time"

    goto :goto_0

    :pswitch_1
    const-string v0, "type"

    goto :goto_0

    :pswitch_2
    const-string v0, "segment"

    goto :goto_0

    :pswitch_3
    const-string v0, "session"

    goto :goto_0

    :pswitch_4
    const-string v0, "unknown"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    if-eq p1, p0, :cond_0

    instance-of v0, p1, Lcom/google/android/gms/fitness/data/Bucket;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/google/android/gms/fitness/data/Bucket;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/data/Bucket;->zza(Lcom/google/android/gms/fitness/data/Bucket;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getActivity()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    invoke-static {v0}, Lcom/google/android/gms/fitness/FitnessActivities;->getName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBucketType()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    return v0
.end method

.method public getDataSet(Lcom/google/android/gms/fitness/data/DataType;)Lcom/google/android/gms/fitness/data/DataSet;
    .locals 3
    .param p1, "dataType"    # Lcom/google/android/gms/fitness/data/DataType;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/DataSet;

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataSet;->getDataType()Lcom/google/android/gms/fitness/data/DataType;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/google/android/gms/fitness/data/DataType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDataSets()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSet;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    return-object v0
.end method

.method public getEndTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSession()Lcom/google/android/gms/fitness/data/Session;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYs:Lcom/google/android/gms/fitness/data/Session;

    return-object v0
.end method

.method public getStartTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzFG:I

    return v0
.end method

.method public hashCode()I
    .locals 4

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzw;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzw;->zzk(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    const-string v1, "startTime"

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzw$zza;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    const-string v1, "endTime"

    iget-wide v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzw$zza;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    const-string v1, "activity"

    iget v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzw$zza;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    const-string v1, "dataSets"

    iget-object v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzw$zza;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    const-string v1, "bucketType"

    iget v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    invoke-static {v2}, Lcom/google/android/gms/fitness/data/Bucket;->zzdg(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzw$zza;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    const-string v1, "serverHasMoreData"

    iget-boolean v2, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYF:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/internal/zzw$zza;->zza(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzw$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzw$zza;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/data/zzd;->zza(Lcom/google/android/gms/fitness/data/Bucket;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/fitness/data/Bucket;)Z
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    iget v1, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    iget v1, p1, Lcom/google/android/gms/fitness/data/Bucket;->zzYE:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzln()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYC:I

    return v0
.end method

.method public zzlo()Z
    .locals 3

    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYF:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYD:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/DataSet;

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataSet;->zzlo()Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzlp()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzON:J

    return-wide v0
.end method

.method public zzlq()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/data/Bucket;->zzYq:J

    return-wide v0
.end method
