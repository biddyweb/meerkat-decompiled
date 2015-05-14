.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;
.super Ljava/lang/Object;
.source "FeedMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LiveViewHolder"
.end annotation


# instance fields
.field broadcasterHandleTextView:Landroid/widget/TextView;

.field broadcasterImage:Landroid/widget/ImageView;

.field broadcasterNameTextView:Landroid/widget/TextView;

.field caption:Landroid/widget/TextView;

.field cover:Landroid/widget/ImageView;

.field extraInfo:Landroid/widget/TextView;

.field likeCount:Landroid/widget/TextView;

.field liveCommentCount:Landroid/widget/TextView;

.field liveInfoView:Landroid/view/View;

.field location:Landroid/widget/TextView;

.field restreamCount:Landroid/widget/TextView;

.field final synthetic this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    .param p2, "rowView"    # Landroid/view/View;

    .prologue
    .line 885
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 886
    const v0, 0x7f0e0137

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->liveInfoView:Landroid/view/View;

    .line 887
    const v0, 0x7f0e0136

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->caption:Landroid/widget/TextView;

    .line 888
    const v0, 0x7f0e0138

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->location:Landroid/widget/TextView;

    .line 889
    const v0, 0x7f0e0130

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->cover:Landroid/widget/ImageView;

    .line 890
    const v0, 0x7f0e0139

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->likeCount:Landroid/widget/TextView;

    .line 891
    const v0, 0x7f0e013a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->liveCommentCount:Landroid/widget/TextView;

    .line 892
    const v0, 0x7f0e013b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->restreamCount:Landroid/widget/TextView;

    .line 894
    const v0, 0x7f0e0132

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->broadcasterImage:Landroid/widget/ImageView;

    .line 895
    const v0, 0x7f0e0134

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->broadcasterHandleTextView:Landroid/widget/TextView;

    .line 896
    const v0, 0x7f0e0133

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->broadcasterNameTextView:Landroid/widget/TextView;

    .line 898
    const v0, 0x7f0e0135

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$LiveViewHolder;->extraInfo:Landroid/widget/TextView;

    .line 899
    return-void
.end method
