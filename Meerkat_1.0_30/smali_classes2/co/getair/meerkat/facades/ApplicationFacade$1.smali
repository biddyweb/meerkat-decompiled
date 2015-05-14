.class Lco/getair/meerkat/facades/ApplicationFacade$1;
.super Landroid/content/BroadcastReceiver;
.source "ApplicationFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/facades/ApplicationFacade;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/facades/ApplicationFacade;


# direct methods
.method constructor <init>(Lco/getair/meerkat/facades/ApplicationFacade;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/facades/ApplicationFacade;

    .prologue
    .line 23
    iput-object p1, p0, Lco/getair/meerkat/facades/ApplicationFacade$1;->this$0:Lco/getair/meerkat/facades/ApplicationFacade;

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

    .line 26
    iget-object v0, p0, Lco/getair/meerkat/facades/ApplicationFacade$1;->this$0:Lco/getair/meerkat/facades/ApplicationFacade;

    const-string v1, "authorizationStart"

    invoke-virtual {v0, v1, v2, v2}, Lco/getair/meerkat/facades/ApplicationFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    return-void
.end method
