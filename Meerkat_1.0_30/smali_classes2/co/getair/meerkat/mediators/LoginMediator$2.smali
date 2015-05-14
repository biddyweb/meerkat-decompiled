.class Lco/getair/meerkat/mediators/LoginMediator$2;
.super Lcom/twitter/sdk/android/core/Callback;
.source "LoginMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/LoginMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/TwitterSession;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/LoginMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/LoginMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/LoginMediator;

    .prologue
    .line 41
    iput-object p1, p0, Lco/getair/meerkat/mediators/LoginMediator$2;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 3
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    const/4 v2, 0x0

    .line 49
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator$2;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    # invokes: Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/LoginMediator;->access$300(Lco/getair/meerkat/mediators/LoginMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventTwitterLoginError"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator$2;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    # getter for: Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;
    invoke-static {v0}, Lco/getair/meerkat/mediators/LoginMediator;->access$100(Lco/getair/meerkat/mediators/LoginMediator;)Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setVisibility(I)V

    .line 51
    const-string v0, "FAILED TO LOG IN"

    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/TwitterSession;>;"
    const/4 v2, 0x0

    .line 44
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator$2;->this$0:Lco/getair/meerkat/mediators/LoginMediator;

    # invokes: Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/LoginMediator;->access$200(Lco/getair/meerkat/mediators/LoginMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "startLoginSequenceCommand"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    return-void
.end method
