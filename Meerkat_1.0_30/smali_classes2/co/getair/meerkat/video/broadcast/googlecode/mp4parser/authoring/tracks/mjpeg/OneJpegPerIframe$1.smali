.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;
.super Ljava/util/AbstractList;
.source "OneJpegPerIframe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getSamples()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;

    .prologue
    .line 141
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 150
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1$1;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;I)V

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->jpegs:[Ljava/io/File;

    array-length v0, v0

    return v0
.end method
