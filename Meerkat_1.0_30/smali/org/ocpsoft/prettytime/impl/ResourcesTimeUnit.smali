.class public abstract Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;
.super Ljava/lang/Object;
.source "ResourcesTimeUnit.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/TimeUnit;


# instance fields
.field private maxQuantity:J

.field private millisPerUnit:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->maxQuantity:J

    .line 26
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->millisPerUnit:J

    return-void
.end method


# virtual methods
.method public getMaxQuantity()J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->maxQuantity:J

    return-wide v0
.end method

.method public getMillisPerUnit()J
    .locals 2

    .prologue
    .line 52
    iget-wide v0, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->millisPerUnit:J

    return-wide v0
.end method

.method protected getResourceBundleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    const-string v0, "org.ocpsoft.prettytime.i18n.Resources"

    return-object v0
.end method

.method protected abstract getResourceKeyPrefix()Ljava/lang/String;
.end method

.method public setMaxQuantity(J)V
    .locals 1
    .param p1, "maxQuantity"    # J

    .prologue
    .line 46
    iput-wide p1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->maxQuantity:J

    .line 47
    return-void
.end method

.method public setMillisPerUnit(J)V
    .locals 1
    .param p1, "millisPerUnit"    # J

    .prologue
    .line 57
    iput-wide p1, p0, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->millisPerUnit:J

    .line 58
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/ocpsoft/prettytime/impl/ResourcesTimeUnit;->getResourceKeyPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
