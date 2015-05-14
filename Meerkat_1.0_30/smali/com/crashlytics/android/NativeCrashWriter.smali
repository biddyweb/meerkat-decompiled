.class Lcom/crashlytics/android/NativeCrashWriter;
.super Ljava/lang/Object;
.source "NativeCrashWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$SignalMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$ExecutionMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$ApplicationMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$DeviceMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$EventMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;,
        Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;
    }
.end annotation


# static fields
.field private static final DEFAULT_SIGNAL:Lcom/crashlytics/android/internal/models/SignalData;

.field private static final EMPTY_BINARY_IMAGE_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;

.field private static final EMPTY_CHILDREN:[Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;

.field private static final EMPTY_CUSTOM_ATTRIBUTE_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;

.field private static final EMPTY_FRAME_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;

.field private static final EMPTY_THREAD_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;

.field static final NDK_CRASH_TYPE:Ljava/lang/String; = "ndk-crash"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 22
    new-instance v0, Lcom/crashlytics/android/internal/models/SignalData;

    const-string v1, ""

    const-string v2, ""

    const-wide/16 v4, 0x0

    invoke-direct {v0, v1, v2, v4, v5}, Lcom/crashlytics/android/internal/models/SignalData;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/crashlytics/android/NativeCrashWriter;->DEFAULT_SIGNAL:Lcom/crashlytics/android/internal/models/SignalData;

    .line 24
    new-array v0, v3, [Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;

    sput-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_CHILDREN:[Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;

    .line 25
    new-array v0, v3, [Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;

    sput-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_THREAD_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;

    .line 26
    new-array v0, v3, [Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;

    sput-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_FRAME_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;

    .line 27
    new-array v0, v3, [Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;

    sput-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_BINARY_IMAGE_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;

    .line 29
    new-array v0, v3, [Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;

    sput-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_CUSTOM_ATTRIBUTE_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 382
    return-void
.end method

.method static synthetic access$000()[Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_CHILDREN:[Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;

    return-object v0
.end method

.method private static createBinaryImagesMessage([Lcom/crashlytics/android/internal/models/BinaryImageData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    .locals 4
    .param p0, "binaryImages"    # [Lcom/crashlytics/android/internal/models/BinaryImageData;

    .prologue
    .line 460
    if-eqz p0, :cond_0

    array-length v2, p0

    new-array v0, v2, [Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;

    .line 462
    .local v0, "binaryImageMessages":[Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 463
    new-instance v2, Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;-><init>(Lcom/crashlytics/android/internal/models/BinaryImageData;)V

    aput-object v2, v0, v1

    .line 462
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 460
    .end local v0    # "binaryImageMessages":[Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;
    .end local v1    # "i":I
    :cond_0
    sget-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_BINARY_IMAGE_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;

    goto :goto_0

    .line 465
    .restart local v0    # "binaryImageMessages":[Lcom/crashlytics/android/NativeCrashWriter$BinaryImageMessage;
    .restart local v1    # "i":I
    :cond_1
    new-instance v2, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    invoke-direct {v2, v0}, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;-><init>([Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;)V

    return-object v2
.end method

.method private static createCustomAttributesMessage([Lcom/crashlytics/android/internal/models/CustomAttributeData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    .locals 4
    .param p0, "customAttributes"    # [Lcom/crashlytics/android/internal/models/CustomAttributeData;

    .prologue
    .line 470
    if-eqz p0, :cond_0

    array-length v2, p0

    new-array v0, v2, [Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;

    .line 473
    .local v0, "customAttributeMessages":[Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 474
    new-instance v2, Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;-><init>(Lcom/crashlytics/android/internal/models/CustomAttributeData;)V

    aput-object v2, v0, v1

    .line 473
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 470
    .end local v0    # "customAttributeMessages":[Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;
    .end local v1    # "i":I
    :cond_0
    sget-object v0, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_CUSTOM_ATTRIBUTE_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;

    goto :goto_0

    .line 476
    .restart local v0    # "customAttributeMessages":[Lcom/crashlytics/android/NativeCrashWriter$CustomAttributeMessage;
    .restart local v1    # "i":I
    :cond_1
    new-instance v2, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    invoke-direct {v2, v0}, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;-><init>([Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;)V

    return-object v2
.end method

.method private static createFramesMessage([Lcom/crashlytics/android/internal/models/ThreadData$FrameData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    .locals 4
    .param p0, "frames"    # [Lcom/crashlytics/android/internal/models/ThreadData$FrameData;

    .prologue
    .line 451
    if-eqz p0, :cond_0

    array-length v2, p0

    new-array v1, v2, [Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;

    .line 453
    .local v1, "frameMessages":[Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;
    :goto_0
    const/4 v0, 0x0

    .local v0, "frameIdx":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 454
    new-instance v2, Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;

    aget-object v3, p0, v0

    invoke-direct {v2, v3}, Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;-><init>(Lcom/crashlytics/android/internal/models/ThreadData$FrameData;)V

    aput-object v2, v1, v0

    .line 453
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 451
    .end local v0    # "frameIdx":I
    .end local v1    # "frameMessages":[Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;
    :cond_0
    sget-object v1, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_FRAME_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;

    goto :goto_0

    .line 456
    .restart local v0    # "frameIdx":I
    .restart local v1    # "frameMessages":[Lcom/crashlytics/android/NativeCrashWriter$FrameMessage;
    :cond_1
    new-instance v2, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    invoke-direct {v2, v1}, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;-><init>([Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;)V

    return-object v2
.end method

.method private static createThreadsMessage([Lcom/crashlytics/android/internal/models/ThreadData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    .locals 5
    .param p0, "threads"    # [Lcom/crashlytics/android/internal/models/ThreadData;

    .prologue
    .line 440
    if-eqz p0, :cond_0

    array-length v3, p0

    new-array v2, v3, [Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;

    .line 442
    .local v2, "threadMessages":[Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;
    :goto_0
    const/4 v1, 0x0

    .local v1, "threadIdx":I
    :goto_1
    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 443
    aget-object v0, p0, v1

    .line 444
    .local v0, "threadData":Lcom/crashlytics/android/internal/models/ThreadData;
    new-instance v3, Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;

    iget-object v4, v0, Lcom/crashlytics/android/internal/models/ThreadData;->frames:[Lcom/crashlytics/android/internal/models/ThreadData$FrameData;

    invoke-static {v4}, Lcom/crashlytics/android/NativeCrashWriter;->createFramesMessage([Lcom/crashlytics/android/internal/models/ThreadData$FrameData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;-><init>(Lcom/crashlytics/android/internal/models/ThreadData;Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;)V

    aput-object v3, v2, v1

    .line 442
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 440
    .end local v0    # "threadData":Lcom/crashlytics/android/internal/models/ThreadData;
    .end local v1    # "threadIdx":I
    .end local v2    # "threadMessages":[Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;
    :cond_0
    sget-object v2, Lcom/crashlytics/android/NativeCrashWriter;->EMPTY_THREAD_MESSAGES:[Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;

    goto :goto_0

    .line 447
    .restart local v1    # "threadIdx":I
    .restart local v2    # "threadMessages":[Lcom/crashlytics/android/NativeCrashWriter$ThreadMessage;
    :cond_1
    new-instance v3, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    invoke-direct {v3, v2}, Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;-><init>([Lcom/crashlytics/android/NativeCrashWriter$ProtobufMessage;)V

    return-object v3
.end method

.method private static readCrashEventData(Lcom/crashlytics/android/internal/models/SessionEventData;)Lcom/crashlytics/android/NativeCrashWriter$EventMessage;
    .locals 12
    .param p0, "crashEvent"    # Lcom/crashlytics/android/internal/models/SessionEventData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 418
    iget-object v1, p0, Lcom/crashlytics/android/internal/models/SessionEventData;->signal:Lcom/crashlytics/android/internal/models/SignalData;

    if-eqz v1, :cond_0

    iget-object v9, p0, Lcom/crashlytics/android/internal/models/SessionEventData;->signal:Lcom/crashlytics/android/internal/models/SignalData;

    .line 420
    .local v9, "signal":Lcom/crashlytics/android/internal/models/SignalData;
    :goto_0
    new-instance v10, Lcom/crashlytics/android/NativeCrashWriter$SignalMessage;

    invoke-direct {v10, v9}, Lcom/crashlytics/android/NativeCrashWriter$SignalMessage;-><init>(Lcom/crashlytics/android/internal/models/SignalData;)V

    .line 422
    .local v10, "signalMessage":Lcom/crashlytics/android/NativeCrashWriter$SignalMessage;
    iget-object v1, p0, Lcom/crashlytics/android/internal/models/SessionEventData;->threads:[Lcom/crashlytics/android/internal/models/ThreadData;

    invoke-static {v1}, Lcom/crashlytics/android/NativeCrashWriter;->createThreadsMessage([Lcom/crashlytics/android/internal/models/ThreadData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    move-result-object v11

    .line 423
    .local v11, "threadsMessage":Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    iget-object v1, p0, Lcom/crashlytics/android/internal/models/SessionEventData;->binaryImages:[Lcom/crashlytics/android/internal/models/BinaryImageData;

    invoke-static {v1}, Lcom/crashlytics/android/NativeCrashWriter;->createBinaryImagesMessage([Lcom/crashlytics/android/internal/models/BinaryImageData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    move-result-object v0

    .line 426
    .local v0, "binaryImagesMessage":Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    new-instance v8, Lcom/crashlytics/android/NativeCrashWriter$ExecutionMessage;

    invoke-direct {v8, v10, v11, v0}, Lcom/crashlytics/android/NativeCrashWriter$ExecutionMessage;-><init>(Lcom/crashlytics/android/NativeCrashWriter$SignalMessage;Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;)V

    .line 428
    .local v8, "executionMessage":Lcom/crashlytics/android/NativeCrashWriter$ExecutionMessage;
    iget-object v1, p0, Lcom/crashlytics/android/internal/models/SessionEventData;->customAttributes:[Lcom/crashlytics/android/internal/models/CustomAttributeData;

    invoke-static {v1}, Lcom/crashlytics/android/NativeCrashWriter;->createCustomAttributesMessage([Lcom/crashlytics/android/internal/models/CustomAttributeData;)Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;

    move-result-object v7

    .line 431
    .local v7, "customAttributesMessage":Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    new-instance v5, Lcom/crashlytics/android/NativeCrashWriter$ApplicationMessage;

    invoke-direct {v5, v8, v7}, Lcom/crashlytics/android/NativeCrashWriter$ApplicationMessage;-><init>(Lcom/crashlytics/android/NativeCrashWriter$ExecutionMessage;Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;)V

    .line 433
    .local v5, "applicationMessage":Lcom/crashlytics/android/NativeCrashWriter$ApplicationMessage;
    new-instance v6, Lcom/crashlytics/android/NativeCrashWriter$DeviceMessage;

    invoke-direct {v6}, Lcom/crashlytics/android/NativeCrashWriter$DeviceMessage;-><init>()V

    .line 435
    .local v6, "deviceMessage":Lcom/crashlytics/android/NativeCrashWriter$DeviceMessage;
    new-instance v1, Lcom/crashlytics/android/NativeCrashWriter$EventMessage;

    iget-wide v2, p0, Lcom/crashlytics/android/internal/models/SessionEventData;->timestamp:J

    const-string v4, "ndk-crash"

    invoke-direct/range {v1 .. v6}, Lcom/crashlytics/android/NativeCrashWriter$EventMessage;-><init>(JLjava/lang/String;Lcom/crashlytics/android/NativeCrashWriter$ApplicationMessage;Lcom/crashlytics/android/NativeCrashWriter$DeviceMessage;)V

    return-object v1

    .line 418
    .end local v0    # "binaryImagesMessage":Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    .end local v5    # "applicationMessage":Lcom/crashlytics/android/NativeCrashWriter$ApplicationMessage;
    .end local v6    # "deviceMessage":Lcom/crashlytics/android/NativeCrashWriter$DeviceMessage;
    .end local v7    # "customAttributesMessage":Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    .end local v8    # "executionMessage":Lcom/crashlytics/android/NativeCrashWriter$ExecutionMessage;
    .end local v9    # "signal":Lcom/crashlytics/android/internal/models/SignalData;
    .end local v10    # "signalMessage":Lcom/crashlytics/android/NativeCrashWriter$SignalMessage;
    .end local v11    # "threadsMessage":Lcom/crashlytics/android/NativeCrashWriter$RepeatedMessage;
    :cond_0
    sget-object v9, Lcom/crashlytics/android/NativeCrashWriter;->DEFAULT_SIGNAL:Lcom/crashlytics/android/internal/models/SignalData;

    goto :goto_0
.end method

.method public static writeNativeCrash(Lcom/crashlytics/android/internal/models/SessionEventData;Lcom/crashlytics/android/CodedOutputStream;)V
    .locals 1
    .param p0, "crashEventData"    # Lcom/crashlytics/android/internal/models/SessionEventData;
    .param p1, "cos"    # Lcom/crashlytics/android/CodedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 488
    invoke-static {p0}, Lcom/crashlytics/android/NativeCrashWriter;->readCrashEventData(Lcom/crashlytics/android/internal/models/SessionEventData;)Lcom/crashlytics/android/NativeCrashWriter$EventMessage;

    move-result-object v0

    .line 489
    .local v0, "crashEventMessage":Lcom/crashlytics/android/NativeCrashWriter$EventMessage;
    invoke-virtual {v0, p1}, Lcom/crashlytics/android/NativeCrashWriter$EventMessage;->write(Lcom/crashlytics/android/CodedOutputStream;)V

    .line 490
    return-void
.end method
