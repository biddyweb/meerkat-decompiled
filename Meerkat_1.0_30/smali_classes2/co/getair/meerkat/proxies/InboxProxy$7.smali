.class Lco/getair/meerkat/proxies/InboxProxy$7;
.super Ljava/lang/Object;
.source "InboxProxy.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/InboxProxy;->removeItem(Ljava/lang/String;Ljava/util/HashMap;)V
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

.field final synthetic val$bucketKey:Ljava/lang/String;

.field final synthetic val$itemToRemove:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 189
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->val$itemToRemove:Ljava/util/HashMap;

    iput-object p3, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->val$bucketKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 192
    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->val$itemToRemove:Ljava/util/HashMap;

    iget-object v3, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->val$bucketKey:Ljava/lang/String;

    iget-object v4, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;
    invoke-static {v4}, Lco/getair/meerkat/proxies/InboxProxy;->access$400(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/util/HashMap;

    move-result-object v4

    # invokes: Lco/getair/meerkat/proxies/InboxProxy;->_removeItem(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;
    invoke-static {v1, v2, v3, v4}, Lco/getair/meerkat/proxies/InboxProxy;->access$600(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    .line 193
    .local v0, "updatedInbox":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList;>;"
    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy$7;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;
    invoke-static {v2}, Lco/getair/meerkat/proxies/InboxProxy;->access$100(Lco/getair/meerkat/proxies/InboxProxy;)Landroid/content/Context;

    move-result-object v2

    # invokes: Lco/getair/meerkat/proxies/InboxProxy;->saveChanges(Landroid/content/Context;Ljava/util/HashMap;)V
    invoke-static {v1, v2, v0}, Lco/getair/meerkat/proxies/InboxProxy;->access$200(Lco/getair/meerkat/proxies/InboxProxy;Landroid/content/Context;Ljava/util/HashMap;)V

    .line 194
    const/4 v1, 0x0

    return-object v1
.end method
