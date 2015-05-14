.class Lco/getair/meerkat/views/NavigationBar$5;
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
    .line 121
    iput-object p1, p0, Lco/getair/meerkat/views/NavigationBar$5;->this$0:Lco/getair/meerkat/views/NavigationBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/high16 v1, -0x40800000    # -1.0f

    const/4 v2, 0x0

    .line 124
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$5;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lco/getair/meerkat/views/NavigationBar;->access$100(Lco/getair/meerkat/views/NavigationBar;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleX()F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$5;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lco/getair/meerkat/views/NavigationBar;->access$100(Lco/getair/meerkat/views/NavigationBar;)Landroid/widget/ImageView;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 126
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$5;->this$0:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v0}, Lco/getair/meerkat/views/NavigationBar;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventFeedFilteringEnabled"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    :goto_0
    return-void

    .line 129
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$5;->this$0:Lco/getair/meerkat/views/NavigationBar;

    # getter for: Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lco/getair/meerkat/views/NavigationBar;->access$100(Lco/getair/meerkat/views/NavigationBar;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 130
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar$5;->this$0:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v0}, Lco/getair/meerkat/views/NavigationBar;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventFeedFilteringDisabled"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
