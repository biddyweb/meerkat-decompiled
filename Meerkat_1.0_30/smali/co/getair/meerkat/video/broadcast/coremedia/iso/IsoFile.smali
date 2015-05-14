.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;
.source "IsoFile.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
.end annotation


# static fields
.field private static LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->getLogger(Ljava/lang/Class;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 2
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;-><init>([Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 2
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;-><init>()V

    .line 64
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->size()J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1, p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 51
    return-void
.end method

.method public static bytesToFourCC([B)Ljava/lang/String;
    .locals 5
    .param p0, "type"    # [B

    .prologue
    const/4 v4, 0x4

    const/4 v3, 0x0

    .line 78
    new-array v1, v4, [B

    fill-array-data v1, :array_0

    .line 79
    .local v1, "result":[B
    if-eqz p0, :cond_0

    .line 80
    array-length v2, p0

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {p0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    :cond_0
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "ISO-8859-1"

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/Error;

    const-string v3, "Required character encoding is missing"

    invoke-direct {v2, v3, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 78
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public static fourCCtoBytes(Ljava/lang/String;)[B
    .locals 4
    .param p0, "fourCC"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x4

    .line 68
    new-array v1, v3, [B

    .line 69
    .local v1, "result":[B
    if-eqz p0, :cond_0

    .line 70
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 74
    .end local v0    # "i":I
    :cond_0
    return-object v1
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 116
    return-void
.end method

.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 0
    .param p1, "os"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 112
    return-void
.end method

.method public getMovieBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;
    .locals 3

    .prologue
    .line 102
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getBoxes()Ljava/util/List;

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

    .line 103
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    if-eqz v2, :cond_0

    .line 104
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    .line 107
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 91
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getContainerSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "model("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
