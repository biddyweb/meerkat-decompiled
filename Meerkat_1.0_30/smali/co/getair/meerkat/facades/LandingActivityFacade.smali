.class public Lco/getair/meerkat/facades/LandingActivityFacade;
.super Lco/getair/meerkat/facades/BaseFacade;
.source "LandingActivityFacade.java"


# instance fields
.field private callingIntent:Landroid/content/Intent;


# direct methods
.method protected constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lco/getair/meerkat/facades/BaseFacade;-><init>(Landroid/app/Activity;)V

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/facades/LandingActivityFacade;->callingIntent:Landroid/content/Intent;

    .line 16
    return-void
.end method

.method public static getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/LandingActivityFacade;
    .locals 3
    .param p0, "ownerActivity"    # Landroid/app/Activity;

    .prologue
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "multitonKey":Ljava/lang/String;
    sget-object v1, Lco/getair/meerkat/facades/LandingActivityFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 24
    sget-object v1, Lco/getair/meerkat/facades/LandingActivityFacade;->instanceMap:Ljava/util/Map;

    new-instance v2, Lco/getair/meerkat/facades/LandingActivityFacade;

    invoke-direct {v2, p0}, Lco/getair/meerkat/facades/LandingActivityFacade;-><init>(Landroid/app/Activity;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    :cond_0
    sget-object v1, Lco/getair/meerkat/facades/LandingActivityFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/LandingActivityFacade;

    return-object v1
.end method


# virtual methods
.method public getCallingIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/facades/LandingActivityFacade;->callingIntent:Landroid/content/Intent;

    return-object v0
.end method

.method protected initializeController()V
    .locals 2

    .prologue
    .line 31
    invoke-super {p0}, Lco/getair/meerkat/facades/BaseFacade;->initializeController()V

    .line 33
    const-string v0, "startup"

    new-instance v1, Lco/getair/meerkat/commands/login/LandingStartupCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/login/LandingStartupCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/LandingActivityFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 34
    return-void
.end method

.method public startup(Landroid/content/Intent;)V
    .locals 0
    .param p1, "callingIntent"    # Landroid/content/Intent;

    .prologue
    .line 37
    iput-object p1, p0, Lco/getair/meerkat/facades/LandingActivityFacade;->callingIntent:Landroid/content/Intent;

    .line 38
    invoke-super {p0}, Lco/getair/meerkat/facades/BaseFacade;->startup()V

    .line 39
    return-void
.end method
