.class interface abstract Lcom/google/android/exoplayer/chunk/parser/webm/EbmlReader;
.super Ljava/lang/Object;
.source "EbmlReader.java"


# static fields
.field public static final READ_RESULT_CONTINUE:I = 0x0

.field public static final READ_RESULT_END_OF_STREAM:I = 0x2

.field public static final READ_RESULT_NEED_MORE_DATA:I = 0x1

.field public static final TYPE_BINARY:I = 0x4

.field public static final TYPE_FLOAT:I = 0x5

.field public static final TYPE_MASTER:I = 0x1

.field public static final TYPE_STRING:I = 0x3

.field public static final TYPE_UNKNOWN:I = 0x0

.field public static final TYPE_UNSIGNED_INT:I = 0x2


# virtual methods
.method public abstract getBytesRead()J
.end method

.method public abstract read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract readBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Ljava/nio/ByteBuffer;I)V
.end method

.method public abstract readBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;[BI)V
.end method

.method public abstract readVarint(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)J
.end method

.method public abstract reset()V
.end method

.method public abstract setEventHandler(Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;)V
.end method

.method public abstract skipBytes(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)V
.end method
