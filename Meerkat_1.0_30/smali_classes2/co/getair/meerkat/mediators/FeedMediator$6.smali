.class Lco/getair/meerkat/mediators/FeedMediator$6;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/FeedMediator;

.field final synthetic val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator;Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 251
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 254
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;

    invoke-interface {v2}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .line 257
    .local v1, "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    sget-object v2, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$feed$StreamFeedItemProxy$Type:[I

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 270
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->notifyDataSetChanged()V

    .line 271
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$900(Lco/getair/meerkat/mediators/FeedMediator;)Landroid/support/v4/widget/SwipeRefreshLayout;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 272
    return-void

    .line 259
    :pswitch_0
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v3}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v3

    iget-object v4, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v4}, Lco/getair/meerkat/mediators/FeedMediator;->access$600(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->binarySearch(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I
    invoke-static {v2, v1, v3, v7, v4}, Lco/getair/meerkat/mediators/FeedMediator;->access$800(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I

    move-result v0

    .line 260
    .local v0, "insertIndex":I
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->insert(Ljava/lang/Object;I)V

    .line 261
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # operator++ for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$608(Lco/getair/meerkat/mediators/FeedMediator;)I

    goto :goto_0

    .line 264
    .end local v0    # "insertIndex":I
    :pswitch_1
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v3}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v3

    iget-object v4, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v4}, Lco/getair/meerkat/mediators/FeedMediator;->access$600(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v4

    iget-object v5, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I
    invoke-static {v5}, Lco/getair/meerkat/mediators/FeedMediator;->access$700(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v5

    iget-object v6, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v6}, Lco/getair/meerkat/mediators/FeedMediator;->access$600(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->binarySearch(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I
    invoke-static {v2, v1, v3, v4, v5}, Lco/getair/meerkat/mediators/FeedMediator;->access$800(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I

    move-result v0

    .line 265
    .restart local v0    # "insertIndex":I
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->insert(Ljava/lang/Object;I)V

    .line 266
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$6;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # operator++ for: Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$708(Lco/getair/meerkat/mediators/FeedMediator;)I

    goto :goto_0

    .line 257
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
