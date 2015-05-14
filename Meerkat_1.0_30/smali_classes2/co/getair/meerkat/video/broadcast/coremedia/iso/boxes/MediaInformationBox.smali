.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "MediaInformationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "minf"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    const-string v0, "minf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method


# virtual methods
.method public getMediaHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;
    .locals 3

    .prologue
    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->getBoxes()Ljava/util/List;

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

    .line 43
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;

    if-eqz v2, :cond_0

    .line 44
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;

    .line 47
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    .locals 3

    .prologue
    .line 33
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->getBoxes()Ljava/util/List;

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

    .line 34
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    if-eqz v2, :cond_0

    .line 35
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .line 38
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
