.class Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "GetTwitterUserCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/login/GetTwitterUserCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/login/GetTwitterUserCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/login/GetTwitterUserCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/login/GetTwitterUserCommand;

    .prologue
    .line 21
    iput-object p1, p0, Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;->this$0:Lco/getair/meerkat/commands/login/GetTwitterUserCommand;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 24
    iget-boolean v0, p0, Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;->success:Z

    if-eqz v0, :cond_0

    .line 25
    iget-object v0, p0, Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;->this$0:Lco/getair/meerkat/commands/login/GetTwitterUserCommand;

    # invokes: Lco/getair/meerkat/commands/login/GetTwitterUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/commands/login/GetTwitterUserCommand;->access$000(Lco/getair/meerkat/commands/login/GetTwitterUserCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventTwitterUserArrived"

    iget-object v2, p0, Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;->resultObject:Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    :cond_0
    return-void
.end method
