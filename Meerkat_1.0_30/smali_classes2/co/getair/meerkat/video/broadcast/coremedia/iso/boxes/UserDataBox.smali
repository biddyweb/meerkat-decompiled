.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/UserDataBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;
.source "UserDataBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "udta"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    const-string v0, "udta"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 0
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-super {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 49
    return-void
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 1
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-super/range {p0 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;->parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 44
    return-void
.end method
