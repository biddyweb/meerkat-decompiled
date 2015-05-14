.class Lco/getair/meerkat/proxies/InboxProxy$5;
.super Ljava/lang/Object;
.source "InboxProxy.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/InboxProxy;->clearInbox()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/InboxProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/InboxProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 168
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy$5;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy$5;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy$5;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;
    invoke-static {v1}, Lco/getair/meerkat/proxies/InboxProxy;->access$100(Lco/getair/meerkat/proxies/InboxProxy;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    # invokes: Lco/getair/meerkat/proxies/InboxProxy;->saveChanges(Landroid/content/Context;Ljava/util/HashMap;)V
    invoke-static {v0, v1, v2}, Lco/getair/meerkat/proxies/InboxProxy;->access$200(Lco/getair/meerkat/proxies/InboxProxy;Landroid/content/Context;Ljava/util/HashMap;)V

    .line 172
    const/4 v0, 0x0

    return-object v0
.end method
