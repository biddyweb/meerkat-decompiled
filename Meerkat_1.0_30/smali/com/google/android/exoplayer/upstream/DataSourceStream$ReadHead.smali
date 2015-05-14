.class Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;
.super Ljava/lang/Object;
.source "DataSourceStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/upstream/DataSourceStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReadHead"
.end annotation


# instance fields
.field private fragmentIndex:I

.field private fragmentOffset:I

.field private fragmentRemaining:I

.field private position:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer/upstream/DataSourceStream$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$1;

    .prologue
    .line 288
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    .prologue
    .line 288
    iget v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I

    return v0
.end method

.method static synthetic access$102(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;
    .param p1, "x1"    # I

    .prologue
    .line 288
    iput p1, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I

    return p1
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    .prologue
    .line 288
    iget v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I

    return v0
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;
    .param p1, "x1"    # I

    .prologue
    .line 288
    iput p1, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I

    return p1
.end method

.method static synthetic access$208(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I
    .locals 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    .prologue
    .line 288
    iget v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I

    return v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    .prologue
    .line 288
    iget v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I

    return v0
.end method

.method static synthetic access$302(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;
    .param p1, "x1"    # I

    .prologue
    .line 288
    iput p1, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I

    return p1
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;

    .prologue
    .line 288
    iget v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I

    return v0
.end method

.method static synthetic access$402(Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;
    .param p1, "x1"    # I

    .prologue
    .line 288
    iput p1, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I

    return p1
.end method


# virtual methods
.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 296
    iput v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->position:I

    .line 297
    iput v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentIndex:I

    .line 298
    iput v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentOffset:I

    .line 299
    iput v0, p0, Lcom/google/android/exoplayer/upstream/DataSourceStream$ReadHead;->fragmentRemaining:I

    .line 300
    return-void
.end method
