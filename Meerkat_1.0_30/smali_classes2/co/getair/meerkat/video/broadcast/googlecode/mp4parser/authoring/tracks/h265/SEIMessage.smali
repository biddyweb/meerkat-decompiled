.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SEIMessage;
.super Ljava/lang/Object;
.source "SEIMessage.java"


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;)V
    .locals 10
    .param p1, "bsr"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0xff

    const/16 v7, 0x8

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v5, 0x0

    .line 14
    .local v5, "payloadType":I
    :goto_0
    invoke-virtual {p1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v6

    int-to-long v0, v6

    .local v0, "ff_byte":J
    cmp-long v6, v0, v8

    if-nez v6, :cond_0

    .line 15
    add-int/lit16 v5, v5, 0xff

    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    .line 18
    .local v3, "last_payload_type_byte":I
    add-int/2addr v5, v3

    .line 19
    const/4 v4, 0x0

    .line 20
    .local v4, "payloadSize":I
    :goto_1
    invoke-virtual {p1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v6

    int-to-long v0, v6

    cmp-long v6, v0, v8

    if-nez v6, :cond_1

    .line 21
    add-int/lit16 v4, v4, 0xff

    goto :goto_1

    .line 23
    :cond_1
    invoke-virtual {p1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v2

    .line 24
    .local v2, "last_payload_size_byte":I
    add-int/2addr v4, v2

    .line 25
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "payloadType "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    return-void
.end method
