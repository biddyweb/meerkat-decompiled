.class Lco/getair/meerkat/mediators/BroadcastMediator$18;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Lcom/nanotasks/Completion;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->startAdaptiveBitrateMonitor()V
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
        "Ljava/lang/String;",
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
    .line 826
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$18;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/content/Context;Ljava/lang/Exception;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 834
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 835
    return-void
.end method

.method public bridge synthetic onSuccess(Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 826
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/mediators/BroadcastMediator$18;->onSuccess(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public onSuccess(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 830
    return-void
.end method
