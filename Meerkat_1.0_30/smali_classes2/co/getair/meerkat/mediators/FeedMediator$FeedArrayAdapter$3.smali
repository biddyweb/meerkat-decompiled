.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;
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

.field final synthetic val$finalHolder:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

.field final synthetic val$restreamNormal:Landroid/graphics/drawable/Drawable;

.field final synthetic val$restreamSelected:Landroid/graphics/drawable/Drawable;

.field final synthetic val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .prologue
    .line 760
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    iput-object p3, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$finalHolder:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    iput-object p4, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$restreamSelected:Landroid/graphics/drawable/Drawable;

    iput-object p5, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$restreamNormal:Landroid/graphics/drawable/Drawable;

    iput-object p6, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 763
    invoke-static {}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->getInstance()Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->invalidateScheduledStream(Ljava/lang/String;)V

    .line 764
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$finalHolder:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    iget-object v1, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountIcon:Landroid/widget/ImageView;

    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->didRestream()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$restreamSelected:Landroid/graphics/drawable/Drawable;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 768
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->didRestream()Z

    move-result v0

    if-nez v0, :cond_1

    .line 769
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iget-object v0, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    const-string v1, "scheduledEventRestreamCommand"

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/mediators/FeedMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 770
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getRestreamsCount()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->setRestreamsCount(I)V

    .line 771
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->setDidRestream(Z)V

    .line 778
    :goto_1
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->notifyDataSetChanged()V

    .line 779
    return-void

    .line 764
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$restreamNormal:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 773
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iget-object v0, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    const-string v1, "scheduledEventUnrestreamCommand"

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/mediators/FeedMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 774
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getRestreamsCount()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->setRestreamsCount(I)V

    .line 775
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;->val$streamFeedItem:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->setDidRestream(Z)V

    goto :goto_1
.end method
