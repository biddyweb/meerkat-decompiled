.class public Lcom/google/android/gms/fitness/request/DataReadRequest;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/fitness/request/DataReadRequest$1;,
        Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/fitness/request/DataReadRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final NO_LIMIT:I


# instance fields
.field private final zzFG:I

.field private final zzFO:Ljava/lang/String;

.field private final zzON:J

.field private final zzYA:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation
.end field

.field private final zzYE:I

.field private final zzYq:J

.field private final zzaaO:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaaT:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaaU:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaaV:J

.field private final zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

.field private final zzaaX:I

.field private final zzaaY:Z

.field private final zzaaZ:Z

.field private final zzaba:Lcom/google/android/gms/internal/zzng;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/fitness/request/zzg;

    invoke-direct {v0}, Lcom/google/android/gms/fitness/request/zzg;-><init>()V

    sput-object v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/util/List;Ljava/util/List;JJLjava/util/List;Ljava/util/List;IJLcom/google/android/gms/fitness/data/DataSource;IZZLandroid/os/IBinder;Ljava/lang/String;)V
    .locals 2
    .param p1, "versionCode"    # I
    .param p4, "startTimeMillis"    # J
    .param p6, "endTimeMillis"    # J
    .param p10, "bucketType"    # I
    .param p11, "bucketDurationMillis"    # J
    .param p13, "activityDataSource"    # Lcom/google/android/gms/fitness/data/DataSource;
    .param p14, "limit"    # I
    .param p15, "flushBeforeRead"    # Z
    .param p16, "serverQueriesEnabled"    # Z
    .param p17, "callback"    # Landroid/os/IBinder;
    .param p18, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;JJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;IJ",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            "IZZ",
            "Landroid/os/IBinder;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "dataTypes":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataType;>;"
    .local p3, "dataSources":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSource;>;"
    .local p8, "aggregatedDataTypes":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataType;>;"
    .local p9, "aggregatedDataSources":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzFG:I

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    iput-wide p4, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    iput-wide p6, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    invoke-static {p8}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    invoke-static {p9}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    iput p10, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    iput-wide p11, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    iput-object p13, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    move/from16 v0, p14

    iput v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaX:I

    move/from16 v0, p15

    iput-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaY:Z

    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    if-nez p17, :cond_0

    const/4 v1, 0x0

    :goto_0
    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaba:Lcom/google/android/gms/internal/zzng;

    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzFO:Ljava/lang/String;

    return-void

    :cond_0
    invoke-static/range {p17 .. p17}, Lcom/google/android/gms/internal/zzng$zza;->zzaD(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzng;

    move-result-object v1

    goto :goto_0
.end method

.method private constructor <init>(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)V
    .locals 19
    .param p1, "builder"    # Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;

    .prologue
    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zza(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Ljava/util/List;

    move-result-object v2

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzb(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Ljava/util/List;

    move-result-object v3

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzc(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)J

    move-result-wide v4

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzd(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)J

    move-result-wide v6

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zze(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Ljava/util/List;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzf(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Ljava/util/List;

    move-result-object v9

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzg(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)I

    move-result v10

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzh(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)J

    move-result-wide v11

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzi(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Lcom/google/android/gms/fitness/data/DataSource;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzj(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)I

    move-result v14

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzk(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Z

    move-result v15

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;->zzl(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)Z

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v18}, Lcom/google/android/gms/fitness/request/DataReadRequest;-><init>(Ljava/util/List;Ljava/util/List;JJLjava/util/List;Ljava/util/List;IJLcom/google/android/gms/fitness/data/DataSource;IZZLcom/google/android/gms/internal/zzng;Ljava/lang/String;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;Lcom/google/android/gms/fitness/request/DataReadRequest$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;
    .param p2, "x1"    # Lcom/google/android/gms/fitness/request/DataReadRequest$1;

    .prologue
    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/DataReadRequest;-><init>(Lcom/google/android/gms/fitness/request/DataReadRequest$Builder;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/fitness/request/DataReadRequest;Lcom/google/android/gms/internal/zzng;Ljava/lang/String;)V
    .locals 21
    .param p1, "request"    # Lcom/google/android/gms/fitness/request/DataReadRequest;
    .param p2, "callback"    # Lcom/google/android/gms/internal/zzng;
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    move-object/from16 v0, p1

    iget-wide v6, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    move-object/from16 v0, p1

    iget-wide v8, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    move-object/from16 v0, p1

    iget v12, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    move-object/from16 v0, p1

    iget-wide v13, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaX:I

    move/from16 v16, v0

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaY:Z

    move/from16 v17, v0

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    move/from16 v18, v0

    move-object/from16 v3, p0

    move-object/from16 v19, p2

    move-object/from16 v20, p3

    invoke-direct/range {v3 .. v20}, Lcom/google/android/gms/fitness/request/DataReadRequest;-><init>(Ljava/util/List;Ljava/util/List;JJLjava/util/List;Ljava/util/List;IJLcom/google/android/gms/fitness/data/DataSource;IZZLcom/google/android/gms/internal/zzng;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;JJLjava/util/List;Ljava/util/List;IJLcom/google/android/gms/fitness/data/DataSource;IZZLcom/google/android/gms/internal/zzng;Ljava/lang/String;)V
    .locals 3
    .param p3, "startTimeMillis"    # J
    .param p5, "endTimeMillis"    # J
    .param p9, "bucketType"    # I
    .param p10, "bucketDurationMillis"    # J
    .param p12, "activityDataSource"    # Lcom/google/android/gms/fitness/data/DataSource;
    .param p13, "limit"    # I
    .param p14, "flushBeforeRead"    # Z
    .param p15, "serverQueriesEnabled"    # Z
    .param p16, "callback"    # Lcom/google/android/gms/internal/zzng;
    .param p17, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;JJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;IJ",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            "IZZ",
            "Lcom/google/android/gms/internal/zzng;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "dataTypes":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataType;>;"
    .local p2, "dataSources":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSource;>;"
    .local p7, "aggregatedDataTypes":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataType;>;"
    .local p8, "aggregatedDataSources":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/fitness/data/DataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x3

    iput v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzFG:I

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    iput-wide p3, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    iput-wide p5, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    invoke-static {p8}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    iput p9, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    iput-wide p10, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    iput-object p12, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    move/from16 v0, p13

    iput v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaX:I

    move/from16 v0, p14

    iput-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaY:Z

    move/from16 v0, p15

    iput-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaba:Lcom/google/android/gms/internal/zzng;

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzFO:Ljava/lang/String;

    return-void
.end method

.method private zzb(Lcom/google/android/gms/fitness/request/DataReadRequest;)Z
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    iget v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    iget-object v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzw;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    iget-wide v2, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    iget-boolean v1, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "that"    # Ljava/lang/Object;

    .prologue
    if-eq p0, p1, :cond_0

    instance-of v0, p1, Lcom/google/android/gms/fitness/request/DataReadRequest;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/google/android/gms/fitness/request/DataReadRequest;

    .end local p1    # "that":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzb(Lcom/google/android/gms/fitness/request/DataReadRequest;)Z

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

.method public getActivityDataSource()Lcom/google/android/gms/fitness/data/DataSource;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    return-object v0
.end method

.method public getAggregatedDataSources()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    return-object v0
.end method

.method public getAggregatedDataTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    return-object v0
.end method

.method public getBucketDuration(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getBucketType()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    return v0
.end method

.method public getDataSources()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataSource;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    return-object v0
.end method

.method public getDataTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/fitness/data/DataType;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    return-object v0
.end method

.method public getEndTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLimit()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaX:I

    return v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzFO:Ljava/lang/String;

    return-object v0
.end method

.method public getStartTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzFG:I

    return v0
.end method

.method public hashCode()I
    .locals 4

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzw;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "DataReadRequest{"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYA:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/DataType;

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataType;->zzlB()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaO:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/DataSource;

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataSource;->toDebugString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    iget v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    if-eqz v0, :cond_3

    const-string v0, "bucket by "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYE:I

    invoke-static {v2}, Lcom/google/android/gms/fitness/data/Bucket;->zzdg(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    const-string v0, " >"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "ms"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaT:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/DataType;

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataType;->zzlB()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fitness/data/DataSource;

    invoke-virtual {v0}, Lcom/google/android/gms/fitness/data/DataSource;->toDebugString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_5
    const-string v0, "(%tF %tT - %tF %tT)"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-wide v4, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-wide v4, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-wide v4, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    if-eqz v0, :cond_6

    const-string v0, "activities: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaW:Lcom/google/android/gms/fitness/data/DataSource;

    invoke-virtual {v2}, Lcom/google/android/gms/fitness/data/DataSource;->toDebugString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    iget-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    if-eqz v0, :cond_7

    const-string v0, " +server"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    const-string v0, "}"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/fitness/request/zzg;->zza(Lcom/google/android/gms/fitness/request/DataReadRequest;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzlQ()Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaba:Lcom/google/android/gms/internal/zzng;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaba:Lcom/google/android/gms/internal/zzng;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzng;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    goto :goto_0
.end method

.method public zzlV()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaZ:Z

    return v0
.end method

.method public zzlW()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaY:Z

    return v0
.end method

.method public zzlX()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzaaV:J

    return-wide v0
.end method

.method public zzlp()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzON:J

    return-wide v0
.end method

.method public zzlq()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/fitness/request/DataReadRequest;->zzYq:J

    return-wide v0
.end method
