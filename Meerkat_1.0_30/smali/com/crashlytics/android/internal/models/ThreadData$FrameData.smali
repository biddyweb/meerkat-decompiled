.class public final Lcom/crashlytics/android/internal/models/ThreadData$FrameData;
.super Ljava/lang/Object;
.source "ThreadData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/crashlytics/android/internal/models/ThreadData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FrameData"
.end annotation


# instance fields
.field public final address:J

.field public final file:Ljava/lang/String;

.field public final importance:I

.field public final offset:J

.field public final symbol:Ljava/lang/String;


# direct methods
.method public constructor <init>(JI)V
    .locals 9
    .param p1, "address"    # J
    .param p3, "importance"    # I

    .prologue
    .line 46
    const-string v4, ""

    const-string v5, ""

    const-wide/16 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move v8, p3

    invoke-direct/range {v1 .. v8}, Lcom/crashlytics/android/internal/models/ThreadData$FrameData;-><init>(JLjava/lang/String;Ljava/lang/String;JI)V

    .line 47
    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;JI)V
    .locals 1
    .param p1, "address"    # J
    .param p3, "symbol"    # Ljava/lang/String;
    .param p4, "file"    # Ljava/lang/String;
    .param p5, "offset"    # J
    .param p7, "importance"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-wide p1, p0, Lcom/crashlytics/android/internal/models/ThreadData$FrameData;->address:J

    .line 51
    iput-object p3, p0, Lcom/crashlytics/android/internal/models/ThreadData$FrameData;->symbol:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lcom/crashlytics/android/internal/models/ThreadData$FrameData;->file:Ljava/lang/String;

    .line 53
    iput-wide p5, p0, Lcom/crashlytics/android/internal/models/ThreadData$FrameData;->offset:J

    .line 54
    iput p7, p0, Lcom/crashlytics/android/internal/models/ThreadData$FrameData;->importance:I

    .line 55
    return-void
.end method
