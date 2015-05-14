.class Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
.super Ljava/lang/Object;
.source "SimpleDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lvijay/expirabledisklrucache/cache/SimpleDiskCache$1;,
        Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;,
        Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;,
        Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;,
        Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "SIMPLE_DISK_CACHE"

.field private static final METADATA_IDX:I = 0x1

.field private static final VALUE_IDX:I

.field private static final sUsedDirs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAppVersion:I

.field private mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->sUsedDirs:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Ljava/io/File;IJ)V
    .locals 1
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "appVersion"    # I
    .param p3, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mAppVersion:I

    .line 45
    const/4 v0, 0x2

    invoke-static {p1, p2, v0, p3, p4}, Lcom/jakewharton/disklrucache/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/jakewharton/disklrucache/DiskLruCache;

    move-result-object v0

    iput-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    .line 46
    return-void
.end method

.method private md5(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 198
    :try_start_0
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 199
    .local v3, "m":Ljava/security/MessageDigest;
    const-string v4, "UTF-8"

    invoke-virtual {p1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 200
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 201
    .local v1, "digest":[B
    new-instance v0, Ljava/math/BigInteger;

    const/4 v4, 0x1

    invoke-direct {v0, v4, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 202
    .local v0, "bigInt":Ljava/math/BigInteger;
    const/16 v4, 0x10

    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    return-object v4

    .line 203
    .end local v0    # "bigInt":Ljava/math/BigInteger;
    .end local v1    # "digest":[B
    .end local v3    # "m":Ljava/security/MessageDigest;
    :catch_0
    move-exception v2

    .line 204
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 205
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v2

    .line 206
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
.end method

.method public static declared-synchronized open(Ljava/io/File;IJ)Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
    .locals 4
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "appVersion"    # I
    .param p2, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    const-class v1, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->sUsedDirs:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cache dir "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was used before."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 53
    :cond_0
    :try_start_1
    sget-object v0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->sUsedDirs:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    new-instance v0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;

    invoke-direct {v0, p0, p1, p2, p3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;-><init>(Ljava/io/File;IJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method private readMetadata(Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;)Ljava/util/Map;
    .locals 7
    .param p1, "snapshot"    # Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 179
    const/4 v2, 0x0

    .line 181
    .local v2, "ois":Ljava/io/ObjectInputStream;
    :try_start_0
    new-instance v3, Ljava/io/ObjectInputStream;

    new-instance v4, Ljava/io/BufferedInputStream;

    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .local v3, "ois":Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 188
    .local v0, "annotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    invoke-static {v3, v6}, Lvijay/expirabledisklrucache/cache/utils/Closeables;->close(Ljava/io/Closeable;Z)V

    return-object v0

    .line 185
    .end local v0    # "annotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v1

    .line 186
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    :goto_0
    :try_start_2
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 188
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v4

    :goto_1
    invoke-static {v2, v6}, Lvijay/expirabledisklrucache/cache/utils/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v4

    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "ois":Ljava/io/ObjectInputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_1

    .line 185
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "ois":Ljava/io/ObjectInputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "ois":Ljava/io/ObjectInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_0
.end method

.method private toInternalKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 193
    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private writeMetadata(Ljava/util/Map;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)V
    .locals 5
    .param p2, "editor"    # Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
            "Ljava/io/Serializable;",
            ">;",
            "Lcom/jakewharton/disklrucache/DiskLruCache$Editor;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p1, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/io/Serializable;>;"
    const/4 v4, 0x1

    .line 169
    const/4 v0, 0x0

    .line 171
    .local v0, "oos":Ljava/io/ObjectOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/ObjectOutputStream;

    new-instance v2, Ljava/io/BufferedOutputStream;

    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v1, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    .end local v0    # "oos":Ljava/io/ObjectOutputStream;
    .local v1, "oos":Ljava/io/ObjectOutputStream;
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 174
    invoke-static {v1, v4}, Lvijay/expirabledisklrucache/cache/utils/Closeables;->close(Ljava/io/Closeable;Z)V

    .line 176
    return-void

    .line 174
    .end local v1    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v0    # "oos":Ljava/io/ObjectOutputStream;
    :catchall_0
    move-exception v2

    :goto_0
    invoke-static {v0, v4}, Lvijay/expirabledisklrucache/cache/utils/Closeables;->close(Ljava/io/Closeable;Z)V

    throw v2

    .end local v0    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v1    # "oos":Ljava/io/ObjectOutputStream;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v0    # "oos":Ljava/io/ObjectOutputStream;
    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-virtual {v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v0

    .line 65
    .local v0, "dir":Ljava/io/File;
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-virtual {v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->getMaxSize()J

    move-result-wide v2

    .line 66
    .local v2, "maxSize":J
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-virtual {v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->delete()V

    .line 67
    iget v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mAppVersion:I

    const/4 v4, 0x2

    invoke-static {v0, v1, v4, v2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/jakewharton/disklrucache/DiskLruCache;

    move-result-object v1

    iput-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    .line 68
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->toInternalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jakewharton/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    move-result-object v0

    .line 108
    .local v0, "snapshot":Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    if-nez v0, :cond_0

    .line 109
    const/4 v1, 0x0

    .line 112
    :goto_0
    return v1

    .line 111
    :cond_0
    invoke-virtual {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->close()V

    .line 112
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getBitmap(Ljava/lang/String;)Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->toInternalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    move-result-object v1

    .line 83
    .local v1, "snapshot":Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    if-nez v1, :cond_0

    .line 84
    const/4 v2, 0x0

    .line 90
    :goto_0
    return-object v2

    .line 87
    :cond_0
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {v1, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 88
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;

    invoke-direct {p0, v1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->readMetadata(Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;-><init>(Landroid/graphics/Bitmap;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    invoke-virtual {v1}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->close()V

    goto :goto_0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->close()V

    throw v2
.end method

.method public getCache()Lcom/jakewharton/disklrucache/DiskLruCache;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    return-object v0
.end method

.method public getInputStream(Ljava/lang/String;)Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->toInternalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jakewharton/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    move-result-object v0

    .line 76
    .local v0, "snapshot":Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    if-nez v0, :cond_0

    .line 77
    const/4 v1, 0x0

    .line 78
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;

    invoke-direct {p0, v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->readMetadata(Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;)Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;-><init>(Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;Ljava/util/Map;)V

    goto :goto_0
.end method

.method public getString(Ljava/lang/String;)Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->toInternalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jakewharton/disklrucache/DiskLruCache;->get(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    move-result-object v0

    .line 96
    .local v0, "snapshot":Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    if-nez v0, :cond_0

    .line 97
    const/4 v1, 0x0

    .line 102
    :goto_0
    return-object v1

    .line 100
    :cond_0
    :try_start_0
    new-instance v1, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->readMetadata(Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;-><init>(Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    invoke-virtual {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->close()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->close()V

    throw v1
.end method

.method public openStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->openStream(Ljava/lang/String;Ljava/util/Map;)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public openStream(Ljava/lang/String;Ljava/util/Map;)Ljava/io/OutputStream;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
            "Ljava/io/Serializable;",
            ">;)",
            "Ljava/io/OutputStream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/io/Serializable;>;"
    iget-object v3, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->toInternalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/jakewharton/disklrucache/DiskLruCache;->edit(Ljava/lang/String;)Lcom/jakewharton/disklrucache/DiskLruCache$Editor;

    move-result-object v2

    .line 122
    .local v2, "editor":Lcom/jakewharton/disklrucache/DiskLruCache$Editor;
    :try_start_0
    invoke-direct {p0, p2, v2}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->writeMetadata(Ljava/util/Map;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;)V

    .line 123
    new-instance v0, Ljava/io/BufferedOutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 124
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    new-instance v3, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v0, v2, v4}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$CacheOutputStream;-><init>(Lvijay/expirabledisklrucache/cache/SimpleDiskCache;Ljava/io/OutputStream;Lcom/jakewharton/disklrucache/DiskLruCache$Editor;Lvijay/expirabledisklrucache/cache/SimpleDiskCache$1;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 125
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    :catch_0
    move-exception v1

    .line 126
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Lcom/jakewharton/disklrucache/DiskLruCache$Editor;->abort()V

    .line 127
    throw v1
.end method

.method public put(Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->put(Ljava/lang/String;Ljava/io/InputStream;Ljava/util/Map;)V

    .line 133
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/io/InputStream;Ljava/util/Map;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/InputStream;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    .local p3, "annotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    const/4 v0, 0x0

    .line 138
    .local v0, "os":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p0, p1, p3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->openStream(Ljava/lang/String;Ljava/util/Map;)Ljava/io/OutputStream;

    move-result-object v0

    .line 140
    invoke-static {p2, v0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 145
    :cond_0
    return-void

    .line 142
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 143
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_1
    throw v1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->put(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 149
    return-void
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "+",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    .local p3, "annotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;+Ljava/io/Serializable;>;"
    const/4 v0, 0x0

    .line 154
    .local v0, "cos":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p0, p1, p3}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->openStream(Ljava/lang/String;Ljava/util/Map;)Ljava/io/OutputStream;

    move-result-object v0

    .line 155
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    if-eqz v0, :cond_0

    .line 158
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 161
    :cond_0
    return-void

    .line 157
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 158
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_1
    throw v1
.end method

.method public remove(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->mDiskLruCache:Lcom/jakewharton/disklrucache/DiskLruCache;

    invoke-direct {p0, p1}, Lvijay/expirabledisklrucache/cache/SimpleDiskCache;->toInternalKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/jakewharton/disklrucache/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 165
    return-void
.end method
