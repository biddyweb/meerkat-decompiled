.class final Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;
.super Ljava/lang/Object;
.source "WebmExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/parser/webm/EbmlEventHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "InnerEbmlEventHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;


# direct methods
.method private constructor <init>(Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;)V
    .locals 0

    .prologue
    .line 600
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;
    .param p2, "x1"    # Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$1;

    .prologue
    .line 600
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;-><init>(Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;)V

    return-void
.end method


# virtual methods
.method public getElementType(I)I
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 604
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->getElementType(I)I

    move-result v0

    return v0
.end method

.method public onBinaryElement(IJIILcom/google/android/exoplayer/upstream/NonBlockingInputStream;)Z
    .locals 8
    .param p1, "id"    # I
    .param p2, "elementOffsetBytes"    # J
    .param p4, "headerSizeBytes"    # I
    .param p5, "contentsSizeBytes"    # I
    .param p6, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 639
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    move v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->onBinaryElement(IJIILcom/google/android/exoplayer/upstream/NonBlockingInputStream;)Z

    move-result v0

    return v0
.end method

.method public onFloatElement(ID)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "value"    # D

    .prologue
    .line 627
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->onFloatElement(ID)Z

    .line 628
    return-void
.end method

.method public onIntegerElement(IJ)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 622
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->onIntegerElement(IJ)Z

    .line 623
    return-void
.end method

.method public onMasterElementEnd(I)V
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 617
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->onMasterElementEnd(I)Z

    .line 618
    return-void
.end method

.method public onMasterElementStart(IJIJ)V
    .locals 7
    .param p1, "id"    # I
    .param p2, "elementOffsetBytes"    # J
    .param p4, "headerSizeBytes"    # I
    .param p5, "contentsSizeBytes"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 611
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    move v1, p1

    move-wide v2, p2

    move v4, p4

    move-wide v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->onMasterElementStart(IJIJ)Z

    .line 613
    return-void
.end method

.method public onStringElement(ILjava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 632
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor$InnerEbmlEventHandler;->this$0:Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;->onStringElement(ILjava/lang/String;)Z

    .line 633
    return-void
.end method
