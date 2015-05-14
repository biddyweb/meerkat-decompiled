.class public Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;
.super Ljava/io/IOException;
.source "HttpDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/upstream/HttpDataSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HttpDataSourceException"
.end annotation


# instance fields
.field public final dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .locals 0
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .locals 0
    .param p1, "cause"    # Ljava/io/IOException;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 78
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 72
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 73
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/io/IOException;
    .param p3, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    iput-object p3, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 84
    return-void
.end method
