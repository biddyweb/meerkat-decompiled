.class Lcom/google/android/exoplayer/hls/parser/H264Reader;
.super Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
.source "H264Reader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;
    }
.end annotation


# static fields
.field private static final NAL_UNIT_TYPE_AUD:I = 0x9

.field private static final NAL_UNIT_TYPE_IDR:I = 0x5

.field private static final NAL_UNIT_TYPE_PPS:I = 0x8

.field private static final NAL_UNIT_TYPE_SEI:I = 0x6

.field private static final NAL_UNIT_TYPE_SPS:I = 0x7


# instance fields
.field private isKeyframe:Z

.field private final pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

.field private final prefixFlags:[Z

.field private scratchEscapeCount:I

.field private scratchEscapePositions:[I

.field private final sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

.field private final seiReader:Lcom/google/android/exoplayer/hls/parser/SeiReader;

.field private final sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;Lcom/google/android/exoplayer/hls/parser/SeiReader;)V
    .locals 3
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;
    .param p2, "seiReader"    # Lcom/google/android/exoplayer/hls/parser/SeiReader;

    .prologue
    const/16 v2, 0x80

    .line 52
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 53
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->seiReader:Lcom/google/android/exoplayer/hls/parser/SeiReader;

    .line 54
    const/4 v0, 0x3

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->prefixFlags:[Z

    .line 55
    new-instance v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    const/4 v1, 0x7

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    .line 56
    new-instance v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    const/16 v1, 0x8

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    .line 57
    new-instance v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    const/4 v1, 0x6

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    .line 58
    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    .line 59
    return-void
.end method

.method private feedNalUnitTargetBuffersData([BII)V
    .locals 1
    .param p1, "dataArray"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->hasMediaFormat()Z

    move-result v0

    if-nez v0, :cond_0

    .line 129
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 130
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 133
    return-void
.end method

.method private feedNalUnitTargetBuffersStart(I)V
    .locals 1
    .param p1, "nalUnitType"    # I

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->hasMediaFormat()Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->startNalUnit(I)V

    .line 122
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->startNalUnit(I)V

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->startNalUnit(I)V

    .line 125
    return-void
.end method

.method private feedNalUnitTargetEnd(JI)V
    .locals 7
    .param p1, "pesTimeUs"    # J
    .param p3, "discardPadding"    # I

    .prologue
    .line 136
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p3}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->endNalUnit(I)Z

    .line 137
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p3}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->endNalUnit(I)Z

    .line 138
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v0, p3}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->endNalUnit(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    iget v1, v1, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->unescapeStream([BI)I

    move-result v3

    .line 140
    .local v3, "unescapedLength":I
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->seiReader:Lcom/google/android/exoplayer/hls/parser/SeiReader;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sei:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    iget-object v1, v1, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    const/4 v2, 0x0

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer/hls/parser/SeiReader;->read([BIIJ)V

    .line 142
    .end local v3    # "unescapedLength":I
    :cond_0
    return-void
.end method

.method private findNextUnescapeIndex([BII)I
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    .line 291
    move v0, p2

    .local v0, "i":I
    :goto_0
    add-int/lit8 v1, p3, -0x2

    if-ge v0, v1, :cond_1

    .line 292
    aget-byte v1, p1, v0

    if-nez v1, :cond_0

    add-int/lit8 v1, v0, 0x1

    aget-byte v1, p1, v1

    if-nez v1, :cond_0

    add-int/lit8 v1, v0, 0x2

    aget-byte v1, p1, v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 296
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 291
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move v0, p3

    .line 296
    goto :goto_1
.end method

.method private parseMediaFormat(Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;)V
    .locals 39
    .param p1, "sps"    # Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;
    .param p2, "pps"    # Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    .prologue
    .line 145
    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    move/from16 v35, v0

    move/from16 v0, v35

    new-array v0, v0, [B

    move-object/from16 v32, v0

    .line 146
    .local v32, "spsData":[B
    move-object/from16 v0, p2

    iget v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    move/from16 v35, v0

    move/from16 v0, v35

    new-array v0, v0, [B

    move-object/from16 v28, v0

    .line 147
    .local v28, "ppsData":[B
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    move-object/from16 v35, v0

    const/16 v36, 0x0

    const/16 v37, 0x0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    move/from16 v38, v0

    move-object/from16 v0, v35

    move/from16 v1, v36

    move-object/from16 v2, v32

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    move-object/from16 v35, v0

    const/16 v36, 0x0

    const/16 v37, 0x0

    move-object/from16 v0, p2

    iget v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    move/from16 v38, v0

    move-object/from16 v0, v35

    move/from16 v1, v36

    move-object/from16 v2, v28

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v20, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    move-object/from16 v35, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalLength:I

    move/from16 v36, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->unescapeStream([BI)I

    .line 155
    new-instance v6, Lcom/google/android/exoplayer/util/ParsableBitArray;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->nalData:[B

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    invoke-direct {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    .line 156
    .local v6, "bitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    const/16 v35, 0x20

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 157
    const/16 v35, 0x8

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v29

    .line 158
    .local v29, "profileIdc":I
    const/16 v35, 0x10

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 159
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 161
    const/4 v7, 0x1

    .line 162
    .local v7, "chromaFormatIdc":I
    const/16 v35, 0x64

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x6e

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x7a

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0xf4

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x2c

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x53

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x56

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x76

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x80

    move/from16 v0, v29

    move/from16 v1, v35

    if-eq v0, v1, :cond_0

    const/16 v35, 0x8a

    move/from16 v0, v29

    move/from16 v1, v35

    if-ne v0, v1, :cond_5

    .line 165
    :cond_0
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v7

    .line 166
    const/16 v35, 0x3

    move/from16 v0, v35

    if-ne v7, v0, :cond_1

    .line 167
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 169
    :cond_1
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 170
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 171
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 172
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v31

    .line 173
    .local v31, "seqScalingMatrixPresentFlag":Z
    if-eqz v31, :cond_5

    .line 174
    const/16 v35, 0x3

    move/from16 v0, v35

    if-eq v7, v0, :cond_3

    const/16 v21, 0x8

    .line 175
    .local v21, "limit":I
    :goto_0
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1
    move/from16 v0, v19

    move/from16 v1, v21

    if-ge v0, v1, :cond_5

    .line 176
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v30

    .line 177
    .local v30, "seqScalingListPresentFlag":Z
    if-eqz v30, :cond_2

    .line 178
    const/16 v35, 0x6

    move/from16 v0, v19

    move/from16 v1, v35

    if-ge v0, v1, :cond_4

    const/16 v35, 0x10

    :goto_2
    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-direct {v0, v6, v1}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->skipScalingList(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 175
    :cond_2
    add-int/lit8 v19, v19, 0x1

    goto :goto_1

    .line 174
    .end local v19    # "i":I
    .end local v21    # "limit":I
    .end local v30    # "seqScalingListPresentFlag":Z
    :cond_3
    const/16 v21, 0xc

    goto :goto_0

    .line 178
    .restart local v19    # "i":I
    .restart local v21    # "limit":I
    .restart local v30    # "seqScalingListPresentFlag":Z
    :cond_4
    const/16 v35, 0x40

    goto :goto_2

    .line 184
    .end local v19    # "i":I
    .end local v21    # "limit":I
    .end local v30    # "seqScalingListPresentFlag":Z
    .end local v31    # "seqScalingMatrixPresentFlag":Z
    :cond_5
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 185
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v35

    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v26, v0

    .line 186
    .local v26, "picOrderCntType":J
    const-wide/16 v36, 0x0

    cmp-long v35, v26, v36

    if-nez v35, :cond_9

    .line 187
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 197
    :cond_6
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 198
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 200
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v35

    add-int/lit8 v25, v35, 0x1

    .line 201
    .local v25, "picWidthInMbs":I
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v35

    add-int/lit8 v24, v35, 0x1

    .line 202
    .local v24, "picHeightInMapUnits":I
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v17

    .line 203
    .local v17, "frameMbsOnlyFlag":Z
    if-eqz v17, :cond_a

    const/16 v35, 0x1

    :goto_3
    rsub-int/lit8 v35, v35, 0x2

    mul-int v16, v35, v24

    .line 204
    .local v16, "frameHeightInMbs":I
    if-nez v17, :cond_7

    .line 205
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 208
    :cond_7
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 209
    mul-int/lit8 v18, v25, 0x10

    .line 210
    .local v18, "frameWidth":I
    mul-int/lit8 v15, v16, 0x10

    .line 211
    .local v15, "frameHeight":I
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v14

    .line 212
    .local v14, "frameCroppingFlag":Z
    if-eqz v14, :cond_8

    .line 213
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v11

    .line 214
    .local v11, "frameCropLeftOffset":I
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v12

    .line 215
    .local v12, "frameCropRightOffset":I
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v13

    .line 216
    .local v13, "frameCropTopOffset":I
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v10

    .line 218
    .local v10, "frameCropBottomOffset":I
    if-nez v7, :cond_c

    .line 219
    const/4 v8, 0x1

    .line 220
    .local v8, "cropUnitX":I
    if-eqz v17, :cond_b

    const/16 v35, 0x1

    :goto_4
    rsub-int/lit8 v9, v35, 0x2

    .line 227
    .local v9, "cropUnitY":I
    :goto_5
    add-int v35, v11, v12

    mul-int v35, v35, v8

    sub-int v18, v18, v35

    .line 228
    add-int v35, v13, v10

    mul-int v35, v35, v9

    sub-int v15, v15, v35

    .line 232
    .end local v8    # "cropUnitX":I
    .end local v9    # "cropUnitY":I
    .end local v10    # "frameCropBottomOffset":I
    .end local v11    # "frameCropLeftOffset":I
    .end local v12    # "frameCropRightOffset":I
    .end local v13    # "frameCropTopOffset":I
    :cond_8
    const-string v35, "video/avc"

    const/16 v36, -0x1

    move-object/from16 v0, v35

    move/from16 v1, v36

    move/from16 v2, v18

    move-object/from16 v3, v20

    invoke-static {v0, v1, v2, v15, v3}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v35

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->setMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 234
    return-void

    .line 188
    .end local v14    # "frameCroppingFlag":Z
    .end local v15    # "frameHeight":I
    .end local v16    # "frameHeightInMbs":I
    .end local v17    # "frameMbsOnlyFlag":Z
    .end local v18    # "frameWidth":I
    .end local v24    # "picHeightInMapUnits":I
    .end local v25    # "picWidthInMbs":I
    :cond_9
    const-wide/16 v36, 0x1

    cmp-long v35, v26, v36

    if-nez v35, :cond_6

    .line 189
    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v6, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 190
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readSignedExpGolombCodedInt()I

    .line 191
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readSignedExpGolombCodedInt()I

    .line 192
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v35

    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v22, v0

    .line 193
    .local v22, "numRefFramesInPicOrderCntCycle":J
    const/16 v19, 0x0

    .restart local v19    # "i":I
    :goto_6
    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v36, v0

    cmp-long v35, v36, v22

    if-gez v35, :cond_6

    .line 194
    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    .line 193
    add-int/lit8 v19, v19, 0x1

    goto :goto_6

    .line 203
    .end local v19    # "i":I
    .end local v22    # "numRefFramesInPicOrderCntCycle":J
    .restart local v17    # "frameMbsOnlyFlag":Z
    .restart local v24    # "picHeightInMapUnits":I
    .restart local v25    # "picWidthInMbs":I
    :cond_a
    const/16 v35, 0x0

    goto/16 :goto_3

    .line 220
    .restart local v8    # "cropUnitX":I
    .restart local v10    # "frameCropBottomOffset":I
    .restart local v11    # "frameCropLeftOffset":I
    .restart local v12    # "frameCropRightOffset":I
    .restart local v13    # "frameCropTopOffset":I
    .restart local v14    # "frameCroppingFlag":Z
    .restart local v15    # "frameHeight":I
    .restart local v16    # "frameHeightInMbs":I
    .restart local v18    # "frameWidth":I
    :cond_b
    const/16 v35, 0x0

    goto :goto_4

    .line 222
    .end local v8    # "cropUnitX":I
    :cond_c
    const/16 v35, 0x3

    move/from16 v0, v35

    if-ne v7, v0, :cond_d

    const/16 v34, 0x1

    .line 223
    .local v34, "subWidthC":I
    :goto_7
    const/16 v35, 0x1

    move/from16 v0, v35

    if-ne v7, v0, :cond_e

    const/16 v33, 0x2

    .line 224
    .local v33, "subHeightC":I
    :goto_8
    move/from16 v8, v34

    .line 225
    .restart local v8    # "cropUnitX":I
    if-eqz v17, :cond_f

    const/16 v35, 0x1

    :goto_9
    rsub-int/lit8 v35, v35, 0x2

    mul-int v9, v33, v35

    .restart local v9    # "cropUnitY":I
    goto :goto_5

    .line 222
    .end local v8    # "cropUnitX":I
    .end local v9    # "cropUnitY":I
    .end local v33    # "subHeightC":I
    .end local v34    # "subWidthC":I
    :cond_d
    const/16 v34, 0x2

    goto :goto_7

    .line 223
    .restart local v34    # "subWidthC":I
    :cond_e
    const/16 v33, 0x1

    goto :goto_8

    .line 225
    .restart local v8    # "cropUnitX":I
    .restart local v33    # "subHeightC":I
    :cond_f
    const/16 v35, 0x0

    goto :goto_9
.end method

.method private skipScalingList(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V
    .locals 5
    .param p1, "bitArray"    # Lcom/google/android/exoplayer/util/ParsableBitArray;
    .param p2, "size"    # I

    .prologue
    .line 237
    const/16 v2, 0x8

    .line 238
    .local v2, "lastScale":I
    const/16 v3, 0x8

    .line 239
    .local v3, "nextScale":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_2

    .line 240
    if-eqz v3, :cond_0

    .line 241
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readSignedExpGolombCodedInt()I

    move-result v0

    .line 242
    .local v0, "deltaScale":I
    add-int v4, v2, v0

    add-int/lit16 v4, v4, 0x100

    rem-int/lit16 v3, v4, 0x100

    .line 244
    .end local v0    # "deltaScale":I
    :cond_0
    if-nez v3, :cond_1

    .line 239
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v2, v3

    .line 244
    goto :goto_1

    .line 246
    :cond_2
    return-void
.end method

.method private unescapeStream([BI)I
    .locals 11
    .param p1, "data"    # [B
    .param p2, "limit"    # I

    .prologue
    .line 259
    const/4 v4, 0x0

    .line 260
    .local v4, "position":I
    const/4 v8, 0x0

    iput v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapeCount:I

    .line 261
    :cond_0
    :goto_0
    if-ge v4, p2, :cond_2

    .line 262
    invoke-direct {p0, p1, v4, p2}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->findNextUnescapeIndex([BII)I

    move-result v4

    .line 263
    if-ge v4, p2, :cond_0

    .line 264
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    array-length v8, v8

    iget v9, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapeCount:I

    if-gt v8, v9, :cond_1

    .line 266
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    array-length v9, v9

    mul-int/lit8 v9, v9, 0x2

    invoke-static {v8, v9}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v8

    iput-object v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    .line 269
    :cond_1
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    iget v9, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapeCount:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapeCount:I

    aput v4, v8, v9

    .line 270
    add-int/lit8 v4, v4, 0x3

    goto :goto_0

    .line 274
    :cond_2
    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapeCount:I

    sub-int v6, p2, v8

    .line 275
    .local v6, "unescapedLength":I
    const/4 v1, 0x0

    .line 276
    .local v1, "escapedPosition":I
    const/4 v7, 0x0

    .line 277
    .local v7, "unescapedPosition":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapeCount:I

    if-ge v2, v8, :cond_3

    .line 278
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->scratchEscapePositions:[I

    aget v3, v8, v2

    .line 279
    .local v3, "nextEscapePosition":I
    sub-int v0, v3, v1

    .line 280
    .local v0, "copyLength":I
    invoke-static {p1, v1, p1, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 281
    add-int/lit8 v8, v0, 0x3

    add-int/2addr v1, v8

    .line 282
    add-int/lit8 v8, v0, 0x2

    add-int/2addr v7, v8

    .line 277
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 285
    .end local v0    # "copyLength":I
    .end local v3    # "nextEscapePosition":I
    :cond_3
    sub-int v5, v6, v7

    .line 286
    .local v5, "remainingLength":I
    invoke-static {p1, v1, p1, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 287
    return v6
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;JZ)V
    .locals 10
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "pesTimeUs"    # J
    .param p4, "startOfPacket"    # Z

    .prologue
    const/4 v8, 0x0

    .line 63
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v7

    if-lez v7, :cond_8

    .line 64
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v6

    .line 65
    .local v6, "offset":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v2

    .line 66
    .local v2, "limit":I
    iget-object v0, p1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 69
    .local v0, "dataArray":[B
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v7

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 72
    :goto_0
    if-ge v6, v2, :cond_0

    .line 73
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->prefixFlags:[Z

    invoke-static {v0, v6, v2, v7}, Lcom/google/android/exoplayer/mp4/Mp4Util;->findNalUnit([BII[Z)I

    move-result v5

    .line 74
    .local v5, "nextNalUnitOffset":I
    if-ge v5, v2, :cond_7

    .line 79
    sub-int v1, v5, v6

    .line 80
    .local v1, "lengthToNalUnit":I
    if-lez v1, :cond_1

    .line 81
    invoke-direct {p0, v0, v6, v5}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->feedNalUnitTargetBuffersData([BII)V

    .line 84
    :cond_1
    invoke-static {v0, v5}, Lcom/google/android/exoplayer/mp4/Mp4Util;->getNalUnitType([BI)I

    move-result v4

    .line 85
    .local v4, "nalUnitType":I
    sub-int v3, v5, v2

    .line 86
    .local v3, "nalUnitOffsetInData":I
    const/16 v7, 0x9

    if-ne v4, v7, :cond_5

    .line 87
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->writingSample()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 88
    iget-boolean v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->isKeyframe:Z

    if-eqz v7, :cond_2

    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->hasMediaFormat()Z

    move-result v7

    if-nez v7, :cond_2

    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isCompleted()Z

    move-result v7

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;->isCompleted()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 89
    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->sps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->pps:Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;

    invoke-direct {p0, v7, v9}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->parseMediaFormat(Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;Lcom/google/android/exoplayer/hls/parser/H264Reader$NalUnitTargetBuffer;)V

    .line 91
    :cond_2
    iget-boolean v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->isKeyframe:Z

    invoke-virtual {p0, v7, v3}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->commitSample(ZI)V

    .line 93
    :cond_3
    invoke-virtual {p0, p2, p3, v3}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->startSample(JI)V

    .line 94
    iput-boolean v8, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->isKeyframe:Z

    .line 101
    :cond_4
    :goto_1
    if-gez v1, :cond_6

    neg-int v7, v1

    :goto_2
    invoke-direct {p0, p2, p3, v7}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->feedNalUnitTargetEnd(JI)V

    .line 103
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->feedNalUnitTargetBuffersStart(I)V

    .line 105
    add-int/lit8 v6, v5, 0x4

    .line 106
    goto :goto_0

    .line 95
    :cond_5
    const/4 v7, 0x5

    if-ne v4, v7, :cond_4

    .line 96
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/google/android/exoplayer/hls/parser/H264Reader;->isKeyframe:Z

    goto :goto_1

    :cond_6
    move v7, v8

    .line 101
    goto :goto_2

    .line 107
    .end local v1    # "lengthToNalUnit":I
    .end local v3    # "nalUnitOffsetInData":I
    .end local v4    # "nalUnitType":I
    :cond_7
    invoke-direct {p0, v0, v6, v2}, Lcom/google/android/exoplayer/hls/parser/H264Reader;->feedNalUnitTargetBuffersData([BII)V

    .line 108
    move v6, v2

    goto :goto_0

    .line 112
    .end local v0    # "dataArray":[B
    .end local v2    # "limit":I
    .end local v5    # "nextNalUnitOffset":I
    .end local v6    # "offset":I
    :cond_8
    return-void
.end method

.method public packetFinished()V
    .locals 0

    .prologue
    .line 117
    return-void
.end method
