.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
.super Landroid/widget/ArrayAdapter;
.source "FeedMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/FeedMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FeedArrayAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;,
        Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATOR_TAG:Ljava/lang/String; = "CREATOR"

.field public static final HEADER_TAG:Ljava/lang/String; = "HEADER_TAG"

.field private static final ROW_INDEX_CREATE_BROADCAST:I = 0x0

.field private static final ROW_INDEX_LIVE_HEADER:I = 0x1

.field private static final VIEW_TYPE_ID_CREATE_BROADCAST:I = 0x0

.field private static final VIEW_TYPE_ID_HEADER:I = 0x1

.field private static final VIEW_TYPE_ID_ITEM_LIVE:I = 0x2

.field private static final VIEW_TYPE_ID_ITEM_SCHEDULED:I = 0x3


# instance fields
.field private context:Landroid/content/Context;

.field final synthetic this$0:Lco/getair/meerkat/mediators/FeedMediator;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/mediators/FeedMediator;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 411
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    .line 412
    const v0, 0x7f04003e

    invoke-direct {p0, p2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 414
    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    .line 415
    return-void
.end method

.method static synthetic access$1300(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .prologue
    .line 396
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method private createLiveStreamRow(Landroid/view/ViewGroup;Landroid/view/View;Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;)Landroid/view/View;
    .locals 15
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "rowView"    # Landroid/view/View;
    .param p3, "streamFeedItem"    # Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;

    .prologue
    .line 551
    invoke-virtual/range {p3 .. p3}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v1

    .line 552
    .local v1, "broadcastSummary":Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v2

    .line 554
    .local v2, "broadcaster":Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;
    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;

    if-eq v9, v10, :cond_3

    .line 555
    :cond_0
    iget-object v9, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const-string v10, "layout_inflater"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/LayoutInflater;

    .line 557
    .local v5, "inflater":Landroid/view/LayoutInflater;
    const v9, 0x7f04003e

    const/4 v10, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v5, v9, v0, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 559
    new-instance v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;

    move-object/from16 v0, p2

    invoke-direct {v3, p0, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/view/View;)V

    .line 561
    .local v3, "holder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 567
    .end local v5    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->getInfluencer()Lco/getair/meerkat/dtos/Influencer;

    move-result-object v6

    .line 569
    .local v6, "influencer":Lco/getair/meerkat/dtos/Influencer;
    if-eqz v6, :cond_4

    .line 570
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 573
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const v10, 0x7f0201e8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 574
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v11, 0x7f110006

    invoke-virtual {v9, v10, v11}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 576
    sget-object v9, Lco/getair/meerkat/mediators/FeedMediator$11;->$SwitchMap$co$getair$meerkat$dtos$Influencer$Type:[I

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v10

    invoke-virtual {v10}, Lco/getair/meerkat/dtos/Influencer$Type;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 587
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 594
    :goto_1
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->isTrending()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 596
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 597
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const v10, 0x7f0201ec

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 598
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v11, 0x7f110007

    invoke-virtual {v9, v10, v11}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 599
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const-string v10, "\ud83d\ude80 %s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v14, 0x7f0900ab

    invoke-virtual {v13, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 602
    :cond_1
    new-instance v9, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v10, 0x1

    .line 603
    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    const/4 v10, 0x1

    .line 604
    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    const v10, 0x7f0201e6

    .line 605
    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    .line 606
    invoke-virtual {v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    .line 608
    .local v7, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v4

    .line 610
    .local v4, "imageLoader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getCoverImageUrl()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->cover:Landroid/widget/ImageView;

    invoke-virtual {v4, v9, v10, v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 612
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->location:Landroid/widget/TextView;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getLocation()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 614
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->broadcasterNameTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getDisplayName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 615
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->broadcasterHandleTextView:Landroid/widget/TextView;

    const-string v10, "@%s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getUsername()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 616
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getImageUrl()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->broadcasterImage:Landroid/widget/ImageView;

    invoke-virtual {v4, v9, v10, v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 618
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "<font color=#ffffff>%s</font>"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    .line 620
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getCaption()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 619
    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 622
    .local v8, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getWatchersCount()I

    move-result v9

    if-lez v9, :cond_2

    .line 623
    const-string v9, " <font color=#ffe200>%d watchers</font>"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    .line 624
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getWatchersCount()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    .line 623
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    :cond_2
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->caption:Landroid/widget/TextView;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 629
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->liveInfoView:Landroid/view/View;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 633
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->likeCount:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    .line 634
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getLikesCount()I

    move-result v11

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->getCountStringOrEmpty(I)Ljava/lang/String;
    invoke-static {v10, v11}, Lco/getair/meerkat/mediators/FeedMediator;->access$1200(Lco/getair/meerkat/mediators/FeedMediator;I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 635
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->liveCommentCount:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    .line 636
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getCommentsCount()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->getCountStringOrEmpty(I)Ljava/lang/String;
    invoke-static {v10, v11}, Lco/getair/meerkat/mediators/FeedMediator;->access$1200(Lco/getair/meerkat/mediators/FeedMediator;I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 637
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->restreamCount:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    .line 638
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getRestreamsCount()Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->getCountStringOrEmpty(I)Ljava/lang/String;
    invoke-static {v10, v11}, Lco/getair/meerkat/mediators/FeedMediator;->access$1200(Lco/getair/meerkat/mediators/FeedMediator;I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 640
    return-object p2

    .line 563
    .end local v3    # "holder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;
    .end local v4    # "imageLoader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    .end local v6    # "influencer":Lco/getair/meerkat/dtos/Influencer;
    .end local v7    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .end local v8    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;

    .restart local v3    # "holder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;
    goto/16 :goto_0

    .line 578
    .restart local v6    # "influencer":Lco/getair/meerkat/dtos/Influencer;
    :pswitch_0
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const v10, 0x7f09004b

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_1

    .line 581
    :pswitch_1
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v11, 0x7f0900bf

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/Influencer;->getUserName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 584
    :pswitch_2
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    iget-object v10, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v11, 0x7f0900a4

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v6}, Lco/getair/meerkat/dtos/Influencer;->getUserName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 591
    :cond_4
    iget-object v9, v3, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1

    .line 576
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private createScheduledStreamRow(Landroid/view/ViewGroup;Landroid/view/View;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)Landroid/view/View;
    .locals 31
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "rowView"    # Landroid/view/View;
    .param p3, "streamFeedItem"    # Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .prologue
    .line 646
    invoke-virtual/range {p3 .. p3}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v11

    .line 647
    .local v11, "broadcastSummary":Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;
    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v21

    .line 649
    .local v21, "broadcaster":Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;
    if-eqz p2, :cond_0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    if-eq v4, v5, :cond_1

    .line 650
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Landroid/view/LayoutInflater;

    .line 651
    .local v25, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04003f

    const/4 v5, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v4, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 653
    new-instance v23, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/view/View;)V

    .line 655
    .local v23, "holder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 660
    .end local v25    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    new-instance v4, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v5, 0x1

    .line 661
    invoke-virtual {v4, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v4

    const/4 v5, 0x1

    .line 662
    invoke-virtual {v4, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v4

    const v5, 0x7f0201e6

    .line 663
    invoke-virtual {v4, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v4

    .line 664
    invoke-virtual {v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v26

    .line 666
    .local v26, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v24

    .line 668
    .local v24, "imageLoader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getCoverImageUrl()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->cover:Landroid/widget/ImageView;

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v4, v5, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 670
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->location:Landroid/widget/TextView;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getLocation()Lcom/google/common/base/Optional;

    move-result-object v4

    const-string v6, ""

    invoke-virtual {v4, v6}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 671
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->location:Landroid/widget/TextView;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getLocation()Lcom/google/common/base/Optional;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 675
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->broadcasterNameTextView:Landroid/widget/TextView;

    invoke-virtual/range {v21 .. v21}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 676
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->broadcasterHandleTextView:Landroid/widget/TextView;

    invoke-virtual/range {v21 .. v21}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getUsername()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 677
    invoke-virtual/range {v21 .. v21}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getImageUrl()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->broadcasterImage:Landroid/widget/ImageView;

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v4, v5, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 679
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->caption:Landroid/widget/TextView;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getCaption()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 681
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledInfoView:Landroid/view/View;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 683
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledCommentCountButton:Landroid/view/View;

    new-instance v5, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$1;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$1;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 690
    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v28

    .line 692
    .local v28, "startTime":J
    const-string v4, "In %d %s"

    move-wide/from16 v0, v28

    invoke-static {v0, v1, v4}, Lco/getair/meerkat/utilities/DateFormatter;->futureTimeString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 694
    .local v30, "timeToBroadcastString":Ljava/lang/String;
    if-eqz v30, :cond_3

    .line 695
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->extraInfo:Landroid/widget/TextView;

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 696
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->extraInfo:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 701
    :goto_2
    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getSubscribers()Ljava/util/List;

    move-result-object v27

    .line 703
    .local v27, "subscribers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v4

    const-string v5, "graphProxy"

    invoke-virtual {v4, v5}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v22

    check-cast v22, Lco/getair/meerkat/proxies/GraphProxy;

    .line 704
    .local v22, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual/range {v22 .. v22}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v12

    .line 706
    .local v12, "myUser":Lco/getair/meerkat/dtos/User;
    invoke-virtual {v12}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v20

    .line 708
    .local v20, "amISubscribed":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020206

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .line 709
    .local v10, "subscribeSelected":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020205

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 711
    .local v9, "subscribeNormal":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeToggle:Landroid/widget/ImageView;

    if-eqz v20, :cond_4

    move-object v4, v10

    :goto_3
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 713
    move-object/from16 v7, v23

    .line 714
    .local v7, "finalHolder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
    move/from16 v8, v20

    .line 715
    .local v8, "finalAmISubscribed":Z
    move-object/from16 v0, v23

    iget-object v13, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeView:Landroid/view/View;

    new-instance v4, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;

    move-object/from16 v5, p0

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v12}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$2;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;ZLandroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;Lco/getair/meerkat/dtos/User;)V

    invoke-virtual {v13, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 742
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020040

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    .line 743
    .local v17, "restreamSelected":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f02003f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    .line 745
    .local v18, "restreamNormal":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountLabel:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getRestreamsCount()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->getCountStringOrEmpty(I)Ljava/lang/String;
    invoke-static {v5, v6}, Lco/getair/meerkat/mediators/FeedMediator;->access$1200(Lco/getair/meerkat/mediators/FeedMediator;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 746
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountLabel:Landroid/widget/TextView;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getRestreamsCount()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_5

    const/4 v4, 0x0

    :goto_4
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 750
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledCommentCountLabel:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getCommentsCount()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->getCountStringOrEmpty(I)Ljava/lang/String;
    invoke-static {v5, v6}, Lco/getair/meerkat/mediators/FeedMediator;->access$1200(Lco/getair/meerkat/mediators/FeedMediator;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 751
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledCommentCountLabel:Landroid/widget/TextView;

    invoke-virtual {v11}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getCommentsCount()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_6

    const/4 v4, 0x0

    :goto_5
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 756
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountIcon:Landroid/widget/ImageView;

    invoke-virtual/range {p3 .. p3}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->didRestream()Z

    move-result v4

    if-eqz v4, :cond_7

    move-object/from16 v4, v17

    :goto_6
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 760
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountButton:Landroid/view/View;

    new-instance v13, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;

    move-object/from16 v14, p0

    move-object/from16 v15, p3

    move-object/from16 v16, v7

    move-object/from16 v19, v11

    invoke-direct/range {v13 .. v19}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$3;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V

    invoke-virtual {v4, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 782
    move-object/from16 v0, v23

    iget-object v5, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeCount:Landroid/widget/TextView;

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_8

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v6, 0x7f090099

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    .line 783
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v4, v6, v13}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 782
    :goto_7
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 786
    return-object p2

    .line 657
    .end local v7    # "finalHolder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
    .end local v8    # "finalAmISubscribed":Z
    .end local v9    # "subscribeNormal":Landroid/graphics/drawable/Drawable;
    .end local v10    # "subscribeSelected":Landroid/graphics/drawable/Drawable;
    .end local v12    # "myUser":Lco/getair/meerkat/dtos/User;
    .end local v17    # "restreamSelected":Landroid/graphics/drawable/Drawable;
    .end local v18    # "restreamNormal":Landroid/graphics/drawable/Drawable;
    .end local v20    # "amISubscribed":Z
    .end local v22    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .end local v23    # "holder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
    .end local v24    # "imageLoader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    .end local v26    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .end local v27    # "subscribers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v28    # "startTime":J
    .end local v30    # "timeToBroadcastString":Ljava/lang/String;
    :cond_1
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;

    .restart local v23    # "holder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
    goto/16 :goto_0

    .line 671
    .restart local v24    # "imageLoader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    .restart local v26    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    :cond_2
    const/16 v4, 0x8

    goto/16 :goto_1

    .line 698
    .restart local v28    # "startTime":J
    .restart local v30    # "timeToBroadcastString":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, v23

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->extraInfo:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .restart local v9    # "subscribeNormal":Landroid/graphics/drawable/Drawable;
    .restart local v10    # "subscribeSelected":Landroid/graphics/drawable/Drawable;
    .restart local v12    # "myUser":Lco/getair/meerkat/dtos/User;
    .restart local v20    # "amISubscribed":Z
    .restart local v22    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .restart local v27    # "subscribers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    move-object v4, v9

    .line 711
    goto/16 :goto_3

    .line 746
    .restart local v7    # "finalHolder":Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
    .restart local v8    # "finalAmISubscribed":Z
    .restart local v17    # "restreamSelected":Landroid/graphics/drawable/Drawable;
    .restart local v18    # "restreamNormal":Landroid/graphics/drawable/Drawable;
    :cond_5
    const/16 v4, 0x8

    goto/16 :goto_4

    .line 751
    :cond_6
    const/16 v4, 0x8

    goto :goto_5

    :cond_7
    move-object/from16 v4, v18

    .line 756
    goto :goto_6

    .line 783
    :cond_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const v6, 0x7f090098

    .line 784
    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_7
.end method

.method private getCreateBroadcastView(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "rowView"    # Landroid/view/View;

    .prologue
    .line 808
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    const-string v5, "CREATOR"

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 809
    :cond_0
    iget-object v4, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 811
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04003c

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 813
    const-string v4, "CREATOR"

    invoke-virtual {p2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 816
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :cond_1
    const v4, 0x7f0e012c

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 831
    .local v0, "edittext":Landroid/widget/EditText;
    const v4, 0x7f0e012d

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 832
    .local v2, "scheduleButton":Landroid/view/View;
    new-instance v4, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;

    invoke-direct {v4, p0, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/widget/EditText;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 840
    const v4, 0x7f0e012e

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 841
    .local v3, "streamButton":Landroid/view/View;
    new-instance v4, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$5;

    invoke-direct {v4, p0, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$5;-><init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 848
    return-object p2
.end method

.method private getHeaderView(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "rowView"    # Landroid/view/View;
    .param p3, "position"    # I

    .prologue
    .line 790
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    const-string v3, "HEADER_TAG"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 791
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 793
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v2, 0x7f04003d

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 795
    const-string v2, "HEADER_TAG"

    invoke-virtual {p2, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 798
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_1
    const/4 v2, 0x1

    if-ne p3, v2, :cond_2

    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isLiveLabelVisible()Z

    move-result v2

    if-eqz v2, :cond_2

    const v1, 0x7f090094

    .local v1, "labelString":I
    :goto_0
    move-object v2, p2

    .line 802
    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 804
    return-object p2

    .line 798
    .end local v1    # "labelString":I
    :cond_2
    const v1, 0x7f09009a

    goto :goto_0
.end method

.method private isLiveLabelVisible()Z
    .locals 1

    .prologue
    .line 505
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$600(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isScheduledBroadcastsVisible()Z
    .locals 1

    .prologue
    .line 509
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$700(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .prologue
    .line 419
    invoke-super {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 421
    .local v0, "rowCount":I
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isLiveLabelVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 423
    add-int/lit8 v0, v0, 0x1

    .line 426
    :cond_0
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isScheduledBroadcastsVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 428
    add-int/lit8 v0, v0, 0x1

    .line 431
    :cond_1
    return v0
.end method

.method public getDataCount()I
    .locals 1

    .prologue
    .line 475
    invoke-super {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getDataItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 476
    invoke-super {p0, p1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    return-object v0
.end method

.method public getItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    .locals 4
    .param p1, "position"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 436
    if-nez p1, :cond_1

    .line 472
    :cond_0
    :goto_0
    return-object v1

    .line 440
    :cond_1
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isLiveLabelVisible()Z

    move-result v2

    if-eqz v2, :cond_2

    if-eq p1, v3, :cond_0

    .line 446
    :cond_2
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isLiveLabelVisible()Z

    move-result v2

    if-nez v2, :cond_3

    .line 447
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isScheduledBroadcastsVisible()Z

    move-result v2

    if-eqz v2, :cond_3

    if-eq p1, v3, :cond_0

    .line 453
    :cond_3
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isLiveLabelVisible()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 454
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isScheduledBroadcastsVisible()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    .line 455
    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$600(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v2

    add-int/lit8 v2, v2, 0x2

    if-eq p1, v2, :cond_0

    .line 459
    :cond_4
    move v0, p1

    .line 461
    .local v0, "adjustedPosition":I
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isLiveLabelVisible()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 463
    add-int/lit8 v0, v0, -0x1

    .line 466
    :cond_5
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->isScheduledBroadcastsVisible()Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    .line 467
    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I
    invoke-static {v1}, Lco/getair/meerkat/mediators/FeedMediator;->access$600(Lco/getair/meerkat/mediators/FeedMediator;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    if-le p1, v1, :cond_6

    .line 469
    add-int/lit8 v0, v0, -0x1

    .line 472
    :cond_6
    add-int/lit8 v1, v0, -0x1

    invoke-super {p0, v1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    goto :goto_0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 396
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    move-result-object v0

    return-object v0
.end method

.method public getItemViewType(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    .line 491
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    move-result-object v0

    .line 493
    .local v0, "item":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    if-nez p1, :cond_0

    .line 494
    const/4 v1, 0x0

    .line 500
    :goto_0
    return v1

    .line 495
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v1

    sget-object v2, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Live:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    if-ne v1, v2, :cond_1

    .line 496
    const/4 v1, 0x2

    goto :goto_0

    .line 497
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v1

    sget-object v2, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    if-ne v1, v2, :cond_2

    .line 498
    const/4 v1, 0x3

    goto :goto_0

    .line 500
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x1

    .line 521
    move-object v1, p2

    .line 523
    .local v1, "rowView":Landroid/view/View;
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getItemViewType(I)I

    move-result v0

    .line 525
    .local v0, "itemViewType":I
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    move-result-object v2

    .line 527
    .local v2, "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    if-nez v0, :cond_0

    .line 528
    invoke-direct {p0, p3, v1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getCreateBroadcastView(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    .line 539
    .end local v2    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :goto_0
    return-object v3

    .line 530
    .restart local v2    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_0
    if-ne v0, v5, :cond_1

    .line 531
    invoke-direct {p0, p3, v1, p1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getHeaderView(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v3

    goto :goto_0

    .line 534
    :cond_1
    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    .line 535
    check-cast v2, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;

    .end local v2    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    invoke-direct {p0, p3, v1, v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->createLiveStreamRow(Landroid/view/ViewGroup;Landroid/view/View;Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;)Landroid/view/View;

    move-result-object v3

    goto :goto_0

    .line 538
    .restart local v2    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_2
    const/4 v3, 0x3

    if-ne v0, v3, :cond_3

    .line 539
    check-cast v2, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .end local v2    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    invoke-direct {p0, p3, v1, v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->createScheduledStreamRow(Landroid/view/ViewGroup;Landroid/view/View;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)Landroid/view/View;

    move-result-object v3

    goto :goto_0

    .line 545
    .restart local v2    # "streamFeedItem":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_3
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Unknown Feed item type: %d"

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 515
    const/4 v0, 0x4

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 481
    if-nez p1, :cond_0

    .line 482
    const/4 v0, 0x0

    .line 485
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ArrayAdapter;->isEnabled(I)Z

    move-result v0

    goto :goto_0
.end method

.method public removeAllOfType(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;)V
    .locals 5
    .param p1, "type"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    .prologue
    .line 852
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    .line 855
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getCount()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 856
    invoke-virtual {p0, v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    move-result-object v1

    .line 858
    .local v1, "item":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    if-eqz v1, :cond_0

    .line 859
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->getType()Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 860
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 855
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 865
    .end local v1    # "item":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .line 866
    .restart local v1    # "item":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    invoke-virtual {p0, v1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->remove(Ljava/lang/Object;)V

    goto :goto_1

    .line 868
    .end local v1    # "item":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_2
    return-void
.end method
