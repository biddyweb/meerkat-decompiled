.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "OriginalFormatBox.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TYPE:Ljava/lang/String; = "frma"


# instance fields
.field private dataFormat:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-string v0, "frma"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 36
    const-string v0, "    "

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->dataFormat:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 58
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->dataFormat:Ljava/lang/String;

    .line 59
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 63
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->dataFormat:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 64
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 53
    const-wide/16 v0, 0x4

    return-wide v0
.end method

.method public getDataFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->dataFormat:Ljava/lang/String;

    return-object v0
.end method

.method public setDataFormat(Ljava/lang/String;)V
    .locals 2
    .param p1, "dataFormat"    # Ljava/lang/String;

    .prologue
    .line 48
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_0
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->dataFormat:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OriginalFormatBox[dataFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->getDataFormat()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
