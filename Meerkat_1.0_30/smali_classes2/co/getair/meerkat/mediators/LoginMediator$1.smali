.class Lco/getair/meerkat/mediators/LoginMediator$1;
.super Ljava/lang/Object;
.source "LoginMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/LoginMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/LoginMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/LoginMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/LoginMediator;

    .prologue
    .line 33
    iput-object p1, p0, Lco/getair/meerkat/mediators/LoginMediator$1;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator$1;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    # invokes: Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/LoginMediator;->access$000(Lco/getair/meerkat/mediators/LoginMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventLoginSequenceStart"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator$1;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    # getter for: Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;
    invoke-static {v0}, Lco/getair/meerkat/mediators/LoginMediator;->access$100(Lco/getair/meerkat/mediators/LoginMediator;)Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setVisibility(I)V

    .line 38
    return-void
.end method
