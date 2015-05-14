.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "MediaBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "mdia"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "mdia"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 32
    return-void
.end method


# virtual methods
.method public getHandlerBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;
    .locals 3

    .prologue
    .line 53
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->getBoxes()Ljava/util/List;

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

    .line 54
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;

    if-eqz v2, :cond_0

    .line 55
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;

    .line 58
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMediaHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    .locals 3

    .prologue
    .line 44
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->getBoxes()Ljava/util/List;

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

    .line 45
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;

    if-eqz v2, :cond_0

    .line 46
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;

    .line 49
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMediaInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
    .locals 3

    .prologue
    .line 35
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->getBoxes()Ljava/util/List;

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

    .line 36
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;

    if-eqz v2, :cond_0

    .line 37
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;

    .line 40
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
