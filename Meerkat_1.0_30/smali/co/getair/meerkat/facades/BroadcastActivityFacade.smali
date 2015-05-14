.class public Lco/getair/meerkat/facades/BroadcastActivityFacade;
.super Lco/getair/meerkat/facades/BaseFacade;
.source "BroadcastActivityFacade.java"


# direct methods
.method protected constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .param p1, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lco/getair/meerkat/facades/BaseFacade;-><init>(Landroid/app/Activity;)V

    .line 15
    return-void
.end method

.method public static getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/BroadcastActivityFacade;
    .locals 3
    .param p0, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 20
    .local v0, "multitonKey":Ljava/lang/String;
    sget-object v1, Lco/getair/meerkat/facades/BroadcastActivityFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 21
    sget-object v1, Lco/getair/meerkat/facades/BroadcastActivityFacade;->instanceMap:Ljava/util/Map;

    new-instance v2, Lco/getair/meerkat/facades/BroadcastActivityFacade;

    invoke-direct {v2, p0}, Lco/getair/meerkat/facades/BroadcastActivityFacade;-><init>(Landroid/app/Activity;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    :cond_0
    sget-object v1, Lco/getair/meerkat/facades/BroadcastActivityFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BroadcastActivityFacade;

    return-object v1
.end method


# virtual methods
.method protected initializeController()V
    .locals 2

    .prologue
    .line 28
    invoke-super {p0}, Lco/getair/meerkat/facades/BaseFacade;->initializeController()V

    .line 30
    const-string v0, "startup"

    new-instance v1, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 31
    return-void
.end method
