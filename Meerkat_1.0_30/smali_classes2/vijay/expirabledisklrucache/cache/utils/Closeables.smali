.class public final Lvijay/expirabledisklrucache/cache/utils/Closeables;
.super Ljava/lang/Object;
.source "Closeables.java"


# static fields
.field static final logger:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lvijay/expirabledisklrucache/cache/utils/Closeables;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lvijay/expirabledisklrucache/cache/utils/Closeables;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static close(Ljava/io/Closeable;Z)V
    .locals 4
    .param p0, "closeable"    # Ljava/io/Closeable;
    .param p1, "swallowIOException"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    if-nez p0, :cond_0

    .line 90
    :goto_0
    return-void

    .line 82
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/io/IOException;
    if-eqz p1, :cond_1

    .line 85
    sget-object v1, Lvijay/expirabledisklrucache/cache/utils/Closeables;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "IOException thrown while closing Closeable."

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 87
    :cond_1
    throw v0
.end method

.method public static closeQuietly(Ljava/io/InputStream;)V
    .locals 2
    .param p0, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 111
    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0, v1}, Lvijay/expirabledisklrucache/cache/utils/Closeables;->close(Ljava/io/Closeable;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static closeQuietly(Ljava/io/Reader;)V
    .locals 2
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 136
    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0, v1}, Lvijay/expirabledisklrucache/cache/utils/Closeables;->close(Ljava/io/Closeable;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    return-void

    .line 137
    :catch_0
    move-exception v0

    .line 138
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
