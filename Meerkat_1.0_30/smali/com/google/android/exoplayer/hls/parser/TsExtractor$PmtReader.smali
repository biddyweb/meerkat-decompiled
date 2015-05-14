.class Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;
.super Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/parser/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PmtReader"
.end annotation


# instance fields
.field private final pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field final synthetic this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)V
    .locals 2

    .prologue
    .line 306
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;-><init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor$1;)V

    .line 307
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x5

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 308
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;Z)V
    .locals 12
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "payloadUnitStartIndicator"    # Z

    .prologue
    .line 313
    if-eqz p2, :cond_0

    .line 314
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 315
    .local v4, "pointerField":I
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 318
    .end local v4    # "pointerField":I
    :cond_0
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x3

    invoke-virtual {p1, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 319
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v10, 0xc

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 320
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v10, 0xc

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 325
    .local v6, "sectionLength":I
    const/4 v9, 0x7

    invoke-virtual {p1, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 327
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x2

    invoke-virtual {p1, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 328
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 329
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v10, 0xc

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 332
    .local v5, "programInfoLength":I
    invoke-virtual {p1, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 334
    add-int/lit8 v9, v6, -0x9

    sub-int/2addr v9, v5

    add-int/lit8 v1, v9, -0x4

    .line 336
    .local v1, "entriesSize":I
    :cond_1
    :goto_0
    if-lez v1, :cond_2

    .line 337
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x5

    invoke-virtual {p1, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 338
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v8

    .line 339
    .local v8, "streamType":I
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 340
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v10, 0xd

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v0

    .line 341
    .local v0, "elementaryPid":I
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 342
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->pmtScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v10, 0xc

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v2

    .line 345
    .local v2, "esInfoLength":I
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 346
    add-int/lit8 v9, v2, 0x5

    sub-int/2addr v1, v9

    .line 348
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$200(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v9

    invoke-virtual {v9, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_1

    .line 352
    const/4 v3, 0x0

    .line 353
    .local v3, "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    sparse-switch v8, :sswitch_data_0

    .line 367
    :goto_1
    if-eqz v3, :cond_1

    .line 368
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$200(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v9

    invoke-virtual {v9, v8, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 369
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$100(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v9

    new-instance v10, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;

    iget-object v11, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    invoke-direct {v10, v11, v3}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;-><init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor;Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;)V

    invoke-virtual {v9, v0, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 355
    :sswitch_0
    new-instance v3, Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$300(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Lcom/google/android/exoplayer/upstream/BufferPool;

    move-result-object v9

    invoke-direct {v3, v9}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 356
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    goto :goto_1

    .line 358
    :sswitch_1
    new-instance v7, Lcom/google/android/exoplayer/hls/parser/SeiReader;

    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$300(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Lcom/google/android/exoplayer/upstream/BufferPool;

    move-result-object v9

    invoke-direct {v7, v9}, Lcom/google/android/exoplayer/hls/parser/SeiReader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 359
    .local v7, "seiReader":Lcom/google/android/exoplayer/hls/parser/SeiReader;
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$200(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v9

    const/16 v10, 0x100

    invoke-virtual {v9, v10, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 360
    new-instance v3, Lcom/google/android/exoplayer/hls/parser/H264Reader;

    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$300(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Lcom/google/android/exoplayer/upstream/BufferPool;

    move-result-object v9

    invoke-direct {v3, v9, v7}, Lcom/google/android/exoplayer/hls/parser/H264Reader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;Lcom/google/android/exoplayer/hls/parser/SeiReader;)V

    .line 361
    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    goto :goto_1

    .line 363
    .end local v7    # "seiReader":Lcom/google/android/exoplayer/hls/parser/SeiReader;
    :sswitch_2
    new-instance v3, Lcom/google/android/exoplayer/hls/parser/Id3Reader;

    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;
    invoke-static {v9}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$300(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Lcom/google/android/exoplayer/upstream/BufferPool;

    move-result-object v9

    invoke-direct {v3, v9}, Lcom/google/android/exoplayer/hls/parser/Id3Reader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .restart local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    goto :goto_1

    .line 374
    .end local v0    # "elementaryPid":I
    .end local v2    # "esInfoLength":I
    .end local v3    # "pesPayloadReader":Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
    .end local v8    # "streamType":I
    :cond_2
    return-void

    .line 353
    nop

    :sswitch_data_0
    .sparse-switch
        0xf -> :sswitch_0
        0x15 -> :sswitch_2
        0x1b -> :sswitch_1
    .end sparse-switch
.end method
