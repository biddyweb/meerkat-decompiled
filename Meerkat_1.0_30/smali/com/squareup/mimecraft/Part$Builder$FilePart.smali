.class final Lcom/squareup/mimecraft/Part$Builder$FilePart;
.super Lcom/squareup/mimecraft/Part$Builder$PartImpl;
.source "Part.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/mimecraft/Part$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FilePart"
.end annotation


# instance fields
.field private final buffer:[B

.field private final file:Ljava/io/File;


# direct methods
.method private constructor <init>(Ljava/util/Map;Ljava/io/File;)V
    .locals 1
    .param p2, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .prologue
    .line 240
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/squareup/mimecraft/Part$Builder$PartImpl;-><init>(Ljava/util/Map;)V

    .line 237
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/squareup/mimecraft/Part$Builder$FilePart;->buffer:[B

    .line 241
    iput-object p2, p0, Lcom/squareup/mimecraft/Part$Builder$FilePart;->file:Ljava/io/File;

    .line 242
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Map;Ljava/io/File;Lcom/squareup/mimecraft/Part$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/util/Map;
    .param p2, "x1"    # Ljava/io/File;
    .param p3, "x2"    # Lcom/squareup/mimecraft/Part$1;

    .prologue
    .line 235
    invoke-direct {p0, p1, p2}, Lcom/squareup/mimecraft/Part$Builder$FilePart;-><init>(Ljava/util/Map;Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public writeBodyTo(Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    const/4 v0, 0x0

    .line 247
    .local v0, "in":Ljava/io/InputStream;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder$FilePart;->file:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    .end local v0    # "in":Ljava/io/InputStream;
    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder$FilePart;->buffer:[B

    invoke-static {v1, p1, v2}, Lcom/squareup/mimecraft/Utils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 250
    if-eqz v1, :cond_0

    .line 252
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 257
    :cond_0
    :goto_0
    return-void

    .line 250
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    :goto_1
    if-eqz v0, :cond_1

    .line 252
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 254
    :cond_1
    :goto_2
    throw v2

    .line 253
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :catch_0
    move-exception v2

    goto :goto_0

    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "in":Ljava/io/InputStream;
    :catch_1
    move-exception v3

    goto :goto_2

    .line 250
    .end local v0    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "in":Ljava/io/InputStream;
    goto :goto_1
.end method
