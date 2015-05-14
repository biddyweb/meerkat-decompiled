.class Lco/getair/meerkat/mediators/ProfileMediator$3;
.super Ljava/lang/Object;
.source "ProfileMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/ProfileMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/ProfileMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/ProfileMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/ProfileMediator;

    .prologue
    .line 108
    iput-object p1, p0, Lco/getair/meerkat/mediators/ProfileMediator$3;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 111
    iget-object v0, p0, Lco/getair/meerkat/mediators/ProfileMediator$3;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    # invokes: Lco/getair/meerkat/mediators/ProfileMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/ProfileMediator;->access$100(Lco/getair/meerkat/mediators/ProfileMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "userLogout"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    return-void
.end method
