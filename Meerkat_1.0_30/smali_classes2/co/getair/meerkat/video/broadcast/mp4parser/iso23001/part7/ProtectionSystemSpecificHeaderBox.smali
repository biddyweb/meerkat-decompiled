.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "ProtectionSystemSpecificHeaderBox.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static OMA2_SYSTEM_ID:[B = null

.field public static PLAYREADY_SYSTEM_ID:[B = null

.field public static final TYPE:Ljava/lang/String; = "pssh"


# instance fields
.field content:[B

.field keyIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field

.field systemId:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->$assertionsDisabled:Z

    .line 35
    const-string v0, "A2B55680-6F43-11E0-9A3F-0002A5D5C51B"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/UUIDConverter;->convert(Ljava/util/UUID;)[B

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->OMA2_SYSTEM_ID:[B

    .line 36
    const-string v0, "9A04F079-9840-4286-AB92-E65BE0885F95"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/UUIDConverter;->convert(Ljava/util/UUID;)[B

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->PLAYREADY_SYSTEM_ID:[B

    return-void

    .line 32
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 70
    const-string v0, "pssh"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    .line 71
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 9
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v8, 0x10

    .line 101
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 102
    new-array v3, v8, [B

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->systemId:[B

    .line 103
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->systemId:[B

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 104
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->getVersion()I

    move-result v3

    if-lez v3, :cond_0

    .line 105
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .local v0, "count":I
    move v1, v0

    .line 106
    .end local v0    # "count":I
    .local v1, "count":I
    :goto_0
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    if-lez v1, :cond_0

    .line 107
    new-array v2, v8, [B

    .line 108
    .local v2, "k":[B
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 109
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/UUIDConverter;->convert([B)Ljava/util/UUID;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v1, v0

    .line 110
    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_0

    .line 112
    .end local v1    # "count":I
    .end local v2    # "k":[B
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v4

    .line 113
    .local v4, "length":J
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    .line 114
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 115
    sget-boolean v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->$assertionsDisabled:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    array-length v3, v3

    int-to-long v6, v3

    cmp-long v3, v4, v6

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 116
    :cond_1
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v3, 0x10

    .line 85
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 86
    sget-boolean v1, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->systemId:[B

    array-length v1, v1

    if-eq v1, v3, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 87
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->systemId:[B

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 88
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->getVersion()I

    move-result v1

    if-lez v1, :cond_1

    .line 89
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 90
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    .line 91
    .local v0, "keyId":Ljava/util/UUID;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/UUIDConverter;->convert(Ljava/util/UUID;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 95
    .end local v0    # "keyId":Ljava/util/UUID;
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    array-length v1, v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 96
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 97
    return-void
.end method

.method public getContent()[B
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    return-object v0
.end method

.method protected getContentSize()J
    .locals 4

    .prologue
    .line 75
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    array-length v2, v2

    add-int/lit8 v2, v2, 0x18

    int-to-long v0, v2

    .line 76
    .local v0, "l":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->getVersion()I

    move-result v2

    if-lez v2, :cond_0

    .line 77
    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    .line 78
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x10

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 80
    :cond_0
    return-wide v0
.end method

.method public getKeyIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    return-object v0
.end method

.method public getSystemId()[B
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->systemId:[B

    return-object v0
.end method

.method public setContent([B)V
    .locals 0
    .param p1, "content"    # [B

    .prologue
    .line 66
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->content:[B

    .line 67
    return-void
.end method

.method public setKeyIds(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/UUID;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "keyIds":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->keyIds:Ljava/util/List;

    .line 47
    return-void
.end method

.method public setSystemId([B)V
    .locals 2
    .param p1, "systemId"    # [B

    .prologue
    .line 57
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    array-length v0, p1

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_0
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/ProtectionSystemSpecificHeaderBox;->systemId:[B

    .line 59
    return-void
.end method
