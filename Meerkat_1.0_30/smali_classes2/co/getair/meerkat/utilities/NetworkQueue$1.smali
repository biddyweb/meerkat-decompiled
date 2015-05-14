.class Lco/getair/meerkat/utilities/NetworkQueue$1;
.super Ljava/lang/Object;
.source "NetworkQueue.java"

# interfaces
.implements Lcom/android/volley/toolbox/ImageLoader$ImageCache;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/utilities/NetworkQueue;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final cache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lco/getair/meerkat/utilities/NetworkQueue;


# direct methods
.method constructor <init>(Lco/getair/meerkat/utilities/NetworkQueue;)V
    .locals 2
    .param p1, "this$0"    # Lco/getair/meerkat/utilities/NetworkQueue;

    .prologue
    .line 27
    iput-object p1, p0, Lco/getair/meerkat/utilities/NetworkQueue$1;->this$0:Lco/getair/meerkat/utilities/NetworkQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Landroid/support/v4/util/LruCache;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Landroid/support/v4/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue$1;->cache:Landroid/support/v4/util/LruCache;

    return-void
.end method


# virtual methods
.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue$1;->cache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/utilities/NetworkQueue$1;->cache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    return-void
.end method
