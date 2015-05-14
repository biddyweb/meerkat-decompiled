.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;
.super Ljava/lang/Object;
.source "TrickPlayBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation


# instance fields
.field private value:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    .line 48
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;

    .prologue
    .line 41
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    return v0
.end method


# virtual methods
.method public getDependencyLevel()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    and-int/lit8 v0, v0, 0x3f

    return v0
.end method

.method public getPicType()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    shr-int/lit8 v0, v0, 0x6

    and-int/lit8 v0, v0, 0x3

    return v0
.end method

.method public setDependencyLevel(I)V
    .locals 2
    .param p1, "dependencyLevel"    # I

    .prologue
    .line 67
    and-int/lit8 v0, p1, 0x3f

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    or-int/2addr v0, v1

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    .line 68
    return-void
.end method

.method public setPicType(I)V
    .locals 2
    .param p1, "picType"    # I

    .prologue
    .line 58
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    and-int/lit8 v0, v0, 0x1f

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    .line 59
    and-int/lit8 v0, p1, 0x3

    shl-int/lit8 v0, v0, 0x6

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    or-int/2addr v0, v1

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->value:I

    .line 60
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "Entry"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v1, "{picType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->getPicType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    const-string v1, ",dependencyLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/dece/TrickPlayBox$Entry;->getDependencyLevel()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
