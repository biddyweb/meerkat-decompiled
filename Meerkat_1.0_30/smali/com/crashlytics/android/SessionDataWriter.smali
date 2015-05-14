.class Lcom/crashlytics/android/SessionDataWriter;
.super Ljava/lang/Object;
.source "SessionDataWriter.java"


# static fields
.field private static final SIGNAL_DEFAULT:Ljava/lang/String; = "0"

.field private static final SIGNAL_DEFAULT_BYTE_STRING:Lcom/crashlytics/android/ByteString;


# instance fields
.field private final context:Landroid/content/Context;

.field private exceptionStack:[Ljava/lang/StackTraceElement;

.field private final maxChainedExceptionsDepth:I

.field private final optionalBuildIdBytes:Lcom/crashlytics/android/ByteString;

.field private final packageNameBytes:Lcom/crashlytics/android/ByteString;

.field private runningAppProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

.field private stacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[",
            "Ljava/lang/StackTraceElement;",
            ">;"
        }
    .end annotation
.end field

.field private threads:[Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "0"

    invoke-static {v0}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v0

    sput-object v0, Lcom/crashlytics/android/SessionDataWriter;->SIGNAL_DEFAULT_BYTE_STRING:Lcom/crashlytics/android/ByteString;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "buildId"    # Ljava/lang/String;
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/16 v0, 0x8

    iput v0, p0, Lcom/crashlytics/android/SessionDataWriter;->maxChainedExceptionsDepth:I

    .line 50
    iput-object p1, p0, Lcom/crashlytics/android/SessionDataWriter;->context:Landroid/content/Context;

    .line 51
    invoke-static {p3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v0

    iput-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->packageNameBytes:Lcom/crashlytics/android/ByteString;

    .line 52
    if-nez p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->optionalBuildIdBytes:Lcom/crashlytics/android/ByteString;

    .line 54
    return-void

    .line 52
    :cond_0
    const-string v0, "-"

    const-string v1, ""

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v0

    goto :goto_0
.end method

.method private getBinaryImageSize()I
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 454
    const/4 v0, 0x0

    .line 456
    .local v0, "size":I
    const/4 v1, 0x1

    invoke-static {v1, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    .line 457
    const/4 v1, 0x2

    invoke-static {v1, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    .line 458
    const/4 v1, 0x3

    iget-object v2, p0, Lcom/crashlytics/android/SessionDataWriter;->packageNameBytes:Lcom/crashlytics/android/ByteString;

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 459
    iget-object v1, p0, Lcom/crashlytics/android/SessionDataWriter;->optionalBuildIdBytes:Lcom/crashlytics/android/ByteString;

    if-eqz v1, :cond_0

    .line 460
    const/4 v1, 0x4

    iget-object v2, p0, Lcom/crashlytics/android/SessionDataWriter;->optionalBuildIdBytes:Lcom/crashlytics/android/ByteString;

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 463
    :cond_0
    return v0
.end method

.method private getDeviceIdentifierSize(Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;)I
    .locals 3
    .param p1, "type"    # Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 419
    const/4 v1, 0x1

    iget v2, p1, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;->protobufIndex:I

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeEnumSize(II)I

    move-result v0

    .line 420
    .local v0, "size":I
    const/4 v1, 0x2

    invoke-static {p2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 422
    return v0
.end method

.method private getEventAppCustomAttributeSize(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 551
    const/4 v1, 0x1

    invoke-static {p1}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v0

    .line 552
    .local v0, "size":I
    const/4 v1, 0x2

    if-nez p2, :cond_0

    const-string p2, ""

    .end local p2    # "value":Ljava/lang/String;
    :cond_0
    invoke-static {p2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 554
    return v0
.end method

.method private getEventAppExecutionExceptionSize(Ljava/lang/Throwable;I)I
    .locals 13
    .param p1, "ex"    # Ljava/lang/Throwable;
    .param p2, "chainDepth"    # I

    .prologue
    const/4 v12, 0x1

    .line 580
    const/4 v9, 0x0

    .line 582
    .local v9, "size":I
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v10

    invoke-static {v12, v10}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v10

    add-int/2addr v9, v10

    .line 586
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    .line 587
    .local v7, "message":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 588
    const/4 v10, 0x3

    invoke-static {v7}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v10

    add-int/2addr v9, v10

    .line 591
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v2, v0, v5

    .line 592
    .local v2, "element":Ljava/lang/StackTraceElement;
    invoke-direct {p0, v2, v12}, Lcom/crashlytics/android/SessionDataWriter;->getFrameSize(Ljava/lang/StackTraceElement;Z)I

    move-result v4

    .line 593
    .local v4, "frameSize":I
    const/4 v10, 0x4

    invoke-static {v10}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v10

    invoke-static {v4}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v11

    add-int/2addr v10, v11

    add-int/2addr v10, v4

    add-int/2addr v9, v10

    .line 591
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 599
    .end local v2    # "element":Ljava/lang/StackTraceElement;
    .end local v4    # "frameSize":I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 600
    .local v1, "cause":Ljava/lang/Throwable;
    if-eqz v1, :cond_2

    .line 601
    iget v10, p0, Lcom/crashlytics/android/SessionDataWriter;->maxChainedExceptionsDepth:I

    if-ge p2, v10, :cond_3

    .line 602
    add-int/lit8 v10, p2, 0x1

    invoke-direct {p0, v1, v10}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionExceptionSize(Ljava/lang/Throwable;I)I

    move-result v3

    .line 604
    .local v3, "exceptionSize":I
    const/4 v10, 0x6

    invoke-static {v10}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v10

    invoke-static {v3}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v11

    add-int/2addr v10, v11

    add-int/2addr v10, v3

    add-int/2addr v9, v10

    .line 619
    .end local v3    # "exceptionSize":I
    :cond_2
    :goto_1
    return v9

    .line 609
    :cond_3
    const/4 v8, 0x0

    .line 610
    .local v8, "overflowCount":I
    :goto_2
    if-eqz v1, :cond_4

    .line 611
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 612
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 615
    :cond_4
    const/4 v10, 0x7

    invoke-static {v10, v8}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v10

    add-int/2addr v9, v10

    goto :goto_1
.end method

.method private getEventAppExecutionSignalSize()I
    .locals 4

    .prologue
    .line 623
    const/4 v0, 0x0

    .line 625
    .local v0, "size":I
    const/4 v1, 0x1

    sget-object v2, Lcom/crashlytics/android/SessionDataWriter;->SIGNAL_DEFAULT_BYTE_STRING:Lcom/crashlytics/android/ByteString;

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 626
    const/4 v1, 0x2

    sget-object v2, Lcom/crashlytics/android/SessionDataWriter;->SIGNAL_DEFAULT_BYTE_STRING:Lcom/crashlytics/android/ByteString;

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 627
    const/4 v1, 0x3

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    .line 629
    return v0
.end method

.method private getEventAppExecutionSize(Ljava/lang/Thread;Ljava/lang/Throwable;)I
    .locals 13
    .param p1, "exceptionThread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 521
    const/4 v5, 0x0

    .line 523
    .local v5, "size":I
    iget-object v8, p0, Lcom/crashlytics/android/SessionDataWriter;->exceptionStack:[Ljava/lang/StackTraceElement;

    const/4 v9, 0x4

    invoke-direct {p0, p1, v8, v9, v10}, Lcom/crashlytics/android/SessionDataWriter;->getThreadSize(Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)I

    move-result v7

    .line 524
    .local v7, "threadSize":I
    invoke-static {v10}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v8

    invoke-static {v7}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v7

    add-int/2addr v5, v8

    .line 527
    iget-object v8, p0, Lcom/crashlytics/android/SessionDataWriter;->threads:[Ljava/lang/Thread;

    array-length v3, v8

    .line 528
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 529
    iget-object v8, p0, Lcom/crashlytics/android/SessionDataWriter;->threads:[Ljava/lang/Thread;

    aget-object v6, v8, v2

    .line 530
    .local v6, "thread":Ljava/lang/Thread;
    iget-object v8, p0, Lcom/crashlytics/android/SessionDataWriter;->stacks:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/StackTraceElement;

    invoke-direct {p0, v6, v8, v11, v11}, Lcom/crashlytics/android/SessionDataWriter;->getThreadSize(Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)I

    move-result v7

    .line 531
    invoke-static {v10}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v8

    invoke-static {v7}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v7

    add-int/2addr v5, v8

    .line 528
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 535
    .end local v6    # "thread":Ljava/lang/Thread;
    :cond_0
    invoke-direct {p0, p2, v10}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionExceptionSize(Ljava/lang/Throwable;I)I

    move-result v1

    .line 536
    .local v1, "exceptionSize":I
    const/4 v8, 0x2

    invoke-static {v8}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v8

    invoke-static {v1}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v1

    add-int/2addr v5, v8

    .line 539
    invoke-direct {p0}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionSignalSize()I

    move-result v4

    .line 540
    .local v4, "signalSize":I
    invoke-static {v12}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v8

    invoke-static {v4}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v4

    add-int/2addr v5, v8

    .line 543
    invoke-direct {p0}, Lcom/crashlytics/android/SessionDataWriter;->getBinaryImageSize()I

    move-result v0

    .line 544
    .local v0, "binaryImageSize":I
    invoke-static {v12}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v8

    invoke-static {v0}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v0

    add-int/2addr v5, v8

    .line 547
    return v5
.end method

.method private getEventAppSize(Ljava/lang/Thread;Ljava/lang/Throwable;ILjava/util/Map;)I
    .locals 9
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "orientation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Thread;",
            "Ljava/lang/Throwable;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p4, "customAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x1

    .line 494
    const/4 v4, 0x0

    .line 496
    .local v4, "size":I
    invoke-direct {p0, p1, p2}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionSize(Ljava/lang/Thread;Ljava/lang/Throwable;)I

    move-result v2

    .line 497
    .local v2, "executionSize":I
    invoke-static {v7}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v5

    invoke-static {v2}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v6

    add-int/2addr v5, v6

    add-int/2addr v5, v2

    add-int/2addr v4, v5

    .line 500
    if-eqz p4, :cond_0

    .line 501
    invoke-interface {p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 502
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppCustomAttributeSize(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 504
    .local v1, "entrySize":I
    const/4 v5, 0x2

    invoke-static {v5}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v5

    invoke-static {v1}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v6

    add-int/2addr v5, v6

    add-int/2addr v5, v1

    add-int/2addr v4, v5

    .line 506
    goto :goto_0

    .line 510
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "entrySize":I
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v5, p0, Lcom/crashlytics/android/SessionDataWriter;->runningAppProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    if-eqz v5, :cond_1

    .line 511
    const/4 v6, 0x3

    iget-object v5, p0, Lcom/crashlytics/android/SessionDataWriter;->runningAppProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget v5, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v8, 0x64

    if-eq v5, v8, :cond_2

    move v5, v7

    :goto_1
    invoke-static {v6, v5}, Lcom/crashlytics/android/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v5

    add-int/2addr v4, v5

    .line 515
    :cond_1
    const/4 v5, 0x4

    invoke-static {v5, p3}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v5

    add-int/2addr v4, v5

    .line 517
    return v4

    .line 511
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private getEventDeviceSize(FIZIJJ)I
    .locals 3
    .param p1, "batteryLevel"    # F
    .param p2, "batterVelocity"    # I
    .param p3, "proximityEnabled"    # Z
    .param p4, "orientation"    # I
    .param p5, "heapAllocatedSize"    # J
    .param p7, "diskUsed"    # J

    .prologue
    .line 560
    const/4 v0, 0x0

    .line 562
    .local v0, "size":I
    const/4 v1, 0x1

    invoke-static {v1, p1}, Lcom/crashlytics/android/CodedOutputStream;->computeFloatSize(IF)I

    move-result v1

    add-int/2addr v0, v1

    .line 563
    const/4 v1, 0x2

    invoke-static {v1, p2}, Lcom/crashlytics/android/CodedOutputStream;->computeSInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 564
    const/4 v1, 0x3

    invoke-static {v1, p3}, Lcom/crashlytics/android/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    .line 565
    const/4 v1, 0x4

    invoke-static {v1, p4}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 566
    const/4 v1, 0x5

    invoke-static {v1, p5, p6}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    .line 567
    const/4 v1, 0x6

    invoke-static {v1, p7, p8}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    .line 569
    return v0
.end method

.method private getEventLogSize(Lcom/crashlytics/android/ByteString;)I
    .locals 1
    .param p1, "log"    # Lcom/crashlytics/android/ByteString;

    .prologue
    .line 576
    const/4 v0, 0x1

    invoke-static {v0, p1}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v0

    return v0
.end method

.method private getFrameSize(Ljava/lang/StackTraceElement;Z)I
    .locals 7
    .param p1, "element"    # Ljava/lang/StackTraceElement;
    .param p2, "isCrashedThread"    # Z

    .prologue
    const/4 v1, 0x2

    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 633
    const/4 v0, 0x0

    .line 635
    .local v0, "size":I
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 637
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-long v4, v3

    invoke-static {v6, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v3

    add-int/2addr v0, v3

    .line 642
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v3

    add-int/2addr v0, v3

    .line 645
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 646
    const/4 v3, 0x3

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v3

    add-int/2addr v0, v3

    .line 650
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v3

    if-lez v3, :cond_1

    .line 652
    const/4 v3, 0x4

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v4

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v3

    add-int/2addr v0, v3

    .line 654
    :cond_1
    const/4 v3, 0x5

    if-eqz p2, :cond_3

    :goto_1
    invoke-static {v3, v1}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 656
    return v0

    .line 639
    :cond_2
    const-wide/16 v4, 0x0

    invoke-static {v6, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_0

    :cond_3
    move v1, v2

    .line 654
    goto :goto_1
.end method

.method private getSessionAppOrgSize()I
    .locals 4

    .prologue
    .line 400
    const/4 v0, 0x0

    .line 401
    .local v0, "size":I
    const/4 v1, 0x1

    new-instance v2, Lio/fabric/sdk/android/services/common/ApiKey;

    invoke-direct {v2}, Lio/fabric/sdk/android/services/common/ApiKey;-><init>()V

    iget-object v3, p0, Lcom/crashlytics/android/SessionDataWriter;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lio/fabric/sdk/android/services/common/ApiKey;->getValue(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 404
    return v0
.end method

.method private getSessionAppSize(Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;I)I
    .locals 4
    .param p1, "packageName"    # Lcom/crashlytics/android/ByteString;
    .param p2, "versionCode"    # Lcom/crashlytics/android/ByteString;
    .param p3, "versionName"    # Lcom/crashlytics/android/ByteString;
    .param p4, "installUuid"    # Lcom/crashlytics/android/ByteString;
    .param p5, "deliveryMechanism"    # I

    .prologue
    .line 385
    const/4 v1, 0x0

    .line 387
    .local v1, "size":I
    const/4 v2, 0x1

    invoke-static {v2, p1}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v2

    add-int/2addr v1, v2

    .line 388
    const/4 v2, 0x2

    invoke-static {v2, p2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v2

    add-int/2addr v1, v2

    .line 389
    const/4 v2, 0x3

    invoke-static {v2, p3}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v2

    add-int/2addr v1, v2

    .line 390
    invoke-direct {p0}, Lcom/crashlytics/android/SessionDataWriter;->getSessionAppOrgSize()I

    move-result v0

    .line 391
    .local v0, "orgSize":I
    const/4 v2, 0x5

    invoke-static {v2}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v2

    invoke-static {v0}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v2, v0

    add-int/2addr v1, v2

    .line 393
    const/4 v2, 0x6

    invoke-static {v2, p4}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v2

    add-int/2addr v1, v2

    .line 394
    const/16 v2, 0xa

    invoke-static {v2, p5}, Lcom/crashlytics/android/CodedOutputStream;->computeEnumSize(II)I

    move-result v2

    add-int/2addr v1, v2

    .line 396
    return v1
.end method

.method private getSessionDeviceSize(ILcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;IJJZLjava/util/Map;ILcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;)I
    .locals 7
    .param p1, "arch"    # I
    .param p2, "clsDeviceID"    # Lcom/crashlytics/android/ByteString;
    .param p3, "model"    # Lcom/crashlytics/android/ByteString;
    .param p4, "availableProcessors"    # I
    .param p5, "totalRam"    # J
    .param p7, "diskSpace"    # J
    .param p9, "isEmulator"    # Z
    .param p11, "state"    # I
    .param p12, "manufacturer"    # Lcom/crashlytics/android/ByteString;
    .param p13, "modelClass"    # Lcom/crashlytics/android/ByteString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/crashlytics/android/ByteString;",
            "Lcom/crashlytics/android/ByteString;",
            "IJJZ",
            "Ljava/util/Map",
            "<",
            "Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;",
            "Ljava/lang/String;",
            ">;I",
            "Lcom/crashlytics/android/ByteString;",
            "Lcom/crashlytics/android/ByteString;",
            ")I"
        }
    .end annotation

    .prologue
    .line 430
    .local p10, "ids":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 432
    .local v4, "size":I
    const/4 v5, 0x1

    invoke-static {v5, p2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v5

    add-int/2addr v4, v5

    .line 433
    const/4 v5, 0x3

    invoke-static {v5, p1}, Lcom/crashlytics/android/CodedOutputStream;->computeEnumSize(II)I

    move-result v5

    add-int/2addr v4, v5

    .line 434
    if-nez p3, :cond_0

    const/4 v5, 0x0

    :goto_0
    add-int/2addr v4, v5

    .line 435
    const/4 v5, 0x5

    invoke-static {v5, p4}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v5

    add-int/2addr v4, v5

    .line 436
    const/4 v5, 0x6

    invoke-static {v5, p5, p6}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v5

    add-int/2addr v4, v5

    .line 437
    const/4 v5, 0x7

    invoke-static {v5, p7, p8}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v5

    add-int/2addr v4, v5

    .line 438
    const/16 v5, 0xa

    move/from16 v0, p9

    invoke-static {v5, v0}, Lcom/crashlytics/android/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v5

    add-int/2addr v4, v5

    .line 439
    if-eqz p10, :cond_1

    .line 440
    invoke-interface/range {p10 .. p10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 441
    .local v2, "id":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/crashlytics/android/SessionDataWriter;->getDeviceIdentifierSize(Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;)I

    move-result v3

    .line 442
    .local v3, "idSize":I
    const/16 v5, 0xb

    invoke-static {v5}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v5

    invoke-static {v3}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v6

    add-int/2addr v5, v6

    add-int/2addr v5, v3

    add-int/2addr v4, v5

    .line 444
    goto :goto_1

    .line 434
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "id":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    .end local v3    # "idSize":I
    :cond_0
    const/4 v5, 0x4

    invoke-static {v5, p3}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v5

    goto :goto_0

    .line 446
    :cond_1
    const/16 v5, 0xc

    move/from16 v0, p11

    invoke-static {v5, v0}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v5

    add-int/2addr v4, v5

    .line 447
    if-nez p12, :cond_2

    const/4 v5, 0x0

    :goto_2
    add-int/2addr v4, v5

    .line 448
    if-nez p13, :cond_3

    const/4 v5, 0x0

    :goto_3
    add-int/2addr v4, v5

    .line 450
    return v4

    .line 447
    :cond_2
    const/16 v5, 0xd

    move-object/from16 v0, p12

    invoke-static {v5, v0}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v5

    goto :goto_2

    .line 448
    :cond_3
    const/16 v5, 0xe

    move-object/from16 v0, p13

    invoke-static {v5, v0}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v5

    goto :goto_3
.end method

.method private getSessionEventSize(Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;JLjava/util/Map;FIZIJJLcom/crashlytics/android/ByteString;)I
    .locals 19
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "eventType"    # Ljava/lang/String;
    .param p4, "eventTime"    # J
    .param p7, "batteryLevel"    # F
    .param p8, "batterVelocity"    # I
    .param p9, "proximityEnabled"    # Z
    .param p10, "orientation"    # I
    .param p11, "heapAllocatedSize"    # J
    .param p13, "diskUsed"    # J
    .param p15, "log"    # Lcom/crashlytics/android/ByteString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Thread;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;FIZIJJ",
            "Lcom/crashlytics/android/ByteString;",
            ")I"
        }
    .end annotation

    .prologue
    .line 471
    .local p6, "custAttrs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v18, 0x0

    .line 473
    .local v18, "size":I
    const/4 v7, 0x1

    move-wide/from16 v0, p4

    invoke-static {v7, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt64Size(IJ)I

    move-result v7

    add-int v18, v18, v7

    .line 474
    const/4 v7, 0x2

    invoke-static/range {p3 .. p3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v7

    add-int v18, v18, v7

    .line 475
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p10

    move-object/from16 v4, p6

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppSize(Ljava/lang/Thread;Ljava/lang/Throwable;ILjava/util/Map;)I

    move-result v6

    .line 476
    .local v6, "eventAppSize":I
    const/4 v7, 0x3

    invoke-static {v7}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v7

    invoke-static {v6}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v7, v6

    add-int v18, v18, v7

    move-object/from16 v7, p0

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move-wide/from16 v12, p11

    move-wide/from16 v14, p13

    .line 478
    invoke-direct/range {v7 .. v15}, Lcom/crashlytics/android/SessionDataWriter;->getEventDeviceSize(FIZIJJ)I

    move-result v16

    .line 480
    .local v16, "eventDeviceSize":I
    const/4 v7, 0x5

    invoke-static {v7}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v7

    invoke-static/range {v16 .. v16}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v8

    add-int/2addr v7, v8

    add-int v7, v7, v16

    add-int v18, v18, v7

    .line 483
    if-eqz p15, :cond_0

    .line 484
    move-object/from16 v0, p0

    move-object/from16 v1, p15

    invoke-direct {v0, v1}, Lcom/crashlytics/android/SessionDataWriter;->getEventLogSize(Lcom/crashlytics/android/ByteString;)I

    move-result v17

    .line 485
    .local v17, "logSize":I
    const/4 v7, 0x6

    invoke-static {v7}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v7

    invoke-static/range {v17 .. v17}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v8

    add-int/2addr v7, v8

    add-int v7, v7, v17

    add-int v18, v18, v7

    .line 489
    .end local v17    # "logSize":I
    :cond_0
    return v18
.end method

.method private getSessionOSSize(Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;Z)I
    .locals 3
    .param p1, "release"    # Lcom/crashlytics/android/ByteString;
    .param p2, "codeName"    # Lcom/crashlytics/android/ByteString;
    .param p3, "isRooted"    # Z

    .prologue
    const/4 v2, 0x3

    .line 408
    const/4 v0, 0x0

    .line 410
    .local v0, "size":I
    const/4 v1, 0x1

    invoke-static {v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeEnumSize(II)I

    move-result v1

    add-int/2addr v0, v1

    .line 411
    const/4 v1, 0x2

    invoke-static {v1, p1}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 412
    invoke-static {v2, p2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v1

    add-int/2addr v0, v1

    .line 413
    const/4 v1, 0x4

    invoke-static {v1, p3}, Lcom/crashlytics/android/CodedOutputStream;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    .line 415
    return v0
.end method

.method private getThreadSize(Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)I
    .locals 8
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "stackTraceElements"    # [Ljava/lang/StackTraceElement;
    .param p3, "importance"    # I
    .param p4, "isCrashedThread"    # Z

    .prologue
    .line 661
    const/4 v6, 0x1

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v4

    .line 662
    .local v4, "size":I
    const/4 v6, 0x2

    invoke-static {v6, p3}, Lcom/crashlytics/android/CodedOutputStream;->computeUInt32Size(II)I

    move-result v6

    add-int/2addr v4, v6

    .line 664
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v0, v2

    .line 665
    .local v5, "stackTraceElement":Ljava/lang/StackTraceElement;
    invoke-direct {p0, v5, p4}, Lcom/crashlytics/android/SessionDataWriter;->getFrameSize(Ljava/lang/StackTraceElement;Z)I

    move-result v1

    .line 666
    .local v1, "frameSize":I
    const/4 v6, 0x3

    invoke-static {v6}, Lcom/crashlytics/android/CodedOutputStream;->computeTagSize(I)I

    move-result v6

    invoke-static {v1}, Lcom/crashlytics/android/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v7

    add-int/2addr v6, v7

    add-int/2addr v6, v1

    add-int/2addr v4, v6

    .line 664
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 670
    .end local v1    # "frameSize":I
    .end local v5    # "stackTraceElement":Ljava/lang/StackTraceElement;
    :cond_0
    return v4
.end method

.method private stringToByteString(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 674
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v0

    goto :goto_0
.end method

.method private writeFrame(Lcom/crashlytics/android/CodedOutputStream;ILjava/lang/StackTraceElement;Z)V
    .locals 6
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "fieldIndex"    # I
    .param p3, "element"    # Ljava/lang/StackTraceElement;
    .param p4, "isCrashedThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 329
    invoke-virtual {p1, p2, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 330
    invoke-direct {p0, p3, p4}, Lcom/crashlytics/android/SessionDataWriter;->getFrameSize(Ljava/lang/StackTraceElement;Z)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 332
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 335
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {p1, v4, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 340
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    invoke-virtual {p1, v5, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 343
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 344
    const/4 v2, 0x3

    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 349
    :cond_0
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->isNativeMethod()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v2

    if-lez v2, :cond_1

    .line 350
    invoke-virtual {p3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {p1, v0, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 356
    :cond_1
    const/4 v2, 0x5

    if-eqz p4, :cond_3

    :goto_1
    invoke-virtual {p1, v2, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 357
    return-void

    .line 337
    :cond_2
    const-wide/16 v2, 0x0

    invoke-virtual {p1, v4, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    goto :goto_0

    :cond_3
    move v0, v1

    .line 356
    goto :goto_1
.end method

.method private writeSessionEventApp(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;Ljava/lang/Throwable;ILjava/util/Map;)V
    .locals 3
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "thread"    # Ljava/lang/Thread;
    .param p3, "ex"    # Ljava/lang/Throwable;
    .param p4, "orientation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/crashlytics/android/CodedOutputStream;",
            "Ljava/lang/Thread;",
            "Ljava/lang/Throwable;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p5, "customAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x3

    .line 212
    const/4 v0, 0x2

    invoke-virtual {p1, v2, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 213
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppSize(Ljava/lang/Thread;Ljava/lang/Throwable;ILjava/util/Map;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 215
    invoke-direct {p0, p1, p2, p3}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventAppExecution(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 217
    if-eqz p5, :cond_0

    invoke-interface {p5}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 218
    invoke-direct {p0, p1, p5}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventAppCustomAttributes(Lcom/crashlytics/android/CodedOutputStream;Ljava/util/Map;)V

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->runningAppProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    if-eqz v0, :cond_1

    .line 224
    iget-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->runningAppProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    iget v0, v0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_2

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v2, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeBool(IZ)V

    .line 228
    :cond_1
    const/4 v0, 0x4

    invoke-virtual {p1, v0, p4}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 229
    return-void

    .line 224
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private writeSessionEventAppCustomAttributes(Lcom/crashlytics/android/CodedOutputStream;Ljava/util/Map;)V
    .locals 6
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/crashlytics/android/CodedOutputStream;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p2, "customAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x2

    .line 268
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 269
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1, v5, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 270
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppCustomAttributeSize(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 273
    const/4 v4, 0x1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v3

    invoke-virtual {p1, v4, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 274
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 275
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_0

    const-string v2, ""

    .end local v2    # "value":Ljava/lang/String;
    :cond_0
    invoke-static {v2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v3

    invoke-virtual {p1, v5, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    goto :goto_0

    .line 277
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method private writeSessionEventAppExecution(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "exceptionThread"    # Ljava/lang/Thread;
    .param p3, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 233
    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 234
    invoke-direct {p0, p2, p3}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionSize(Ljava/lang/Thread;Ljava/lang/Throwable;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 236
    iget-object v3, p0, Lcom/crashlytics/android/SessionDataWriter;->exceptionStack:[Ljava/lang/StackTraceElement;

    const/4 v4, 0x4

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/crashlytics/android/SessionDataWriter;->writeThread(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)V

    .line 240
    iget-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->threads:[Ljava/lang/Thread;

    array-length v7, v0

    .line 241
    .local v7, "len":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v7, :cond_0

    .line 242
    iget-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->threads:[Ljava/lang/Thread;

    aget-object v2, v0, v6

    .line 243
    .local v2, "thread":Ljava/lang/Thread;
    iget-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->stacks:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/StackTraceElement;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/crashlytics/android/SessionDataWriter;->writeThread(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)V

    .line 241
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 246
    .end local v2    # "thread":Ljava/lang/Thread;
    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-direct {p0, p1, p3, v0, v1}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventAppExecutionException(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Throwable;II)V

    .line 248
    const/4 v0, 0x3

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 249
    invoke-direct {p0}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionSignalSize()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 250
    const/4 v0, 0x1

    sget-object v1, Lcom/crashlytics/android/SessionDataWriter;->SIGNAL_DEFAULT_BYTE_STRING:Lcom/crashlytics/android/ByteString;

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 251
    const/4 v0, 0x2

    sget-object v1, Lcom/crashlytics/android/SessionDataWriter;->SIGNAL_DEFAULT_BYTE_STRING:Lcom/crashlytics/android/ByteString;

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 252
    const/4 v0, 0x3

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v0, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 254
    const/4 v0, 0x4

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 255
    invoke-direct {p0}, Lcom/crashlytics/android/SessionDataWriter;->getBinaryImageSize()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 256
    const/4 v0, 0x1

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v0, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 257
    const/4 v0, 0x2

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v0, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 258
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/crashlytics/android/SessionDataWriter;->packageNameBytes:Lcom/crashlytics/android/ByteString;

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 259
    iget-object v0, p0, Lcom/crashlytics/android/SessionDataWriter;->optionalBuildIdBytes:Lcom/crashlytics/android/ByteString;

    if-eqz v0, :cond_1

    .line 260
    const/4 v0, 0x4

    iget-object v1, p0, Lcom/crashlytics/android/SessionDataWriter;->optionalBuildIdBytes:Lcom/crashlytics/android/ByteString;

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 262
    :cond_1
    return-void
.end method

.method private writeSessionEventAppExecutionException(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Throwable;II)V
    .locals 10
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "chainDepth"    # I
    .param p4, "field"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 282
    const/4 v7, 0x2

    invoke-virtual {p1, p4, v7}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 283
    invoke-direct {p0, p2, v9}, Lcom/crashlytics/android/SessionDataWriter;->getEventAppExecutionExceptionSize(Ljava/lang/Throwable;I)I

    move-result v7

    invoke-virtual {p1, v7}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 285
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v7

    invoke-virtual {p1, v9, v7}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 286
    invoke-virtual {p2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    .line 287
    .local v5, "message":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 288
    const/4 v7, 0x3

    invoke-static {v5}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v8

    invoke-virtual {p1, v7, v8}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 291
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v2, v0, v3

    .line 292
    .local v2, "element":Ljava/lang/StackTraceElement;
    const/4 v7, 0x4

    invoke-direct {p0, p1, v7, v2, v9}, Lcom/crashlytics/android/SessionDataWriter;->writeFrame(Lcom/crashlytics/android/CodedOutputStream;ILjava/lang/StackTraceElement;Z)V

    .line 291
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 295
    .end local v2    # "element":Ljava/lang/StackTraceElement;
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 296
    .local v1, "cause":Ljava/lang/Throwable;
    if-eqz v1, :cond_2

    .line 297
    iget v7, p0, Lcom/crashlytics/android/SessionDataWriter;->maxChainedExceptionsDepth:I

    if-ge p3, v7, :cond_3

    .line 298
    add-int/lit8 v7, p3, 0x1

    const/4 v8, 0x6

    invoke-direct {p0, p1, v1, v7, v8}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventAppExecutionException(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Throwable;II)V

    .line 310
    :cond_2
    :goto_1
    return-void

    .line 302
    :cond_3
    const/4 v6, 0x0

    .line 303
    .local v6, "overflowCount":I
    :goto_2
    if-eqz v1, :cond_4

    .line 304
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 305
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 307
    :cond_4
    const/4 v7, 0x7

    invoke-virtual {p1, v7, v6}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    goto :goto_1
.end method

.method private writeSessionEventDevice(Lcom/crashlytics/android/CodedOutputStream;FIZIJJ)V
    .locals 12
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "batteryLevel"    # F
    .param p3, "batterVelocity"    # I
    .param p4, "proximityEnabled"    # Z
    .param p5, "orientation"    # I
    .param p6, "heapAllocatedSize"    # J
    .param p8, "diskUsed"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 363
    const/4 v2, 0x5

    const/4 v3, 0x2

    invoke-virtual {p1, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    move-object v3, p0

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    .line 364
    invoke-direct/range {v3 .. v11}, Lcom/crashlytics/android/SessionDataWriter;->getEventDeviceSize(FIZIJJ)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 366
    const/4 v2, 0x1

    invoke-virtual {p1, v2, p2}, Lcom/crashlytics/android/CodedOutputStream;->writeFloat(IF)V

    .line 367
    const/4 v2, 0x2

    invoke-virtual {p1, v2, p3}, Lcom/crashlytics/android/CodedOutputStream;->writeSInt32(II)V

    .line 368
    const/4 v2, 0x3

    move/from16 v0, p4

    invoke-virtual {p1, v2, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeBool(IZ)V

    .line 369
    const/4 v2, 0x4

    move/from16 v0, p5

    invoke-virtual {p1, v2, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 370
    const/4 v2, 0x5

    move-wide/from16 v0, p6

    invoke-virtual {p1, v2, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 371
    const/4 v2, 0x6

    move-wide/from16 v0, p8

    invoke-virtual {p1, v2, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 372
    return-void
.end method

.method private writeSessionEventLog(Lcom/crashlytics/android/CodedOutputStream;Lcom/crashlytics/android/ByteString;)V
    .locals 2
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "log"    # Lcom/crashlytics/android/ByteString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 375
    if-eqz p2, :cond_0

    .line 376
    const/4 v0, 0x6

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 377
    invoke-direct {p0, p2}, Lcom/crashlytics/android/SessionDataWriter;->getEventLogSize(Lcom/crashlytics/android/ByteString;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 378
    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 380
    :cond_0
    return-void
.end method

.method private writeThread(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)V
    .locals 8
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "thread"    # Ljava/lang/Thread;
    .param p3, "stackTraceElements"    # [Ljava/lang/StackTraceElement;
    .param p4, "importance"    # I
    .param p5, "isCrashedThread"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 316
    invoke-virtual {p1, v6, v7}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 317
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/crashlytics/android/SessionDataWriter;->getThreadSize(Ljava/lang/Thread;[Ljava/lang/StackTraceElement;IZ)I

    move-result v3

    .line 318
    .local v3, "s":I
    invoke-virtual {p1, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 319
    invoke-virtual {p2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v5

    invoke-virtual {p1, v6, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 320
    invoke-virtual {p1, v7, p4}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 322
    move-object v0, p3

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 323
    .local v4, "stackTraceElement":Ljava/lang/StackTraceElement;
    const/4 v5, 0x3

    invoke-direct {p0, p1, v5, v4, p5}, Lcom/crashlytics/android/SessionDataWriter;->writeFrame(Lcom/crashlytics/android/CodedOutputStream;ILjava/lang/StackTraceElement;Z)V

    .line 322
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 325
    .end local v4    # "stackTraceElement":Ljava/lang/StackTraceElement;
    :cond_0
    return-void
.end method


# virtual methods
.method public writeBeginSession(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "sessionId"    # Ljava/lang/String;
    .param p3, "generator"    # Ljava/lang/String;
    .param p4, "startedAtSeconds"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x1

    invoke-static {p3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 59
    const/4 v0, 0x2

    invoke-static {p2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 60
    const/4 v0, 0x3

    invoke-virtual {p1, v0, p4, p5}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 61
    return-void
.end method

.method public writeSessionApp(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "versionCode"    # Ljava/lang/String;
    .param p4, "versionName"    # Ljava/lang/String;
    .param p5, "installUuid"    # Ljava/lang/String;
    .param p6, "deliveryMechanism"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x2

    .line 66
    invoke-static {p2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v1

    .line 67
    .local v1, "packageNameBytes":Lcom/crashlytics/android/ByteString;
    invoke-static {p3}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    .line 68
    .local v2, "versionCodeBytes":Lcom/crashlytics/android/ByteString;
    invoke-static {p4}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v3

    .line 69
    .local v3, "versionNameBytes":Lcom/crashlytics/android/ByteString;
    invoke-static {p5}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v4

    .line 72
    .local v4, "installIdBytes":Lcom/crashlytics/android/ByteString;
    const/4 v0, 0x7

    invoke-virtual {p1, v0, v6}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    move-object v0, p0

    move v5, p6

    .line 73
    invoke-direct/range {v0 .. v5}, Lcom/crashlytics/android/SessionDataWriter;->getSessionAppSize(Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;I)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 75
    invoke-virtual {p1, v7, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 76
    invoke-virtual {p1, v6, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 77
    const/4 v0, 0x3

    invoke-virtual {p1, v0, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 80
    const/4 v0, 0x5

    invoke-virtual {p1, v0, v6}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 81
    invoke-direct {p0}, Lcom/crashlytics/android/SessionDataWriter;->getSessionAppOrgSize()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 82
    new-instance v0, Lio/fabric/sdk/android/services/common/ApiKey;

    invoke-direct {v0}, Lio/fabric/sdk/android/services/common/ApiKey;-><init>()V

    iget-object v5, p0, Lcom/crashlytics/android/SessionDataWriter;->context:Landroid/content/Context;

    invoke-virtual {v0, v5}, Lio/fabric/sdk/android/services/common/ApiKey;->getValue(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v7, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeString(ILjava/lang/String;)V

    .line 85
    const/4 v0, 0x6

    invoke-virtual {p1, v0, v4}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 86
    const/16 v0, 0xa

    invoke-virtual {p1, v0, p6}, Lcom/crashlytics/android/CodedOutputStream;->writeEnum(II)V

    .line 87
    return-void
.end method

.method public writeSessionDevice(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;ILjava/lang/String;IJJZLjava/util/Map;ILjava/lang/String;Ljava/lang/String;)V
    .locals 20
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "clsDeviceId"    # Ljava/lang/String;
    .param p3, "arch"    # I
    .param p4, "model"    # Ljava/lang/String;
    .param p5, "availableProcessors"    # I
    .param p6, "totalRam"    # J
    .param p8, "diskSpace"    # J
    .param p10, "isEmulator"    # Z
    .param p12, "state"    # I
    .param p13, "manufacturer"    # Ljava/lang/String;
    .param p14, "modelClass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/crashlytics/android/CodedOutputStream;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "IJJZ",
            "Ljava/util/Map",
            "<",
            "Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 107
    .local p11, "ids":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    invoke-static/range {p2 .. p2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v7

    .line 108
    .local v7, "clsDeviceIDBytes":Lcom/crashlytics/android/ByteString;
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/crashlytics/android/SessionDataWriter;->stringToByteString(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v8

    .line 109
    .local v8, "modelBytes":Lcom/crashlytics/android/ByteString;
    move-object/from16 v0, p0

    move-object/from16 v1, p14

    invoke-direct {v0, v1}, Lcom/crashlytics/android/SessionDataWriter;->stringToByteString(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v18

    .line 110
    .local v18, "modelClassBytes":Lcom/crashlytics/android/ByteString;
    move-object/from16 v0, p0

    move-object/from16 v1, p13

    invoke-direct {v0, v1}, Lcom/crashlytics/android/SessionDataWriter;->stringToByteString(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v17

    .line 112
    .local v17, "manufacturerBytes":Lcom/crashlytics/android/ByteString;
    const/16 v5, 0x9

    const/4 v6, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    move-object/from16 v5, p0

    move/from16 v6, p3

    move/from16 v9, p5

    move-wide/from16 v10, p6

    move-wide/from16 v12, p8

    move/from16 v14, p10

    move-object/from16 v15, p11

    move/from16 v16, p12

    .line 114
    invoke-direct/range {v5 .. v18}, Lcom/crashlytics/android/SessionDataWriter;->getSessionDeviceSize(ILcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;IJJZLjava/util/Map;ILcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;)I

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 118
    const/4 v5, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v7}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 120
    const/4 v5, 0x3

    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v5, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeEnum(II)V

    .line 121
    const/4 v5, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v8}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 122
    const/4 v5, 0x5

    move-object/from16 v0, p1

    move/from16 v1, p5

    invoke-virtual {v0, v5, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 123
    const/4 v5, 0x6

    move-object/from16 v0, p1

    move-wide/from16 v1, p6

    invoke-virtual {v0, v5, v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 124
    const/4 v5, 0x7

    move-object/from16 v0, p1

    move-wide/from16 v1, p8

    invoke-virtual {v0, v5, v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 125
    const/16 v5, 0xa

    move-object/from16 v0, p1

    move/from16 v1, p10

    invoke-virtual {v0, v5, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBool(IZ)V

    .line 127
    invoke-interface/range {p11 .. p11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    .line 128
    .local v19, "id":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    const/16 v5, 0xb

    const/4 v6, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 129
    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6}, Lcom/crashlytics/android/SessionDataWriter;->getDeviceIdentifierSize(Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 131
    const/4 v6, 0x1

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;

    iget v5, v5, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;->protobufIndex:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeEnum(II)V

    .line 132
    const/4 v6, 0x2

    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    goto :goto_0

    .line 134
    .end local v19    # "id":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    :cond_0
    const/16 v5, 0xc

    move-object/from16 v0, p1

    move/from16 v1, p12

    invoke-virtual {v0, v5, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt32(II)V

    .line 136
    if-eqz v17, :cond_1

    .line 137
    const/16 v5, 0xd

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v5, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 139
    :cond_1
    if-eqz v18, :cond_2

    .line 140
    const/16 v5, 0xe

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v5, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 142
    :cond_2
    return-void
.end method

.method public writeSessionEvent(Lcom/crashlytics/android/CodedOutputStream;JLjava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Thread;FIZIJJLandroid/app/ActivityManager$RunningAppProcessInfo;Ljava/util/List;[Ljava/lang/StackTraceElement;Lio/fabric/sdk/android/services/common/QueueFile;Ljava/util/Map;)V
    .locals 22
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "eventTime"    # J
    .param p4, "thread"    # Ljava/lang/Thread;
    .param p5, "ex"    # Ljava/lang/Throwable;
    .param p6, "eventType"    # Ljava/lang/String;
    .param p7, "threads"    # [Ljava/lang/Thread;
    .param p8, "batteryLevel"    # F
    .param p9, "batteryVelocity"    # I
    .param p10, "proximityEnabled"    # Z
    .param p11, "orientation"    # I
    .param p12, "usedRamBytes"    # J
    .param p14, "diskUsedBytes"    # J
    .param p16, "runningAppProcessInfo"    # Landroid/app/ActivityManager$RunningAppProcessInfo;
    .param p18, "exceptionStack"    # [Ljava/lang/StackTraceElement;
    .param p19, "logFile"    # Lio/fabric/sdk/android/services/common/QueueFile;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/crashlytics/android/CodedOutputStream;",
            "J",
            "Ljava/lang/Thread;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Thread;",
            "FIZIJJ",
            "Landroid/app/ActivityManager$RunningAppProcessInfo;",
            "Ljava/util/List",
            "<[",
            "Ljava/lang/StackTraceElement;",
            ">;[",
            "Ljava/lang/StackTraceElement;",
            "Lio/fabric/sdk/android/services/common/QueueFile;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 182
    .local p17, "stacks":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/StackTraceElement;>;"
    .local p20, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/crashlytics/android/SessionDataWriter;->runningAppProcessInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 183
    move-object/from16 v0, p17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/crashlytics/android/SessionDataWriter;->stacks:Ljava/util/List;

    .line 184
    move-object/from16 v0, p18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/crashlytics/android/SessionDataWriter;->exceptionStack:[Ljava/lang/StackTraceElement;

    .line 185
    move-object/from16 v0, p7

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/crashlytics/android/SessionDataWriter;->threads:[Ljava/lang/Thread;

    .line 187
    invoke-static/range {p19 .. p19}, Lcom/crashlytics/android/LogFileManager;->getByteStringForLog(Lio/fabric/sdk/android/services/common/QueueFile;)Lcom/crashlytics/android/ByteString;

    move-result-object v20

    .line 189
    .local v20, "logByteString":Lcom/crashlytics/android/ByteString;
    if-nez v20, :cond_0

    .line 190
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Fabric"

    const-string v6, "No log data to include with this event."

    invoke-interface {v4, v5, v6}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    :cond_0
    const-string v4, "There was a problem closing the Crashlytics log file."

    move-object/from16 v0, p19

    invoke-static {v0, v4}, Lio/fabric/sdk/android/services/common/CommonUtils;->closeOrLog(Ljava/io/Closeable;Ljava/lang/String;)V

    .line 196
    const/16 v4, 0xa

    const/4 v5, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    move-object/from16 v5, p0

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-wide/from16 v9, p2

    move-object/from16 v11, p20

    move/from16 v12, p8

    move/from16 v13, p9

    move/from16 v14, p10

    move/from16 v15, p11

    move-wide/from16 v16, p12

    move-wide/from16 v18, p14

    .line 197
    invoke-direct/range {v5 .. v20}, Lcom/crashlytics/android/SessionDataWriter;->getSessionEventSize(Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;JLjava/util/Map;FIZIJJLcom/crashlytics/android/ByteString;)I

    move-result v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 200
    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-wide/from16 v1, p2

    invoke-virtual {v0, v4, v1, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeUInt64(IJ)V

    .line 201
    const/4 v4, 0x2

    invoke-static/range {p6 .. p6}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p11

    move-object/from16 v9, p20

    .line 203
    invoke-direct/range {v4 .. v9}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventApp(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/Thread;Ljava/lang/Throwable;ILjava/util/Map;)V

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p8

    move/from16 v7, p9

    move/from16 v8, p10

    move/from16 v9, p11

    move-wide/from16 v10, p12

    move-wide/from16 v12, p14

    .line 204
    invoke-direct/range {v4 .. v13}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventDevice(Lcom/crashlytics/android/CodedOutputStream;FIZIJJ)V

    .line 206
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/crashlytics/android/SessionDataWriter;->writeSessionEventLog(Lcom/crashlytics/android/CodedOutputStream;Lcom/crashlytics/android/ByteString;)V

    .line 207
    return-void
.end method

.method public writeSessionOS(Lcom/crashlytics/android/CodedOutputStream;Z)V
    .locals 5
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "isRooted"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x2

    .line 90
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {v2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v1

    .line 91
    .local v1, "releaseBytes":Lcom/crashlytics/android/ByteString;
    sget-object v2, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    invoke-static {v2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v0

    .line 93
    .local v0, "codeNameBytes":Lcom/crashlytics/android/ByteString;
    const/16 v2, 0x8

    invoke-virtual {p1, v2, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 94
    invoke-direct {p0, v1, v0, p2}, Lcom/crashlytics/android/SessionDataWriter;->getSessionOSSize(Lcom/crashlytics/android/ByteString;Lcom/crashlytics/android/ByteString;Z)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 95
    const/4 v2, 0x1

    invoke-virtual {p1, v2, v4}, Lcom/crashlytics/android/CodedOutputStream;->writeEnum(II)V

    .line 96
    invoke-virtual {p1, v3, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 97
    invoke-virtual {p1, v4, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 98
    const/4 v2, 0x4

    invoke-virtual {p1, v2, p2}, Lcom/crashlytics/android/CodedOutputStream;->writeBool(IZ)V

    .line 99
    return-void
.end method

.method public writeSessionUser(Lcom/crashlytics/android/CodedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "email"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x2

    .line 147
    if-nez p2, :cond_0

    const-string p2, ""

    .end local p2    # "id":Ljava/lang/String;
    :cond_0
    invoke-static {p2}, Lcom/crashlytics/android/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v1

    .line 148
    .local v1, "idBytes":Lcom/crashlytics/android/ByteString;
    invoke-direct {p0, p3}, Lcom/crashlytics/android/SessionDataWriter;->stringToByteString(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v2

    .line 149
    .local v2, "nameBytes":Lcom/crashlytics/android/ByteString;
    invoke-direct {p0, p4}, Lcom/crashlytics/android/SessionDataWriter;->stringToByteString(Ljava/lang/String;)Lcom/crashlytics/android/ByteString;

    move-result-object v0

    .line 151
    .local v0, "emailBytes":Lcom/crashlytics/android/ByteString;
    const/4 v3, 0x0

    .line 152
    .local v3, "size":I
    invoke-static {v6, v1}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v4

    add-int/2addr v3, v4

    .line 153
    if-eqz p3, :cond_1

    .line 154
    invoke-static {v5, v2}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v4

    add-int/2addr v3, v4

    .line 156
    :cond_1
    if-eqz p4, :cond_2

    .line 157
    invoke-static {v7, v0}, Lcom/crashlytics/android/CodedOutputStream;->computeBytesSize(ILcom/crashlytics/android/ByteString;)I

    move-result v4

    add-int/2addr v3, v4

    .line 160
    :cond_2
    const/4 v4, 0x6

    invoke-virtual {p1, v4, v5}, Lcom/crashlytics/android/CodedOutputStream;->writeTag(II)V

    .line 161
    invoke-virtual {p1, v3}, Lcom/crashlytics/android/CodedOutputStream;->writeRawVarint32(I)V

    .line 162
    invoke-virtual {p1, v6, v1}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 163
    if-eqz p3, :cond_3

    .line 164
    invoke-virtual {p1, v5, v2}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 166
    :cond_3
    if-eqz p4, :cond_4

    .line 167
    invoke-virtual {p1, v7, v0}, Lcom/crashlytics/android/CodedOutputStream;->writeBytes(ILcom/crashlytics/android/ByteString;)V

    .line 169
    :cond_4
    return-void
.end method
