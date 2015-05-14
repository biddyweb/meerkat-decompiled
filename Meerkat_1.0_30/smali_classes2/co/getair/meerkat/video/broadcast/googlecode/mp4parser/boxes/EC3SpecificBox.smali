.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "EC3SpecificBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "dec3"


# instance fields
.field dataRate:I

.field entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field numIndSub:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "dec3"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 16
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    .line 22
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x1

    const/4 v4, 0x3

    .line 39
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 40
    .local v0, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/16 v3, 0xd

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->dataRate:I

    .line 41
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->numIndSub:I

    .line 46
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->numIndSub:I

    if-ge v2, v3, :cond_1

    .line 47
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;-><init>()V

    .line 48
    .local v1, "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->fscod:I

    .line 49
    invoke-virtual {v0, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->bsid:I

    .line 50
    invoke-virtual {v0, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->bsmod:I

    .line 51
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->acmod:I

    .line 52
    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->lfeon:I

    .line 53
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->reserved:I

    .line 54
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->num_dep_sub:I

    .line 55
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->num_dep_sub:I

    if-lez v3, :cond_0

    .line 56
    const/16 v3, 0x9

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->chan_loc:I

    .line 60
    :goto_1
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    iput v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->reserved2:I

    goto :goto_1

    .line 62
    .end local v1    # "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    :cond_1
    return-void
.end method

.method public addEntry(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;)V
    .locals 1
    .param p1, "entry"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;

    .prologue
    .line 95
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    return-void
.end method

.method public getContent(Ljava/nio/ByteBuffer;)V
    .locals 8
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x1

    const/4 v5, 0x3

    .line 66
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 67
    .local v0, "bwb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->dataRate:I

    const/16 v3, 0xd

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 68
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 69
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;

    .line 70
    .local v1, "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->fscod:I

    const/4 v4, 0x2

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 71
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->bsid:I

    invoke-virtual {v0, v3, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 72
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->bsmod:I

    invoke-virtual {v0, v3, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 73
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->acmod:I

    invoke-virtual {v0, v3, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 74
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->lfeon:I

    invoke-virtual {v0, v3, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 75
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->reserved:I

    invoke-virtual {v0, v3, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 76
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->num_dep_sub:I

    const/4 v4, 0x4

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 77
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->num_dep_sub:I

    if-lez v3, :cond_0

    .line 78
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->chan_loc:I

    const/16 v4, 0x9

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    goto :goto_0

    .line 80
    :cond_0
    iget v3, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->reserved2:I

    invoke-virtual {v0, v3, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    goto :goto_0

    .line 83
    .end local v1    # "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    :cond_1
    return-void
.end method

.method public getContentSize()J
    .locals 6

    .prologue
    .line 26
    const-wide/16 v2, 0x2

    .line 27
    .local v2, "size":J
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;

    .line 28
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->num_dep_sub:I

    if-lez v4, :cond_0

    .line 29
    const-wide/16 v4, 0x4

    add-long/2addr v2, v4

    goto :goto_0

    .line 31
    :cond_0
    const-wide/16 v4, 0x3

    add-long/2addr v2, v4

    goto :goto_0

    .line 34
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    :cond_1
    return-wide v2
.end method

.method public getDataRate()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->dataRate:I

    return v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getNumIndSub()I
    .locals 1

    .prologue
    .line 107
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->numIndSub:I

    return v0
.end method

.method public setDataRate(I)V
    .locals 0
    .param p1, "dataRate"    # I

    .prologue
    .line 103
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->dataRate:I

    .line 104
    return-void
.end method

.method public setEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->entries:Ljava/util/List;

    .line 92
    return-void
.end method

.method public setNumIndSub(I)V
    .locals 0
    .param p1, "numIndSub"    # I

    .prologue
    .line 111
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->numIndSub:I

    .line 112
    return-void
.end method
