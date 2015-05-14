.class Lco/getair/meerkat/mediators/BroadcastMediator$15;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Lcom/nanotasks/Completion;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->startSubmission(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/nanotasks/Completion",
        "<",
        "Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/BroadcastMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 759
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$15;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/content/Context;Ljava/lang/Exception;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 767
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Connection issues. Reconnecting - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 769
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$15;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/BroadcastMediator;->handleConnectionIssues()V
    invoke-static {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$700(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    .line 770
    return-void
.end method

.method public onSuccess(Landroid/content/Context;Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "result"    # Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    .prologue
    .line 763
    return-void
.end method

.method public bridge synthetic onSuccess(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 759
    check-cast p2, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/mediators/BroadcastMediator$15;->onSuccess(Landroid/content/Context;Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;)V

    return-void
.end method
