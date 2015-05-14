.class Lco/getair/meerkat/proxies/ResourcesProxy$2;
.super Lcom/nostra13/universalimageloader/core/listener/SimpleImageLoadingListener;
.source "ResourcesProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/ResourcesProxy;->onRegister()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/ResourcesProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/ResourcesProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/ResourcesProxy;

    .prologue
    .line 53
    iput-object p1, p0, Lco/getair/meerkat/proxies/ResourcesProxy$2;->this$0:Lco/getair/meerkat/proxies/ResourcesProxy;

    invoke-direct {p0}, Lcom/nostra13/universalimageloader/core/listener/SimpleImageLoadingListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "loadedImage"    # Landroid/graphics/Bitmap;

    .prologue
    .line 56
    invoke-super {p0, p1, p2, p3}, Lcom/nostra13/universalimageloader/core/listener/SimpleImageLoadingListener;->onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 57
    iget-object v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy$2;->this$0:Lco/getair/meerkat/proxies/ResourcesProxy;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, p3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v1, v0, Lco/getair/meerkat/proxies/ResourcesProxy;->streamCoverPlaceholder:Landroid/graphics/drawable/BitmapDrawable;

    .line 58
    return-void
.end method
