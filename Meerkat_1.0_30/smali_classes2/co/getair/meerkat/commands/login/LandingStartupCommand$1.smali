.class Lco/getair/meerkat/commands/login/LandingStartupCommand$1;
.super Ljava/lang/Object;
.source "LandingStartupCommand.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/login/LandingStartupCommand;->registerProxies()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/login/LandingStartupCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/login/LandingStartupCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/login/LandingStartupCommand;

    .prologue
    .line 55
    iput-object p1, p0, Lco/getair/meerkat/commands/login/LandingStartupCommand$1;->this$0:Lco/getair/meerkat/commands/login/LandingStartupCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v0, Lco/getair/meerkat/proxies/SessionProxy;

    const-string v1, "sessionProxy"

    iget-object v2, p0, Lco/getair/meerkat/commands/login/LandingStartupCommand$1;->this$0:Lco/getair/meerkat/commands/login/LandingStartupCommand;

    # invokes: Lco/getair/meerkat/commands/login/LandingStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    invoke-static {v2}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->access$000(Lco/getair/meerkat/commands/login/LandingStartupCommand;)Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/proxies/SessionProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    return-object v0
.end method
