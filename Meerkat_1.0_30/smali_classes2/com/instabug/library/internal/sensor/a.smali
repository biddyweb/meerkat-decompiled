.class public final Lcom/instabug/library/internal/sensor/a;
.super Ljava/lang/Object;
.source "ShakeDetector.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/internal/sensor/a$b;,
        Lcom/instabug/library/internal/sensor/a$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/internal/sensor/a$a;

.field private b:Ljava/util/ArrayList;

.field private c:Ljava/lang/Object;

.field private d:F

.field private e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/internal/sensor/a;->c:Ljava/lang/Object;

    .line 66
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    .line 67
    const/4 v0, 0x2

    iput v0, p0, Lcom/instabug/library/internal/sensor/a;->e:I

    .line 68
    return-void
.end method


# virtual methods
.method public final a(F)V
    .locals 1

    .prologue
    .line 26
    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    .line 27
    return-void
.end method

.method public final a(Lcom/instabug/library/internal/sensor/a$a;)V
    .locals 0

    .prologue
    .line 22
    iput-object p1, p0, Lcom/instabug/library/internal/sensor/a;->a:Lcom/instabug/library/internal/sensor/a$a;

    .line 23
    return-void
.end method

.method public final onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .prologue
    .line 86
    return-void
.end method

.method public final onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 12

    .prologue
    const/4 v11, 0x3

    const/4 v2, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 72
    new-instance v1, Lcom/instabug/library/internal/sensor/a$b;

    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v0, v9

    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v0, v8

    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v0, v2

    iget-wide v6, p1, Landroid/hardware/SensorEvent;->timestamp:J

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/instabug/library/internal/sensor/a$b;-><init>(Lcom/instabug/library/internal/sensor/a;FFFJ)V

    .line 73
    iget-object v2, p0, Lcom/instabug/library/internal/sensor/a;->c:Ljava/lang/Object;

    monitor-enter v2

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_7

    .line 75
    iget-object v0, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_0
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 80
    iget-object v3, p0, Lcom/instabug/library/internal/sensor/a;->c:Ljava/lang/Object;

    monitor-enter v3

    const/4 v0, 0x3

    :try_start_1
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    const/4 v0, 0x3

    new-array v4, v0, [[I

    const/4 v0, 0x0

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_1

    aput-object v2, v4, v0

    const/4 v0, 0x1

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_2

    aput-object v2, v4, v0

    const/4 v0, 0x2

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_3

    aput-object v2, v4, v0

    iget-object v0, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/sensor/a$b;

    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->a()F

    move-result v5

    iget v6, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    const/4 v5, 0x0

    aget v5, v1, v5

    if-gtz v5, :cond_2

    const/4 v5, 0x0

    const/4 v6, 0x1

    aput v6, v1, v5

    const/4 v5, 0x0

    aget-object v5, v4, v5

    const/4 v6, 0x0

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    :cond_2
    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->a()F

    move-result v5

    iget v6, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    neg-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_3

    const/4 v5, 0x0

    aget v5, v1, v5

    if-ltz v5, :cond_3

    const/4 v5, 0x0

    const/4 v6, -0x1

    aput v6, v1, v5

    const/4 v5, 0x0

    aget-object v5, v4, v5

    const/4 v6, 0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    :cond_3
    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->b()F

    move-result v5

    iget v6, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_4

    const/4 v5, 0x1

    aget v5, v1, v5

    if-gtz v5, :cond_4

    const/4 v5, 0x1

    const/4 v6, 0x1

    aput v6, v1, v5

    const/4 v5, 0x1

    aget-object v5, v4, v5

    const/4 v6, 0x0

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    :cond_4
    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->b()F

    move-result v5

    iget v6, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    neg-float v6, v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_5

    const/4 v5, 0x1

    aget v5, v1, v5

    if-ltz v5, :cond_5

    const/4 v5, 0x1

    const/4 v6, -0x1

    aput v6, v1, v5

    const/4 v5, 0x1

    aget-object v5, v4, v5

    const/4 v6, 0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    :cond_5
    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->c()F

    move-result v5

    iget v6, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    cmpl-float v5, v5, v6

    if-lez v5, :cond_6

    const/4 v5, 0x2

    aget v5, v1, v5

    if-gtz v5, :cond_6

    const/4 v5, 0x2

    const/4 v6, 0x1

    aput v6, v1, v5

    const/4 v5, 0x2

    aget-object v5, v4, v5

    const/4 v6, 0x0

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    :cond_6
    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->c()F

    move-result v0

    iget v5, p0, Lcom/instabug/library/internal/sensor/a;->d:F

    neg-float v5, v5

    cmpg-float v0, v0, v5

    if-gez v0, :cond_1

    const/4 v0, 0x2

    aget v0, v1, v0

    if-ltz v0, :cond_1

    const/4 v0, 0x2

    const/4 v5, -0x1

    aput v5, v1, v0

    const/4 v0, 0x2

    aget-object v0, v4, v0

    const/4 v5, 0x1

    aget v6, v0, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v0, v5

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 76
    :cond_7
    :try_start_2
    invoke-virtual {v1}, Lcom/instabug/library/internal/sensor/a$b;->d()J

    move-result-wide v4

    iget-object v0, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/sensor/a$b;

    invoke-virtual {v0}, Lcom/instabug/library/internal/sensor/a$b;->d()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x12c

    cmp-long v0, v4, v6

    if-lez v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 79
    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :cond_8
    move v0, v9

    move v1, v9

    .line 80
    :goto_2
    if-ge v1, v11, :cond_d

    :try_start_3
    aget-object v5, v4, v1

    array-length v6, v5

    move v2, v9

    :goto_3
    if-ge v2, v6, :cond_c

    aget v7, v5, v2

    iget v10, p0, Lcom/instabug/library/internal/sensor/a;->e:I

    if-lt v7, v10, :cond_a

    if-eqz v0, :cond_b

    iget-object v7, p0, Lcom/instabug/library/internal/sensor/a;->a:Lcom/instabug/library/internal/sensor/a$a;

    if-eqz v7, :cond_9

    iget-object v7, p0, Lcom/instabug/library/internal/sensor/a;->a:Lcom/instabug/library/internal/sensor/a$a;

    invoke-interface {v7}, Lcom/instabug/library/internal/sensor/a$a;->a()V

    :cond_9
    iget-object v7, p0, Lcom/instabug/library/internal/sensor/a;->b:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    :cond_a
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_b
    move v0, v8

    goto :goto_4

    :cond_c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_d
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
    .end array-data
.end method
