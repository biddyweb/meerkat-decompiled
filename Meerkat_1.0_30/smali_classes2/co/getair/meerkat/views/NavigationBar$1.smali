.class Lco/getair/meerkat/views/NavigationBar$1;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/views/NavigationBar;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/views/NavigationBar;


# direct methods
.method constructor <init>(Lco/getair/meerkat/views/NavigationBar;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/views/NavigationBar;

    .prologue
    .line 72
    iput-object p1, p0, Lco/getair/meerkat/views/NavigationBar$1;->this$0:Lco/getair/meerkat/views/NavigationBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 75
    iget-object v1, p0, Lco/getair/meerkat/views/NavigationBar$1;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/views/NavigationBar;->access$000(Lco/getair/meerkat/views/NavigationBar;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/views/NavigationBar$1;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/views/NavigationBar;->access$000(Lco/getair/meerkat/views/NavigationBar;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    instance-of v1, v1, Lco/getair/meerkat/facades/BaseFacade;

    if-eqz v1, :cond_0

    .line 76
    iget-object v1, p0, Lco/getair/meerkat/views/NavigationBar$1;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v1}, Lco/getair/meerkat/views/NavigationBar;->access$000(Lco/getair/meerkat/views/NavigationBar;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    .line 77
    .local v0, "baseFacade":Lco/getair/meerkat/facades/BaseFacade;
    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 79
    .end local v0    # "baseFacade":Lco/getair/meerkat/facades/BaseFacade;
    :cond_0
    return-void
.end method
