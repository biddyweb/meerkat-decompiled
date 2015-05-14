.class Lco/getair/meerkat/facades/BaseFacade$1;
.super Landroid/content/BroadcastReceiver;
.source "BaseFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/facades/BaseFacade;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/facades/BaseFacade;


# direct methods
.method constructor <init>(Lco/getair/meerkat/facades/BaseFacade;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/facades/BaseFacade;

    .prologue
    .line 43
    iput-object p1, p0, Lco/getair/meerkat/facades/BaseFacade$1;->this$0:Lco/getair/meerkat/facades/BaseFacade;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 46
    iget-object v0, p0, Lco/getair/meerkat/facades/BaseFacade$1;->this$0:Lco/getair/meerkat/facades/BaseFacade;

    const-string v1, "eventDismissBroadcastScreen"

    invoke-virtual {v0, v1, v2, v2}, Lco/getair/meerkat/facades/BaseFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    return-void
.end method
