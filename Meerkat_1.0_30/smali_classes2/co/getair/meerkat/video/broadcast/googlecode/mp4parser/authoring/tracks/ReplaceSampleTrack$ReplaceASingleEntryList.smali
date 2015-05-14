.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;
.super Ljava/util/AbstractList;
.source "ReplaceSampleTrack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReplaceASingleEntryList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;


# direct methods
.method private constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;)V
    .locals 0

    .prologue
    .line 93
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$1;)V
    .locals 0
    .param p1, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;
    .param p2, "x1"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$1;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;)V

    return-void
.end method


# virtual methods
.method public get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 96
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->sampleNumber:J
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;)J

    move-result-wide v0

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 97
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->sampleContent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->access$200(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    .line 99
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    goto :goto_0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
