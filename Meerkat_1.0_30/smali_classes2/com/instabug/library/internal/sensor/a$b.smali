.class final Lcom/instabug/library/internal/sensor/a$b;
.super Ljava/lang/Object;
.source "ShakeDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/internal/sensor/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field private final a:F

.field private final b:F

.field private final c:F

.field private final d:J


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/sensor/a;FFFJ)V
    .locals 1

    .prologue
    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    iput p2, p0, Lcom/instabug/library/internal/sensor/a$b;->a:F

    .line 176
    iput p3, p0, Lcom/instabug/library/internal/sensor/a$b;->b:F

    .line 177
    iput p4, p0, Lcom/instabug/library/internal/sensor/a$b;->c:F

    .line 178
    iput-wide p5, p0, Lcom/instabug/library/internal/sensor/a$b;->d:J

    .line 179
    return-void
.end method


# virtual methods
.method public final a()F
    .locals 1

    .prologue
    .line 182
    iget v0, p0, Lcom/instabug/library/internal/sensor/a$b;->a:F

    return v0
.end method

.method public final b()F
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lcom/instabug/library/internal/sensor/a$b;->b:F

    return v0
.end method

.method public final c()F
    .locals 1

    .prologue
    .line 190
    iget v0, p0, Lcom/instabug/library/internal/sensor/a$b;->c:F

    return v0
.end method

.method public final d()J
    .locals 2

    .prologue
    .line 194
    iget-wide v0, p0, Lcom/instabug/library/internal/sensor/a$b;->d:J

    return-wide v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SensorBundle{mXAcc="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/instabug/library/internal/sensor/a$b;->a:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mYAcc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/instabug/library/internal/sensor/a$b;->b:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mZAcc="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/instabug/library/internal/sensor/a$b;->c:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mTimestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/instabug/library/internal/sensor/a$b;->d:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
