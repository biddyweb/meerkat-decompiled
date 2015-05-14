.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "SampleGroupDescriptionBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "sgpd"


# instance fields
.field private defaultLength:I

.field private groupEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    const-string v0, "sgpd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 50
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    .line 54
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->setVersion(I)V

    .line 55
    return-void
.end method

.method private parseGroupEntry(Ljava/nio/ByteBuffer;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;
    .param p2, "groupingType"    # Ljava/lang/String;

    .prologue
    .line 120
    const-string v1, "roll"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/RollRecoveryEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/RollRecoveryEntry;-><init>()V

    .line 141
    .local v0, "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :goto_0
    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->parse(Ljava/nio/ByteBuffer;)V

    .line 142
    return-object v0

    .line 122
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_0
    const-string v1, "rash"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 123
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/RateShareEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/RateShareEntry;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 124
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_1
    const-string v1, "seig"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 125
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 126
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_2
    const-string v1, "rap "

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 127
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/VisualRandomAccessEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/VisualRandomAccessEntry;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 128
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_3
    const-string v1, "tele"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 129
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/TemporalLevelEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/TemporalLevelEntry;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 130
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_4
    const-string v1, "sync"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 131
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/SyncSampleEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/SyncSampleEntry;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 132
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_5
    const-string v1, "tscl"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 133
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TemporalLayerSampleGroup;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TemporalLayerSampleGroup;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 134
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_6
    const-string v1, "tsas"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 135
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TemporalSubLayerSampleGroup;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/TemporalSubLayerSampleGroup;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 136
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_7
    const-string v1, "stsa"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 137
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/StepwiseTemporalLayerEntry;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/StepwiseTemporalLayerEntry;-><init>()V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0

    .line 139
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_8
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/UnknownEntry;

    invoke-direct {v0, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/UnknownEntry;-><init>(Ljava/lang/String;)V

    .restart local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    goto :goto_0
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 11
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v10, 0x1

    .line 91
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 92
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v8

    if-eq v8, v10, :cond_0

    .line 93
    new-instance v8, Ljava/lang/RuntimeException;

    const-string v9, "SampleGroupDescriptionBox are only supported in version 1"

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 95
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v5

    .line 96
    .local v5, "groupingType":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v8

    if-ne v8, v10, :cond_1

    .line 97
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v8

    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    .line 99
    :cond_1
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .local v0, "entryCount":J
    move-wide v2, v0

    .line 100
    .end local v0    # "entryCount":J
    .local v2, "entryCount":J
    :goto_0
    const-wide/16 v8, 0x1

    sub-long v0, v2, v8

    .end local v2    # "entryCount":J
    .restart local v0    # "entryCount":J
    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-lez v8, :cond_4

    .line 101
    iget v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    .line 102
    .local v6, "length":I
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v8

    if-ne v8, v10, :cond_3

    .line 103
    iget v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    if-nez v8, :cond_2

    .line 104
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v6

    .line 109
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    add-int v4, v8, v6

    .line 110
    .local v4, "finalPos":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 111
    .local v7, "parseMe":Ljava/nio/ByteBuffer;
    invoke-virtual {v7, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 112
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-direct {p0, v7, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->parseGroupEntry(Ljava/nio/ByteBuffer;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-wide v2, v0

    .line 114
    .end local v0    # "entryCount":J
    .restart local v2    # "entryCount":J
    goto :goto_0

    .line 107
    .end local v2    # "entryCount":J
    .end local v4    # "finalPos":I
    .end local v7    # "parseMe":Ljava/nio/ByteBuffer;
    .restart local v0    # "entryCount":J
    :cond_3
    new-instance v8, Ljava/lang/RuntimeException;

    const-string v9, "This should be implemented"

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 116
    .end local v6    # "length":I
    :cond_4
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 163
    if-ne p0, p1, :cond_1

    .line 179
    :cond_0
    :goto_0
    return v1

    .line 166
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 167
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 170
    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;

    .line 172
    .local v0, "that":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    iget v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 173
    goto :goto_0

    .line 175
    :cond_4
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 176
    goto :goto_0

    .line 175
    :cond_5
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v4, 0x1

    .line 75
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 76
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 77
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v1

    if-ne v1, v4, :cond_0

    .line 78
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 80
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v2, v1

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 81
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    .line 82
    .local v0, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v2

    if-ne v2, v4, :cond_1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    if-nez v2, :cond_1

    .line 83
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->get()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    int-to-long v2, v2

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 85
    :cond_1
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->get()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 87
    .end local v0    # "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_2
    return-void
.end method

.method protected getContentSize()J
    .locals 9

    .prologue
    const/4 v8, 0x1

    const-wide/16 v6, 0x4

    .line 59
    const-wide/16 v2, 0x8

    .line 60
    .local v2, "size":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v1

    if-ne v1, v8, :cond_0

    .line 61
    add-long/2addr v2, v6

    .line 63
    :cond_0
    add-long/2addr v2, v6

    .line 64
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    .line 65
    .local v0, "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getVersion()I

    move-result v4

    if-ne v4, v8, :cond_1

    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    if-nez v4, :cond_1

    .line 66
    add-long/2addr v2, v6

    .line 68
    :cond_1
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 69
    goto :goto_0

    .line 70
    .end local v0    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    :cond_2
    return-wide v2
.end method

.method public getDefaultLength()I
    .locals 1

    .prologue
    .line 146
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    return v0
.end method

.method public getGroupEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 154
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 184
    const/4 v0, 0x0

    .line 185
    .local v0, "result":I
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    add-int/lit8 v0, v1, 0x0

    .line 186
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 187
    return v0

    .line 186
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setDefaultLength(I)V
    .locals 0
    .param p1, "defaultLength"    # I

    .prologue
    .line 150
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    .line 151
    return-void
.end method

.method public setGroupEntries(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    .line 159
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SampleGroupDescriptionBox{groupingType=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    .line 193
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->getType()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", defaultLength="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->defaultLength:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", groupEntries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->groupEntries:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "????"

    goto :goto_0
.end method
