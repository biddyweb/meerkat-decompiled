.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;
.super Ljava/lang/Object;
.source "FeedMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ScheduledViewHolder"
.end annotation


# instance fields
.field broadcasterHandleTextView:Landroid/widget/TextView;

.field broadcasterImage:Landroid/widget/ImageView;

.field broadcasterNameTextView:Landroid/widget/TextView;

.field caption:Landroid/widget/TextView;

.field cover:Landroid/widget/ImageView;

.field extraInfo:Landroid/widget/TextView;

.field liveInfoView:Landroid/view/View;

.field location:Landroid/widget/TextView;

.field retweetCountButton:Landroid/view/View;

.field retweetCountIcon:Landroid/widget/ImageView;

.field retweetCountLabel:Landroid/widget/TextView;

.field scheduledCommentCountButton:Landroid/view/View;

.field scheduledCommentCountIcon:Landroid/widget/ImageView;

.field scheduledCommentCountLabel:Landroid/widget/TextView;

.field scheduledInfoView:Landroid/view/View;

.field subscribeCount:Landroid/widget/TextView;

.field subscribeToggle:Landroid/widget/ImageView;

.field subscribeView:Landroid/view/View;

.field final synthetic this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    .param p2, "rowView"    # Landroid/view/View;

    .prologue
    .line 925
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 926
    const v0, 0x7f0e0137

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->liveInfoView:Landroid/view/View;

    .line 927
    const v0, 0x7f0e0136

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->caption:Landroid/widget/TextView;

    .line 928
    const v0, 0x7f0e0138

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->location:Landroid/widget/TextView;

    .line 929
    const v0, 0x7f0e0130

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->cover:Landroid/widget/ImageView;

    .line 931
    const v0, 0x7f0e013c

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledInfoView:Landroid/view/View;

    .line 932
    const v0, 0x7f0e0140

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountButton:Landroid/view/View;

    .line 933
    const v0, 0x7f0e0142

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountLabel:Landroid/widget/TextView;

    .line 934
    const v0, 0x7f0e0141

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->retweetCountIcon:Landroid/widget/ImageView;

    .line 935
    const v0, 0x7f0e0143

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledCommentCountButton:Landroid/view/View;

    .line 936
    const v0, 0x7f0e0145

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledCommentCountLabel:Landroid/widget/TextView;

    .line 937
    const v0, 0x7f0e0144

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->scheduledCommentCountIcon:Landroid/widget/ImageView;

    .line 938
    const v0, 0x7f0e013d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeView:Landroid/view/View;

    .line 939
    const v0, 0x7f0e013f

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeCount:Landroid/widget/TextView;

    .line 940
    const v0, 0x7f0e013e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->subscribeToggle:Landroid/widget/ImageView;

    .line 942
    const v0, 0x7f0e0132

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->broadcasterImage:Landroid/widget/ImageView;

    .line 943
    const v0, 0x7f0e0134

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->broadcasterHandleTextView:Landroid/widget/TextView;

    .line 944
    const v0, 0x7f0e0133

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->broadcasterNameTextView:Landroid/widget/TextView;

    .line 946
    const v0, 0x7f0e0135

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$ScheduledViewHolder;->extraInfo:Landroid/widget/TextView;

    .line 947
    return-void
.end method
