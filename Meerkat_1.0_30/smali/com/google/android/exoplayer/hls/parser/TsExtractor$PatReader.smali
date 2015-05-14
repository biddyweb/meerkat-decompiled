.class Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;
.super Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/parser/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PatReader"
.end annotation


# instance fields
.field private final patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field final synthetic this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)V
    .locals 2

    .prologue
    .line 267
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;-><init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor$1;)V

    .line 268
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x4

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 269
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;Z)V
    .locals 8
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "payloadUnitStartIndicator"    # Z

    .prologue
    const/16 v7, 0xc

    .line 274
    if-eqz p2, :cond_0

    .line 275
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 276
    .local v2, "pointerField":I
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 279
    .end local v2    # "pointerField":I
    :cond_0
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v6, 0x3

    invoke-virtual {p1, v5, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 280
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v5, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 281
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v5, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v4

    .line 284
    .local v4, "sectionLength":I
    const/4 v5, 0x5

    invoke-virtual {p1, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 286
    add-int/lit8 v5, v4, -0x9

    div-int/lit8 v3, v5, 0x4

    .line 287
    .local v3, "programCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_1

    .line 288
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v6, 0x4

    invoke-virtual {p1, v5, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 289
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v6, 0x13

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 290
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->patScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v6, 0xd

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 291
    .local v1, "pid":I
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    # getter for: Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;
    invoke-static {v5}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->access$100(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;

    move-result-object v5

    new-instance v6, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;

    iget-object v7, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;->this$0:Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;-><init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)V

    invoke-virtual {v5, v1, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 287
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 295
    .end local v1    # "pid":I
    :cond_1
    return-void
.end method
