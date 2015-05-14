.class public interface abstract Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
.super Ljava/lang/Object;
.source "Box.java"


# virtual methods
.method public abstract getBox(Ljava/nio/channels/WritableByteChannel;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getOffset()J
.end method

.method public abstract getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
.end method

.method public abstract getSize()J
.end method

.method public abstract getType()Ljava/lang/String;
.end method

.method public abstract parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
.end method
