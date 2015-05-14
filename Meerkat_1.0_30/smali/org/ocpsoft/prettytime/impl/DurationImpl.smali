.class public Lorg/ocpsoft/prettytime/impl/DurationImpl;
.super Ljava/lang/Object;
.source "DurationImpl.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/Duration;


# instance fields
.field private delta:J

.field private quantity:J

.field private unit:Lorg/ocpsoft/prettytime/TimeUnit;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDelta()J
    .locals 2

    .prologue
    .line 53
    iget-wide v0, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->delta:J

    return-wide v0
.end method

.method public getQuantity()J
    .locals 2

    .prologue
    .line 31
    iget-wide v0, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->quantity:J

    return-wide v0
.end method

.method public getQuantityRounded(I)J
    .locals 8
    .param p1, "tolerance"    # I

    .prologue
    .line 76
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->getQuantity()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .line 78
    .local v0, "quantity":J
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->getDelta()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 80
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->getDelta()J

    move-result-wide v4

    long-to-double v4, v4

    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->getUnit()Lorg/ocpsoft/prettytime/TimeUnit;

    move-result-object v6

    invoke-interface {v6}, Lorg/ocpsoft/prettytime/TimeUnit;->getMillisPerUnit()J

    move-result-wide v6

    long-to-double v6, v6

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    .line 82
    .local v2, "threshold":D
    int-to-double v4, p1

    cmpl-double v4, v2, v4

    if-lez v4, :cond_0

    .line 84
    const-wide/16 v4, 0x1

    add-long/2addr v0, v4

    .line 87
    .end local v2    # "threshold":D
    :cond_0
    return-wide v0
.end method

.method public getUnit()Lorg/ocpsoft/prettytime/TimeUnit;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->unit:Lorg/ocpsoft/prettytime/TimeUnit;

    return-object v0
.end method

.method public isInFuture()Z
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->isInPast()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInPast()Z
    .locals 4

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/DurationImpl;->getQuantity()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDelta(J)V
    .locals 1
    .param p1, "delta"    # J

    .prologue
    .line 58
    iput-wide p1, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->delta:J

    .line 59
    return-void
.end method

.method public setQuantity(J)V
    .locals 1
    .param p1, "quantity"    # J

    .prologue
    .line 36
    iput-wide p1, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->quantity:J

    .line 37
    return-void
.end method

.method public setUnit(Lorg/ocpsoft/prettytime/TimeUnit;)V
    .locals 0
    .param p1, "unit"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    .line 47
    iput-object p1, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->unit:Lorg/ocpsoft/prettytime/TimeUnit;

    .line 48
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DurationImpl ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->quantity:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->unit:Lorg/ocpsoft/prettytime/TimeUnit;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", delta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/ocpsoft/prettytime/impl/DurationImpl;->delta:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
