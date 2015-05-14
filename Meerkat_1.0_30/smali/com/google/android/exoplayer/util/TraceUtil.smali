.class public Lcom/google/android/exoplayer/util/TraceUtil;
.super Ljava/lang/Object;
.source "TraceUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beginSection(Ljava/lang/String;)V
    .locals 2
    .param p0, "sectionName"    # Ljava/lang/String;

    .prologue
    .line 33
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    .line 34
    invoke-static {p0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSectionV18(Ljava/lang/String;)V

    .line 36
    :cond_0
    return-void
.end method

.method private static beginSectionV18(Ljava/lang/String;)V
    .locals 0
    .param p0, "sectionName"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 51
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public static endSection()V
    .locals 2

    .prologue
    .line 44
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    .line 45
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSectionV18()V

    .line 47
    :cond_0
    return-void
.end method

.method private static endSectionV18()V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .prologue
    .line 56
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 57
    return-void
.end method
