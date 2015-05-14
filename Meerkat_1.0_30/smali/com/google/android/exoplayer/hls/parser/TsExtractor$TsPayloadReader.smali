.class abstract Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
.super Ljava/lang/Object;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/hls/parser/TsExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "TsPayloadReader"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/android/exoplayer/hls/parser/TsExtractor$1;

    .prologue
    .line 254
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract consume(Lcom/google/android/exoplayer/util/ParsableByteArray;Z)V
.end method
