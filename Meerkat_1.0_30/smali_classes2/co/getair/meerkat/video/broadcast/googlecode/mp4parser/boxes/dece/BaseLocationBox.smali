.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "BaseLocationBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "bloc"


# instance fields
.field baseLocation:Ljava/lang/String;

.field purchaseLocation:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    const-string v0, "bloc"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    .line 32
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "baseLocation"    # Ljava/lang/String;
    .param p2, "purchaseLocation"    # Ljava/lang/String;

    .prologue
    .line 39
    const-string v0, "bloc"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    .line 32
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    .line 41
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 68
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    .line 69
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    rsub-int v0, v0, 0x100

    add-int/lit8 v0, v0, -0x1

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 70
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    .line 71
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    rsub-int v0, v0, 0x100

    add-int/lit8 v0, v0, -0x1

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 72
    const/16 v0, 0x200

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 73
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 87
    if-ne p0, p1, :cond_1

    .line 96
    :cond_0
    :goto_0
    return v1

    .line 88
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 90
    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;

    .line 92
    .local v0, "that":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 93
    :cond_6
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 94
    goto :goto_0

    .line 93
    :cond_7
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getBaseLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    return-object v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 77
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 78
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 79
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    rsub-int v0, v0, 0x100

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 80
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 81
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    rsub-int v0, v0, 0x100

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 82
    const/16 v0, 0x200

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 83
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 62
    const-wide/16 v0, 0x404

    return-wide v0
.end method

.method public getPurchaseLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 101
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 102
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 103
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 101
    goto :goto_0
.end method

.method public setBaseLocation(Ljava/lang/String;)V
    .locals 0
    .param p1, "baseLocation"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setPurchaseLocation(Ljava/lang/String;)V
    .locals 0
    .param p1, "purchaseLocation"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BaseLocationBox{baseLocation=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->baseLocation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", purchaseLocation=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/BaseLocationBox;->purchaseLocation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
