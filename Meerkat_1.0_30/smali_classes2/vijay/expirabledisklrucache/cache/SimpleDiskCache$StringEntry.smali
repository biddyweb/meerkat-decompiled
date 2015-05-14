.class public Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;
.super Ljava/lang/Object;
.source "SimpleDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StringEntry"
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

.field private final string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 326
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
    iput-object p1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;->string:Ljava/lang/String;

    .line 328
    iput-object p2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;->metadata:Ljava/util/Map;

    .line 329
    return-void
.end method


# virtual methods
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
    .line 336
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;->metadata:Ljava/util/Map;

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 332
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$StringEntry;->string:Ljava/lang/String;

    return-object v0
.end method
