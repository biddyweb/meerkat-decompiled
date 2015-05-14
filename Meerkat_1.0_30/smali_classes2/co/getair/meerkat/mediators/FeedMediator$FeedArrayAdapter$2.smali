.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->createScheduledStreamRow(Landroid/view/ViewGroup;Landroid/view/View;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

.field final synthetic val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

.field final synthetic val$finalAmISubscribed:Z

.field final synthetic val$finalHolder:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

.field final synthetic val$myUser:Lco/getair/meerkat/dtos/User;

.field final synthetic val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

.field final synthetic val$subscribeNormal:Landroid/graphics/drawable/Drawable;

.field final synthetic val$subscribeSelected:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;ZLandroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;Lco/getair/meerkat/dtos/User;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .prologue
    .line 715
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    iput-object p3, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$finalHolder:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    iput-boolean p4, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$finalAmISubscribed:Z

    iput-object p5, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$subscribeNormal:Landroid/graphics/drawable/Drawable;

    iput-object p6, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$subscribeSelected:Landroid/graphics/drawable/Drawable;

    iput-object p7, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    iput-object p8, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$myUser:Lco/getair/meerkat/dtos/User;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 718
    invoke-static {}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->getInstance()Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    move-result-object v2

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->invalidateScheduledStream(Ljava/lang/String;)V

    .line 719
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$finalHolder:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    iget-object v3, v2, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeToggle:Landroid/widget/ImageView;

    iget-boolean v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$finalAmISubscribed:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$subscribeNormal:Landroid/graphics/drawable/Drawable;

    :goto_0
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 723
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getSubscribers()Ljava/util/List;

    move-result-object v1

    .line 726
    .local v1, "subscribers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-boolean v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$finalAmISubscribed:Z

    if-nez v2, :cond_1

    .line 727
    const-string v0, "scheduledEventSubscribeCommand"

    .line 729
    .local v0, "command":Ljava/lang/String;
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$myUser:Lco/getair/meerkat/dtos/User;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 736
    :goto_1
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iget-object v2, v2, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v3, v4}, Lco/getair/meerkat/mediators/FeedMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 738
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-virtual {v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->notifyDataSetChanged()V

    .line 739
    return-void

    .line 719
    .end local v0    # "command":Ljava/lang/String;
    .end local v1    # "subscribers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$subscribeSelected:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 731
    .restart local v1    # "subscribers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    const-string v0, "scheduledEventUnsubscribeCommand"

    .line 733
    .restart local v0    # "command":Ljava/lang/String;
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;->val$myUser:Lco/getair/meerkat/dtos/User;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1
.end method
