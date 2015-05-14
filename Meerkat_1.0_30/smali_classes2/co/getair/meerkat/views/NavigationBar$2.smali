.class Lco/getair/meerkat/views/NavigationBar$2;
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
    .line 82
    iput-object p1, p0, Lco/getair/meerkat/views/NavigationBar$2;->this$0:Lco/getair/meerkat/views/NavigationBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 85
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$2;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/views/NavigationBar;->access$000(Lco/getair/meerkat/views/NavigationBar;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$2;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/views/NavigationBar;->access$000(Lco/getair/meerkat/views/NavigationBar;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "navigationBarProfileViewClicked"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    :cond_0
    return-void
.end method
