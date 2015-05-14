.class Lco/getair/meerkat/mediators/FeedMediator$1;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/FeedMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 123
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$1;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 126
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$1;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedLiveListView:Landroid/widget/ListView;
    invoke-static {v3}, Lco/getair/meerkat/mediators/FeedMediator;->access$000(Lco/getair/meerkat/mediators/FeedMediator;)Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .line 128
    .local v2, "feedLiveAdapter":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    if-nez v2, :cond_1

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 132
    :cond_1
    invoke-virtual {v2, p3}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    move-result-object v1

    .line 134
    .local v1, "feedItemProxy":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    if-eqz v1, :cond_0

    .line 138
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    move-result-object v0

    .line 140
    .local v0, "broadcastSummary":Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v3

    sget-object v4, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    if-ne v3, v4, :cond_2

    .line 141
    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$1;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->openWatchForFeed(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V
    invoke-static {v3, v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$100(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V

    .line 144
    :cond_2
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v3

    sget-object v4, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    if-ne v3, v4, :cond_0

    .line 145
    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$1;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->openShareScheduledStream(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V
    invoke-static {v3, v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$200(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V

    goto :goto_0
.end method
