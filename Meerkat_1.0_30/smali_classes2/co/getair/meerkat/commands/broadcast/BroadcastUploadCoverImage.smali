.class public Lco/getair/meerkat/commands/broadcast/BroadcastUploadCoverImage;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "BroadcastUploadCoverImage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 37
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastUploadCoverImage;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 27
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 29
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 31
    .local v1, "coverBitmap":Landroid/graphics/Bitmap;
    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastUploadCoverImage;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    const-string v3, "broadcastProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/BaseFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/BroadcastProxy;

    .line 32
    .local v0, "broadcastProxy":Lco/getair/meerkat/proxies/BroadcastProxy;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->uploadCoverImage(Landroid/graphics/Bitmap;)V

    .line 33
    return-void
.end method
