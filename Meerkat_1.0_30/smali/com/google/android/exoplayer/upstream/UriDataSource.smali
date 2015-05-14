.class public final Lcom/google/android/exoplayer/upstream/UriDataSource;
.super Ljava/lang/Object;
.source "UriDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSource;


# static fields
.field private static final FILE_URI_SCHEME:Ljava/lang/String; = "file"


# instance fields
.field private dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final fileDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final httpDataSource:Lcom/google/android/exoplayer/upstream/DataSource;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSource;)V
    .locals 1
    .param p1, "fileDataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "httpDataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->fileDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 59
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->httpDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/TransferListener;)V
    .locals 3
    .param p1, "userAgent"    # Ljava/lang/String;
    .param p2, "transferListener"    # Lcom/google/android/exoplayer/upstream/TransferListener;

    .prologue
    .line 46
    new-instance v0, Lcom/google/android/exoplayer/upstream/FileDataSource;

    invoke-direct {v0, p2}, Lcom/google/android/exoplayer/upstream/FileDataSource;-><init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V

    new-instance v1, Lcom/google/android/exoplayer/upstream/HttpDataSource;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2, p2}, Lcom/google/android/exoplayer/upstream/HttpDataSource;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/util/Predicate;Lcom/google/android/exoplayer/upstream/TransferListener;)V

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/upstream/UriDataSource;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSource;)V

    .line 48
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 80
    :cond_0
    return-void
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .locals 2
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 65
    const-string v0, "file"

    iget-object v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->fileDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    :goto_1
    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 66
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0, p1}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    move-result-wide v0

    return-wide v0

    .line 64
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->httpDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    goto :goto_1
.end method

.method public read([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UriDataSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v0

    return v0
.end method
