.class Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;
.super Ljava/io/FilterOutputStream;
.source "SimpleDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CacheOutputStream"
.end annotation


# instance fields
.field private final editor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

.field private failed:Z

.field final synthetic this$0:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;


# direct methods
.method private constructor <init>(Lvijay/expirabledisklrucache/cache/SimpleDiskCache;Ljava/io/OutputStream;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)V
    .locals 1
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "editor"    # Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    .prologue
    .line 215
    iput-object p1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->this$0:Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    .line 216
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 213
    const/4 v0, 0x0

    iput-boolean v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->failed:Z

    .line 217
    iput-object p3, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->editor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    .line 218
    return-void
.end method

.method synthetic constructor <init>(Lvijay/expirabledisklrucache/cache/SimpleDiskCache;Ljava/io/OutputStream;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;Lvijay/expirabledisklrucache/cache/SimpleDiskCache$1;)V
    .locals 0
    .param p1, "x0"    # Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
    .param p2, "x1"    # Ljava/io/OutputStream;
    .param p3, "x2"    # Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .param p4, "x3"    # Lvijay/expirabledisklrucache/cache/SimpleDiskCache$1;

    .prologue
    .line 210
    invoke-direct {p0, p1, p2, p3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;-><init>(Lvijay/expirabledisklrucache/cache/SimpleDiskCache;Ljava/io/OutputStream;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    const/4 v0, 0x0

    .line 224
    .local v0, "closeException":Ljava/io/IOException;
    :try_start_0
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    :goto_0
    iget-boolean v2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->failed:Z

    if-eqz v2, :cond_0

    .line 230
    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->editor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    invoke-virtual {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->abort()V

    .line 235
    :goto_1
    if-eqz v0, :cond_1

    .line 236
    throw v0

    .line 225
    :catch_0
    move-exception v1

    .line 226
    .local v1, "e":Ljava/io/IOException;
    move-object v0, v1

    goto :goto_0

    .line 232
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->editor:Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    invoke-virtual {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->commit()V

    goto :goto_1

    .line 237
    :cond_1
    return-void
.end method

.method public flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    :try_start_0
    invoke-super {p0}, Ljava/io/FilterOutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    return-void

    .line 243
    :catch_0
    move-exception v0

    .line 244
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->failed:Z

    .line 245
    throw v0
.end method

.method public write(I)V
    .locals 2
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    :try_start_0
    invoke-super {p0, p1}, Ljava/io/FilterOutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    return-void

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->failed:Z

    .line 255
    throw v0
.end method

.method public write([B)V
    .locals 2
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 262
    :try_start_0
    invoke-super {p0, p1}, Ljava/io/FilterOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    return-void

    .line 263
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->failed:Z

    .line 265
    throw v0
.end method

.method public write([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    return-void

    .line 273
    :catch_0
    move-exception v0

    .line 274
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;->failed:Z

    .line 275
    throw v0
.end method
