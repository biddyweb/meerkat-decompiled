.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "TrackFragmentBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "traf"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const-string v0, "traf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 33
    return-void
.end method


# virtual methods
.method public getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    .locals 3
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 37
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes()Ljava/util/List;

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

    .line 38
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    if-eqz v2, :cond_0

    .line 39
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    .line 42
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
