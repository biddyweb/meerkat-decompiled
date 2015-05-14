.class public Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;
.super Ljava/lang/Object;
.source "SimpleDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/SimpleDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitmapEntry"
.end annotation


# instance fields
.field private final bitmap:Landroid/graphics/Bitmap;

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


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Ljava/util/Map;)V
    .locals 0
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 308
    .local p2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/io/Serializable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 309
    iput-object p1, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;->bitmap:Landroid/graphics/Bitmap;

    .line 310
    iput-object p2, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;->metadata:Ljava/util/Map;

    .line 311
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;->bitmap:Landroid/graphics/Bitmap;

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
    .line 318
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/SimpleDiskCache$BitmapEntry;->metadata:Ljava/util/Map;

    return-object v0
.end method
