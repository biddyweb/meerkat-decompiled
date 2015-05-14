.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "AppendTrack.java"


# static fields
.field private static LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;


# instance fields
.field stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->getLogger(Ljava/lang/Class;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    return-void
.end method

.method public varargs constructor <init>([Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V
    .locals 7
    .param p1, "tracks"    # [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 65
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->appendTracknames([Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 66
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 68
    array-length v4, p1

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, p1, v2

    .line 70
    .local v0, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    if-nez v1, :cond_0

    .line 71
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 72
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v1

    const-class v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-virtual {v5, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 68
    :goto_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    .line 74
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v5

    invoke-direct {p0, v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->mergeStsds(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    goto :goto_1

    .line 78
    .end local v0    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_1
    return-void
.end method

.method public static varargs appendTracknames([Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/lang/String;
    .locals 7
    .param p0, "tracks"    # [Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    const/4 v3, 0x0

    .line 57
    const-string v0, ""

    .line 58
    .local v0, "name":Ljava/lang/String;
    array-length v4, p0

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v1, p0, v2

    .line 59
    .local v1, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " + "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 61
    .end local v1    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x3

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private mergeAudioSampleEntries(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    .locals 18
    .param p1, "ase1"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    .param p2, "ase2"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    .prologue
    .line 202
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getType()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;-><init>(Ljava/lang/String;)V

    .line 203
    .local v2, "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerFrame()J

    move-result-wide v14

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerFrame()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-nez v13, :cond_1

    .line 204
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerFrame()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setBytesPerFrame(J)V

    .line 209
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerPacket()J

    move-result-wide v14

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerPacket()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-nez v13, :cond_3

    .line 210
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerPacket()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setBytesPerPacket(J)V

    .line 214
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerSample()J

    move-result-wide v14

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerSample()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-nez v13, :cond_4

    .line 215
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBytesPerSample()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setBytesPerSample(J)V

    .line 220
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getChannelCount()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getChannelCount()I

    move-result v14

    if-ne v13, v14, :cond_5

    .line 221
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getChannelCount()I

    move-result v13

    invoke-virtual {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    .line 225
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getPacketSize()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getPacketSize()I

    move-result v14

    if-ne v13, v14, :cond_6

    .line 226
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getPacketSize()I

    move-result v13

    invoke-virtual {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setPacketSize(I)V

    .line 231
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getCompressionId()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getCompressionId()I

    move-result v14

    if-ne v13, v14, :cond_7

    .line 232
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getCompressionId()I

    move-result v13

    invoke-virtual {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setCompressionId(I)V

    .line 236
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v14

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-nez v13, :cond_8

    .line 237
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleRate(J)V

    .line 241
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleSize()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleSize()I

    move-result v14

    if-ne v13, v14, :cond_9

    .line 242
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleSize()I

    move-result v13

    invoke-virtual {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleSize(I)V

    .line 246
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSamplesPerPacket()J

    move-result-wide v14

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSamplesPerPacket()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-nez v13, :cond_a

    .line 247
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSamplesPerPacket()J

    move-result-wide v14

    invoke-virtual {v2, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSamplesPerPacket(J)V

    .line 251
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSoundVersion()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSoundVersion()I

    move-result v14

    if-ne v13, v14, :cond_b

    .line 252
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSoundVersion()I

    move-result v13

    invoke-virtual {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSoundVersion(I)V

    .line 256
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSoundVersion2Data()[B

    move-result-object v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSoundVersion2Data()[B

    move-result-object v14

    invoke-static {v13, v14}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 257
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSoundVersion2Data()[B

    move-result-object v13

    invoke-virtual {v2, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSoundVersion2Data([B)V

    .line 261
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-ne v13, v14, :cond_2

    .line 262
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 263
    .local v5, "bxs1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 264
    .local v6, "bxs2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 265
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 266
    .local v7, "cur1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 267
    .local v8, "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 268
    .local v3, "baos1":Ljava/io/ByteArrayOutputStream;
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 270
    .local v4, "baos2":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-static {v3}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v13

    invoke-interface {v7, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 271
    invoke-static {v4}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v13

    invoke-interface {v8, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v14

    invoke-static {v13, v14}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 277
    invoke-virtual {v2, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 206
    .end local v3    # "baos1":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "baos2":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "bxs1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v6    # "bxs2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v7    # "cur1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v8    # "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_1
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v14, "BytesPerFrame differ"

    invoke-virtual {v13, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 207
    const/4 v2, 0x0

    .line 289
    .end local v2    # "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    :cond_2
    :goto_1
    return-object v2

    .line 212
    .restart local v2    # "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    .line 217
    :cond_4
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v14, "BytesPerSample differ"

    invoke-virtual {v13, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 218
    const/4 v2, 0x0

    goto :goto_1

    .line 223
    :cond_5
    const/4 v2, 0x0

    goto :goto_1

    .line 228
    :cond_6
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v14, "ChannelCount differ"

    invoke-virtual {v13, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 229
    const/4 v2, 0x0

    goto :goto_1

    .line 234
    :cond_7
    const/4 v2, 0x0

    goto :goto_1

    .line 239
    :cond_8
    const/4 v2, 0x0

    goto :goto_1

    .line 244
    :cond_9
    const/4 v2, 0x0

    goto :goto_1

    .line 249
    :cond_a
    const/4 v2, 0x0

    goto :goto_1

    .line 254
    :cond_b
    const/4 v2, 0x0

    goto :goto_1

    .line 259
    :cond_c
    const/4 v2, 0x0

    goto :goto_1

    .line 272
    .restart local v3    # "baos1":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "baos2":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "bxs1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v6    # "bxs2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v7    # "cur1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .restart local v8    # "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :catch_0
    move-exception v9

    .line 273
    .local v9, "e":Ljava/io/IOException;
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    invoke-virtual {v9}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logWarn(Ljava/lang/String;)V

    .line 274
    const/4 v2, 0x0

    goto :goto_1

    .line 279
    .end local v9    # "e":Ljava/io/IOException;
    :cond_d
    const-string v13, "esds"

    invoke-interface {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getType()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    const-string v13, "esds"

    invoke-interface {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getType()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    move-object v11, v7

    .line 280
    check-cast v11, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;

    .local v11, "esdsBox1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    move-object v12, v8

    .line 281
    check-cast v12, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;

    .line 282
    .local v12, "esdsBox2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    invoke-virtual {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->getEsDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    move-result-object v13

    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->getEsDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->mergeDescriptors(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    move-result-object v10

    .line 283
    .local v10, "esd":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    invoke-virtual {v11, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->setDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)V

    .line 284
    invoke-virtual {v2, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_0
.end method

.method private mergeDescriptors(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    .locals 10
    .param p1, "des1"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;
    .param p2, "des2"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    .prologue
    const/4 v4, 0x0

    .line 295
    instance-of v5, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    if-eqz v5, :cond_1d

    instance-of v5, p2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    if-eqz v5, :cond_1d

    move-object v2, p1

    .line 296
    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    .local v2, "esds1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    move-object v3, p2

    .line 297
    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    .line 298
    .local v3, "esds2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLFlag()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLFlag()I

    move-result v6

    if-eq v5, v6, :cond_1

    move-object v2, v4

    .line 373
    .end local v2    # "esds1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    .end local v3    # "esds2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    :cond_0
    :goto_0
    return-object v2

    .line 301
    .restart local v2    # "esds1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    .restart local v3    # "esds2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    :cond_1
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLLength()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLLength()I

    move-result v6

    if-eq v5, v6, :cond_2

    .line 304
    :cond_2
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDependsOnEsId()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDependsOnEsId()I

    move-result v6

    if-eq v5, v6, :cond_3

    move-object v2, v4

    .line 305
    goto :goto_0

    .line 307
    :cond_3
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getEsId()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getEsId()I

    move-result v6

    if-eq v5, v6, :cond_4

    move-object v2, v4

    .line 308
    goto :goto_0

    .line 310
    :cond_4
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getoCREsId()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getoCREsId()I

    move-result v6

    if-eq v5, v6, :cond_5

    move-object v2, v4

    .line 311
    goto :goto_0

    .line 313
    :cond_5
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getoCRstreamFlag()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getoCRstreamFlag()I

    move-result v6

    if-eq v5, v6, :cond_6

    move-object v2, v4

    .line 314
    goto :goto_0

    .line 316
    :cond_6
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getRemoteODFlag()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getRemoteODFlag()I

    move-result v6

    if-eq v5, v6, :cond_7

    move-object v2, v4

    .line 317
    goto :goto_0

    .line 319
    :cond_7
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getStreamDependenceFlag()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getStreamDependenceFlag()I

    move-result v6

    if-eq v5, v6, :cond_8

    move-object v2, v4

    .line 320
    goto :goto_0

    .line 322
    :cond_8
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getStreamPriority()I

    move-result v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getStreamPriority()I

    move-result v6

    if-eq v5, v6, :cond_9

    .line 325
    :cond_9
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLString()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_c

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 328
    :cond_a
    :goto_1
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDecoderConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    move-result-object v5

    if-eqz v5, :cond_d

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDecoderConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    move-result-object v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDecoderConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_e

    .line 329
    :cond_b
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDecoderConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    move-result-object v0

    .line 330
    .local v0, "dcd1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDecoderConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    move-result-object v1

    .line 332
    .local v1, "dcd2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAudioSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;

    move-result-object v5

    if-eqz v5, :cond_10

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAudioSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;

    move-result-object v5

    if-eqz v5, :cond_10

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAudioSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;

    move-result-object v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAudioSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;

    move-result-object v6

    invoke-virtual {v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_10

    move-object v2, v4

    .line 333
    goto/16 :goto_0

    .line 325
    .end local v0    # "dcd1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    .end local v1    # "dcd2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    :cond_c
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getURLString()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_a

    goto :goto_1

    .line 328
    :cond_d
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getDecoderConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    move-result-object v5

    if-nez v5, :cond_b

    .line 364
    :cond_e
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getOtherDescriptors()Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_1a

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getOtherDescriptors()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getOtherDescriptors()Ljava/util/List;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1b

    :cond_f
    move-object v2, v4

    .line 365
    goto/16 :goto_0

    .line 335
    .restart local v0    # "dcd1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    .restart local v1    # "dcd2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    :cond_10
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAvgBitRate()J

    move-result-wide v6

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAvgBitRate()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-eqz v5, :cond_11

    .line 336
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAvgBitRate()J

    move-result-wide v6

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getAvgBitRate()J

    move-result-wide v8

    add-long/2addr v6, v8

    const-wide/16 v8, 0x2

    div-long/2addr v6, v8

    invoke-virtual {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setAvgBitRate(J)V

    .line 338
    :cond_11
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getBufferSizeDB()I

    move-result v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getBufferSizeDB()I

    move-result v6

    if-eq v5, v6, :cond_12

    .line 342
    :cond_12
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getDecoderSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderSpecificInfo;

    move-result-object v5

    if-eqz v5, :cond_14

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getDecoderSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderSpecificInfo;

    move-result-object v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getDecoderSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderSpecificInfo;

    move-result-object v6

    invoke-virtual {v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderSpecificInfo;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_15

    :cond_13
    move-object v2, v4

    .line 343
    goto/16 :goto_0

    .line 342
    :cond_14
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getDecoderSpecificInfo()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderSpecificInfo;

    move-result-object v5

    if-nez v5, :cond_13

    .line 346
    :cond_15
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getMaxBitRate()J

    move-result-wide v6

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getMaxBitRate()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-eqz v5, :cond_16

    .line 347
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getMaxBitRate()J

    move-result-wide v6

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getMaxBitRate()J

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setMaxBitRate(J)V

    .line 349
    :cond_16
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getProfileLevelIndicationDescriptors()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getProfileLevelIndicationDescriptors()Ljava/util/List;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    move-object v2, v4

    .line 350
    goto/16 :goto_0

    .line 353
    :cond_17
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getObjectTypeIndication()I

    move-result v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getObjectTypeIndication()I

    move-result v6

    if-eq v5, v6, :cond_18

    move-object v2, v4

    .line 354
    goto/16 :goto_0

    .line 356
    :cond_18
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getStreamType()I

    move-result v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getStreamType()I

    move-result v6

    if-eq v5, v6, :cond_19

    move-object v2, v4

    .line 357
    goto/16 :goto_0

    .line 359
    :cond_19
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getUpStream()I

    move-result v5

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->getUpStream()I

    move-result v6

    if-eq v5, v6, :cond_e

    move-object v2, v4

    .line 360
    goto/16 :goto_0

    .line 364
    .end local v0    # "dcd1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    .end local v1    # "dcd2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    :cond_1a
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getOtherDescriptors()Ljava/util/List;

    move-result-object v5

    if-nez v5, :cond_f

    .line 367
    :cond_1b
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getSlConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;

    move-result-object v5

    if-eqz v5, :cond_1c

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getSlConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;

    move-result-object v5

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getSlConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;

    move-result-object v6

    invoke-virtual {v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    :goto_2
    move-object v2, v4

    .line 368
    goto/16 :goto_0

    .line 367
    :cond_1c
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->getSlConfigDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;

    move-result-object v5

    if-eqz v5, :cond_0

    goto :goto_2

    .line 372
    .end local v2    # "esds1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    .end local v3    # "esds2":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    :cond_1d
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v6, "I can only merge ESDescriptors"

    invoke-virtual {v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    move-object v2, v4

    .line 373
    goto/16 :goto_0
.end method

.method private mergeSampleEntry(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    .locals 3
    .param p1, "se1"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    .param p2, "se2"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    .prologue
    const/4 v0, 0x0

    .line 111
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 118
    .end local p1    # "se1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    .end local p2    # "se2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    :cond_0
    :goto_0
    return-object v0

    .line 113
    .restart local p1    # "se1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    .restart local p2    # "se2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    :cond_1
    instance-of v1, p1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    if-eqz v1, :cond_2

    instance-of v1, p2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    if-eqz v1, :cond_2

    .line 114
    check-cast p1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    .end local p1    # "se1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    check-cast p2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    .end local p2    # "se2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->mergeVisualSampleEntry(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    move-result-object v0

    goto :goto_0

    .line 115
    .restart local p1    # "se1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    .restart local p2    # "se2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    :cond_2
    instance-of v1, p1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    if-eqz v1, :cond_0

    instance-of v1, p2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    if-eqz v1, :cond_0

    .line 116
    check-cast p1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    .end local p1    # "se1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    check-cast p2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    .end local p2    # "se2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->mergeAudioSampleEntries(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    move-result-object v0

    goto :goto_0
.end method

.method private mergeStsds(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 10
    .param p1, "stsd1"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .param p2, "stsd2"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 87
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 88
    .local v1, "curBaos":Ljava/io/ByteArrayOutputStream;
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 90
    .local v4, "refBaos":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-static {v1}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v6

    invoke-virtual {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 91
    invoke-static {v4}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v6

    invoke-virtual {p2, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBox(Ljava/nio/channels/WritableByteChannel;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 97
    .local v0, "cur":[B
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 99
    .local v3, "ref":[B
    invoke-static {v3, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v6

    if-nez v6, :cond_0

    .line 100
    const-class v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    invoke-virtual {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    const-class v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    invoke-virtual {p2, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    invoke-direct {p0, v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->mergeSampleEntry(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    move-result-object v5

    .line 101
    .local v5, "se":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    if-eqz v5, :cond_1

    .line 102
    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {p1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->setBoxes(Ljava/util/List;)V

    .line 107
    .end local v0    # "cur":[B
    .end local v3    # "ref":[B
    .end local v5    # "se":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    .end local p1    # "stsd1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    :cond_0
    :goto_0
    return-object p1

    .line 92
    .restart local p1    # "stsd1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    :catch_0
    move-exception v2

    .line 93
    .local v2, "e":Ljava/io/IOException;
    sget-object v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 94
    const/4 p1, 0x0

    goto :goto_0

    .line 104
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "cur":[B
    .restart local v3    # "ref":[B
    .restart local v5    # "se":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    :cond_1
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cannot merge "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-class v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    invoke-virtual {p1, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " and "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-class v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;

    invoke-virtual {p2, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private mergeVisualSampleEntry(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    .locals 14
    .param p1, "vse1"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    .param p2, "vse2"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    .prologue
    .line 123
    new-instance v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    invoke-direct {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;-><init>()V

    .line 124
    .local v8, "vse":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHorizresolution()D

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHorizresolution()D

    move-result-wide v12

    cmpl-double v9, v10, v12

    if-nez v9, :cond_1

    .line 125
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHorizresolution()D

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHorizresolution(D)V

    .line 130
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getCompressorname()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setCompressorname(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getDepth()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getDepth()I

    move-result v10

    if-ne v9, v10, :cond_3

    .line 132
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getDepth()I

    move-result v9

    invoke-virtual {v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setDepth(I)V

    .line 138
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getFrameCount()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getFrameCount()I

    move-result v10

    if-ne v9, v10, :cond_4

    .line 139
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getFrameCount()I

    move-result v9

    invoke-virtual {v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setFrameCount(I)V

    .line 145
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHeight()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHeight()I

    move-result v10

    if-ne v9, v10, :cond_5

    .line 146
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHeight()I

    move-result v9

    invoke-virtual {v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHeight(I)V

    .line 151
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getWidth()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getWidth()I

    move-result v10

    if-ne v9, v10, :cond_6

    .line 152
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getWidth()I

    move-result v9

    invoke-virtual {v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setWidth(I)V

    .line 158
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getVertresolution()D

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getVertresolution()D

    move-result-wide v12

    cmpl-double v9, v10, v12

    if-nez v9, :cond_7

    .line 159
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getVertresolution()D

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setVertresolution(D)V

    .line 165
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHorizresolution()D

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHorizresolution()D

    move-result-wide v12

    cmpl-double v9, v10, v12

    if-nez v9, :cond_8

    .line 166
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getHorizresolution()D

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHorizresolution(D)V

    .line 172
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ne v9, v10, :cond_2

    .line 173
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 174
    .local v2, "bxs1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 175
    .local v3, "bxs2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 176
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 177
    .local v4, "cur1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 178
    .local v5, "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 179
    .local v0, "baos1":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 181
    .local v1, "baos2":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-static {v0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v9

    invoke-interface {v4, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 182
    invoke-static {v1}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v9

    invoke-interface {v5, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    invoke-static {v9, v10}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 188
    invoke-virtual {v8, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 127
    .end local v0    # "baos1":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "baos2":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "bxs1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v3    # "bxs2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v4    # "cur1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v5    # "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_1
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "Horizontal Resolution differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 128
    const/4 v8, 0x0

    .line 198
    .end local v8    # "vse":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    :cond_2
    :goto_1
    return-object v8

    .line 134
    .restart local v8    # "vse":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    :cond_3
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "Depth differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 135
    const/4 v8, 0x0

    goto :goto_1

    .line 141
    :cond_4
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "frame count differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 142
    const/4 v8, 0x0

    goto :goto_1

    .line 148
    :cond_5
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "height differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 149
    const/4 v8, 0x0

    goto :goto_1

    .line 154
    :cond_6
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "width differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 155
    const/4 v8, 0x0

    goto :goto_1

    .line 161
    :cond_7
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "vert resolution differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 162
    const/4 v8, 0x0

    goto :goto_1

    .line 168
    :cond_8
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    const-string v10, "horizontal resolution differs"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logError(Ljava/lang/String;)V

    .line 169
    const/4 v8, 0x0

    goto :goto_1

    .line 183
    .restart local v0    # "baos1":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "baos2":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "bxs1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v3    # "bxs2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v4    # "cur1":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .restart local v5    # "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :catch_0
    move-exception v6

    .line 184
    .local v6, "e":Ljava/io/IOException;
    sget-object v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->logWarn(Ljava/lang/String;)V

    .line 185
    const/4 v8, 0x0

    goto :goto_1

    .line 190
    .end local v6    # "e":Ljava/io/IOException;
    :cond_9
    instance-of v9, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;

    if-eqz v9, :cond_0

    instance-of v9, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;

    if-eqz v9, :cond_0

    move-object v9, v4

    .line 191
    check-cast v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;

    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->getDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    move-result-object v9

    check-cast v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;

    .end local v5    # "cur2":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->getDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    move-result-object v10

    invoke-direct {p0, v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->mergeDescriptors(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    move-result-object v7

    .local v7, "esd":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;
    move-object v9, v4

    .line 192
    check-cast v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;

    invoke-virtual {v9, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->setDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)V

    .line 193
    invoke-virtual {v8, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 82
    .local v0, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->close()V

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 84
    .end local v0    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    return-void
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 408
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    aget-object v6, v6, v8

    invoke-interface {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_4

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    aget-object v6, v6, v8

    invoke-interface {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 409
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 410
    .local v4, "lists":Ljava/util/List;, "Ljava/util/List<[I>;"
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v9, v7

    move v6, v8

    :goto_0
    if-ge v6, v9, :cond_0

    aget-object v5, v7, v6

    .line 411
    .local v5, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v10

    invoke-static {v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;->blowupCompositionTimes(Ljava/util/List;)[I

    move-result-object v10

    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 413
    .end local v5    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 414
    .local v1, "compositionTimeEntries":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 415
    .local v3, "list":[I
    array-length v10, v3

    move v7, v8

    :goto_1
    if-ge v7, v10, :cond_1

    aget v0, v3, v7

    .line 416
    .local v0, "compositionTime":I
    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getOffset()I

    move-result v6

    if-eq v6, v0, :cond_3

    .line 417
    :cond_2
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    const/4 v6, 0x1

    invoke-direct {v2, v6, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;-><init>(II)V

    .line 418
    .local v2, "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 415
    :goto_2
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    goto :goto_1

    .line 420
    .end local v2    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    :cond_3
    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    .line 421
    .restart local v2    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v2, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->setCount(I)V

    goto :goto_2

    .line 427
    .end local v0    # "compositionTime":I
    .end local v1    # "compositionTimeEntries":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    .end local v2    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    .end local v3    # "list":[I
    .end local v4    # "lists":Ljava/util/List;, "Ljava/util/List<[I>;"
    :cond_4
    const/4 v1, 0x0

    :cond_5
    return-object v1
.end method

.method public getHandler()Ljava/lang/String;
    .locals 2

    .prologue
    .line 470
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 454
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    aget-object v3, v3, v2

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    aget-object v3, v3, v2

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 455
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 456
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;>;"
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v4, v3

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v1, v3, v2

    .line 457
    .local v1, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 456
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 461
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;>;"
    .end local v1    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    const/4 v0, 0x0

    :cond_1
    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 388
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public declared-synchronized getSampleDurations()[J
    .locals 14

    .prologue
    const/4 v8, 0x0

    .line 392
    monitor-enter p0

    const/4 v3, 0x0

    .line 393
    .local v3, "numSamples":I
    :try_start_0
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v10, v9

    move v7, v8

    :goto_0
    if-ge v7, v10, :cond_0

    aget-object v6, v9, v7

    .line 394
    .local v6, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v11

    array-length v11, v11

    add-int/2addr v3, v11

    .line 393
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 396
    .end local v6    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    new-array v0, v3, [J

    .line 397
    .local v0, "decodingTimes":[J
    const/4 v1, 0x0

    .line 399
    .local v1, "index":I
    iget-object v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v11, v10

    move v9, v8

    :goto_1
    if-ge v9, v11, :cond_2

    aget-object v6, v10, v9

    .line 400
    .restart local v6    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v12

    array-length v13, v12

    move v7, v8

    move v2, v1

    .end local v1    # "index":I
    .local v2, "index":I
    :goto_2
    if-ge v7, v13, :cond_1

    aget-wide v4, v12, v7

    .line 401
    .local v4, "l":J
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    aput-wide v4, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 400
    add-int/lit8 v7, v7, 0x1

    move v2, v1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    goto :goto_2

    .line 399
    .end local v4    # "l":J
    :cond_1
    add-int/lit8 v7, v9, 0x1

    move v9, v7

    move v1, v2

    .end local v2    # "index":I
    .restart local v1    # "index":I
    goto :goto_1

    .line 404
    .end local v6    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_2
    monitor-exit p0

    return-object v0

    .line 392
    .end local v0    # "decodingTimes":[J
    .end local v1    # "index":I
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method public getSamples()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 378
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .local v0, "lists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v1, v3, v2

    .line 381
    .local v1, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 380
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 384
    .end local v1    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 2

    .prologue
    .line 474
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 20

    .prologue
    .line 432
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    const/4 v12, 0x0

    aget-object v11, v11, v12

    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v11

    if-eqz v11, :cond_2

    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    const/4 v12, 0x0

    aget-object v11, v11, v12

    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v11

    array-length v11, v11

    if-lez v11, :cond_2

    .line 433
    const/4 v4, 0x0

    .line 434
    .local v4, "numSyncSamples":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v13, v12

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v13, :cond_0

    aget-object v10, v12, v11

    .line 435
    .local v10, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v14

    array-length v14, v14

    add-int/2addr v4, v14

    .line 434
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 437
    .end local v10    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    new-array v7, v4, [J

    .line 439
    .local v7, "returnSyncSamples":[J
    const/4 v5, 0x0

    .line 440
    .local v5, "pos":I
    const-wide/16 v8, 0x0

    .line 441
    .local v8, "samplesBefore":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    array-length v14, v13

    const/4 v11, 0x0

    move v12, v11

    :goto_1
    if-ge v12, v14, :cond_3

    aget-object v10, v13, v12

    .line 442
    .restart local v10    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v15

    array-length v0, v15

    move/from16 v16, v0

    const/4 v11, 0x0

    move v6, v5

    .end local v5    # "pos":I
    .local v6, "pos":I
    :goto_2
    move/from16 v0, v16

    if-ge v11, v0, :cond_1

    aget-wide v2, v15, v11

    .line 443
    .local v2, "l":J
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "pos":I
    .restart local v5    # "pos":I
    add-long v18, v8, v2

    aput-wide v18, v7, v6

    .line 442
    add-int/lit8 v11, v11, 0x1

    move v6, v5

    .end local v5    # "pos":I
    .restart local v6    # "pos":I
    goto :goto_2

    .line 445
    .end local v2    # "l":J
    :cond_1
    invoke-interface {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    int-to-long v0, v11

    move-wide/from16 v16, v0

    add-long v8, v8, v16

    .line 441
    add-int/lit8 v11, v12, 0x1

    move v12, v11

    move v5, v6

    .end local v6    # "pos":I
    .restart local v5    # "pos":I
    goto :goto_1

    .line 449
    .end local v4    # "numSyncSamples":I
    .end local v5    # "pos":I
    .end local v7    # "returnSyncSamples":[J
    .end local v8    # "samplesBefore":J
    .end local v10    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_2
    const/4 v7, 0x0

    :cond_3
    return-object v7
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 2

    .prologue
    .line 466
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AppendTrack;->tracks:[Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v0

    return-object v0
.end method
