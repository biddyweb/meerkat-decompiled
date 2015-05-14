.class Lco/getair/meerkat/proxies/InboxProxy$4;
.super Ljava/lang/Object;
.source "InboxProxy.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/InboxProxy;->updateInbox(Ljava/lang/String;)V
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

.field final synthetic val$finalBucketItemsArrivedCount:Ljava/util/HashMap;

.field final synthetic val$finalUpdatedInbox:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/InboxProxy;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/InboxProxy;

    .prologue
    .line 147
    iput-object p1, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->val$finalUpdatedInbox:Ljava/util/HashMap;

    iput-object p3, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->val$finalBucketItemsArrivedCount:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 150
    iget-object v3, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    iget-object v4, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # getter for: Lco/getair/meerkat/proxies/InboxProxy;->context:Landroid/content/Context;
    invoke-static {v4}, Lco/getair/meerkat/proxies/InboxProxy;->access$100(Lco/getair/meerkat/proxies/InboxProxy;)Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->val$finalUpdatedInbox:Ljava/util/HashMap;

    # invokes: Lco/getair/meerkat/proxies/InboxProxy;->saveChanges(Landroid/content/Context;Ljava/util/HashMap;)V
    invoke-static {v3, v4, v5}, Lco/getair/meerkat/proxies/InboxProxy;->access$200(Lco/getair/meerkat/proxies/InboxProxy;Landroid/content/Context;Ljava/util/HashMap;)V

    .line 152
    iget-object v3, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->val$finalBucketItemsArrivedCount:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 154
    .local v1, "bucketsKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 155
    .local v0, "bucketKey":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "InboxItemsArrived"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 156
    .local v2, "notificationName":Ljava/lang/String;
    iget-object v4, p0, Lco/getair/meerkat/proxies/InboxProxy$4;->this$0:Lco/getair/meerkat/proxies/InboxProxy;

    # invokes: Lco/getair/meerkat/proxies/InboxProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v4}, Lco/getair/meerkat/proxies/InboxProxy;->access$300(Lco/getair/meerkat/proxies/InboxProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    invoke-virtual {v4, v2, v6, v6}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    const-string v4, "score"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 158
    const-class v4, Lco/getair/meerkat/activities/FeedActivity;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lco/getair/meerkat/facades/FeedActivityFacade;->getInstance(Ljava/lang/String;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    invoke-virtual {v4, v2, v6, v6}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 162
    .end local v0    # "bucketKey":Ljava/lang/String;
    .end local v2    # "notificationName":Ljava/lang/String;
    :cond_1
    return-object v6
.end method
