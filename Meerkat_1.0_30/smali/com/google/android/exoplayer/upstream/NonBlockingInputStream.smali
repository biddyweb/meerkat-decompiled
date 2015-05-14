.class public interface abstract Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
.super Ljava/lang/Object;
.source "NonBlockingInputStream.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract getAvailableByteCount()J
.end method

.method public abstract isEndOfStream()Z
.end method

.method public abstract read(Ljava/nio/ByteBuffer;I)I
.end method

.method public abstract read([BII)I
.end method

.method public abstract skip(I)I
.end method
