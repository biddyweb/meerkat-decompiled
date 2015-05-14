.class Lco/getair/meerkat/proxies/InboxProxy$9;
.super Ljava/lang/Object;
.source "InboxProxy.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/InboxProxy;->setBucket(Ljava/lang/String;Ljava/util/ArrayList;)V
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

.field final synthetic val$value:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 211
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy$9;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/InboxProxy$9;->val$bucketKey:Ljava/lang/String;

    iput-object p3, p0, Lco/getair/meerkat/proxies/InboxProxy$9;->val$value:Ljava/util/ArrayList;

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
    .line 214
    iget-object v0, p0, Lco/getair/meerkat/proxies/InboxProxy$9;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->inbox:Ljava/util/HashMap;
    invoke-static {v0}, Lco/getair/meerkat/proxies/InboxProxy;->access$400(Lco/getair/meerkat/proxies/InboxProxy;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/proxies/InboxProxy$9;->val$bucketKey:Ljava/lang/String;

    iget-object v2, p0, Lco/getair/meerkat/proxies/InboxProxy$9;->val$value:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    const/4 v0, 0x0

    return-object v0
.end method
