.class Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1$1;
.super Ljava/lang/Object;
.source "RegisterForNotificationsCommand.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;)V
    .locals 0
    .param p1, "this$2"    # Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;

    .prologue
    .line 75
    iput-object p1, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1$1;->this$2:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 78
    iget-object v0, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1$1;->this$2:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;

    iget-object v0, v0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->this$1:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;

    iget-object v0, v0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1;->this$0:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    # invokes: Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;->access$200(Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventSessionIsValid"

    iget-object v2, p0, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1$1;->this$2:Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;

    iget-object v2, v2, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand$1$1;->resultObject:Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    return-void
.end method
