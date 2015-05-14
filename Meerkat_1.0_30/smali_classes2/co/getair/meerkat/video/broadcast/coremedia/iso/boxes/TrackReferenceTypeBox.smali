.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "TrackReferenceTypeBox.java"


# static fields
.field public static final TYPE1:Ljava/lang/String; = "hint"

.field public static final TYPE2:Ljava/lang/String; = "cdsc"


# instance fields
.field private trackIds:[J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 46
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    div-int/lit8 v0, v2, 0x4

    .line 47
    .local v0, "count":I
    new-array v2, v0, [J

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    .line 48
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 49
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 48
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 51
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 55
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-wide v0, v3, v2

    .line 56
    .local v0, "trackId":J
    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 55
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 58
    .end local v0    # "trackId":J
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 62
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    int-to-long v0, v0

    return-wide v0
.end method

.method public getTrackIds()[J
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v2, "TrackReferenceTypeBox[type="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 69
    const-string v2, ";trackId"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    const-string v2, "="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackReferenceTypeBox;->trackIds:[J

    aget-wide v2, v2, v1

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 68
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 74
    :cond_0
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
