.class public Lco/getair/meerkat/proxies/ResourcesProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "ResourcesProxy.java"


# instance fields
.field streamCoverPlaceholder:Landroid/graphics/drawable/BitmapDrawable;

.field useTweetSheet:Z

.field userPhotoPlaceholder:Landroid/graphics/drawable/BitmapDrawable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 22
    iput-object v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy;->userPhotoPlaceholder:Landroid/graphics/drawable/BitmapDrawable;

    .line 23
    iput-object v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy;->streamCoverPlaceholder:Landroid/graphics/drawable/BitmapDrawable;

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy;->useTweetSheet:Z

    .line 28
    return-void
.end method

.method public static NAME()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    const-string v0, "ResourcesProxy"

    return-object v0
.end method

.method public static getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;
    .locals 2

    .prologue
    .line 37
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->NAME()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/ResourcesProxy;

    return-object v0
.end method


# virtual methods
.method public getStreamCoverPlaceholder()Landroid/graphics/drawable/BitmapDrawable;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy;->streamCoverPlaceholder:Landroid/graphics/drawable/BitmapDrawable;

    return-object v0
.end method

.method public getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy;->userPhotoPlaceholder:Landroid/graphics/drawable/BitmapDrawable;

    return-object v0
.end method

.method public onRegister()V
    .locals 3

    .prologue
    .line 42
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;->onRegister()V

    .line 44
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    .line 45
    .local v0, "imageLoader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    const-string v1, "https://static.meerkatapp.co/users/default/profile-tmb"

    new-instance v2, Lco/getair/meerkat/proxies/ResourcesProxy$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/proxies/ResourcesProxy$1;-><init>(Lco/getair/meerkat/proxies/ResourcesProxy;)V

    invoke-virtual {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    .line 53
    const-string v1, "https://static.meerkatapp.co/broadcasts/default/cover"

    new-instance v2, Lco/getair/meerkat/proxies/ResourcesProxy$2;

    invoke-direct {v2, p0}, Lco/getair/meerkat/proxies/ResourcesProxy$2;-><init>(Lco/getair/meerkat/proxies/ResourcesProxy;)V

    invoke-virtual {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    .line 61
    return-void
.end method

.method public shouldUseTweetSheet()Z
    .locals 1

    .prologue
    .line 64
    iget-boolean v0, p0, Lco/getair/meerkat/proxies/ResourcesProxy;->useTweetSheet:Z

    return v0
.end method
