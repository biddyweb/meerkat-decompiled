.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "SampleTableBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "stbl"


# instance fields
.field private sampleToChunkBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    const-string v0, "stbl"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 43
    return-void
.end method


# virtual methods
.method public getChunkOffsetBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;
    .locals 3

    .prologue
    .line 77
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 78
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;

    if-eqz v2, :cond_0

    .line 79
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;

    .line 82
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCompositionTimeToSample()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;
    .locals 3

    .prologue
    .line 116
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 117
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;

    if-eqz v2, :cond_0

    .line 118
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;

    .line 121
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleDependencyTypeBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;
    .locals 3

    .prologue
    .line 125
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 126
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;

    if-eqz v2, :cond_0

    .line 127
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;

    .line 130
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 3

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 47
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    if-eqz v2, :cond_0

    .line 48
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 51
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleSizeBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;
    .locals 3

    .prologue
    .line 55
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 56
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    if-eqz v2, :cond_0

    .line 57
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    .line 60
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleToChunkBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;
    .locals 3

    .prologue
    .line 64
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->sampleToChunkBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    if-eqz v1, :cond_0

    .line 65
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->sampleToChunkBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    .line 73
    :goto_0
    return-object v1

    .line 67
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 68
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    if-eqz v2, :cond_1

    .line 69
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->sampleToChunkBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    .line 70
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->sampleToChunkBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    goto :goto_0

    .line 73
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getStaticChunkOffsetBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
    .locals 3

    .prologue
    .line 96
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 97
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    if-eqz v2, :cond_0

    .line 98
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    .line 101
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSyncSampleBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;
    .locals 3

    .prologue
    .line 107
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 108
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;

    if-eqz v2, :cond_0

    .line 109
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;

    .line 112
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTimeToSampleBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;
    .locals 3

    .prologue
    .line 87
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 88
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    if-eqz v2, :cond_0

    .line 89
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    .line 92
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
