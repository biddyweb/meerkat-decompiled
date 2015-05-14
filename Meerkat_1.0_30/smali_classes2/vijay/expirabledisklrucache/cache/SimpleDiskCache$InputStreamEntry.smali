.class public Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;
.super Ljava/lang/Object;
.source "SimpleDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputStreamEntry"
.end annotation


# instance fields
.field private final metadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;"
        }
    .end annotation
.end field

.field private final snapshot:Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;


# direct methods
.method public constructor <init>(Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;Ljava/util/Map;)V
    .locals 0
    .param p1, "snapshot"    # Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 284
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 285
    iput-object p2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;->metadata:Ljava/util/Map;

    .line 286
    iput-object p1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;->snapshot:Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    .line 287
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;->snapshot:Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    invoke-virtual {v0}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->close()V

    .line 300
    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2

    .prologue
    .line 290
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;->snapshot:Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/jakewharton/disklrucache/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getMetadata()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 294
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$InputStreamEntry;->metadata:Ljava/util/Map;

    return-object v0
.end method
