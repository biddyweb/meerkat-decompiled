.class interface abstract Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;
.super Ljava/lang/Object;
.source "EbmlEventHandler.java"


# virtual methods
.method public abstract getElementType(I)I
.end method

.method public abstract onBinaryElement(IJIILcom/google/android/exoplayer/upstream/NonBlockingInputStream;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract onFloatElement(ID)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract onIntegerElement(IJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract onMasterElementEnd(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract onMasterElementStart(IJIJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract onStringElement(ILjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method
