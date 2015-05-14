.class Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;
.super Landroid/widget/ArrayAdapter;
.source "CommentsMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/CommentsMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CommentsArrayAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lco/getair/meerkat/dtos/FollowUser;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field final synthetic this$0:Lco/getair/meerkat/mediators/CommentsMediator;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/mediators/CommentsMediator;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 99
    iput-object p1, p0, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->this$0:Lco/getair/meerkat/mediators/CommentsMediator;

    .line 100
    const v0, 0x7f04004c

    invoke-direct {p0, p2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 102
    iput-object p2, p0, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->context:Landroid/content/Context;

    .line 103
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 108
    const/4 v2, 0x0

    .line 109
    .local v2, "holder":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
    move-object v5, p2

    .line 111
    .local v5, "rowView":Landroid/view/View;
    if-nez v5, :cond_0

    .line 113
    iget-object v6, p0, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->context:Landroid/content/Context;

    const-string v7, "layout_inflater"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 114
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v6, 0x7f04002d

    invoke-virtual {v3, v6, p3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 116
    new-instance v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;

    .end local v2    # "holder":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;-><init>(Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;)V

    .line 118
    .restart local v2    # "holder":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
    const v6, 0x7f0e00ef

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->comment:Landroid/widget/TextView;

    .line 119
    const v6, 0x7f0e00ee

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->twitterHandle:Landroid/widget/TextView;

    .line 120
    const v6, 0x7f0e00ed

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 122
    invoke-virtual {v5, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 127
    .end local v3    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    .line 128
    .local v0, "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    invoke-virtual {v0, v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 129
    invoke-virtual {v0, v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 130
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v4

    .line 132
    .local v4, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/FollowUser;

    .line 134
    .local v1, "followUser":Lco/getair/meerkat/dtos/FollowUser;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v6

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/FollowUser;->getProfileThumbImage()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v6, v7, v8, v4}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 135
    iget-object v6, v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->comment:Landroid/widget/TextView;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/FollowUser;->getDisplayName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    iget-object v6, v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->twitterHandle:Landroid/widget/TextView;

    const-string v7, "@%s"

    new-array v8, v9, [Ljava/lang/Object;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/FollowUser;->getUsername()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    return-object v5

    .line 124
    .end local v0    # "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .end local v1    # "followUser":Lco/getair/meerkat/dtos/FollowUser;
    .end local v4    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    :cond_0
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "holder":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
    check-cast v2, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;

    .restart local v2    # "holder":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
    goto :goto_0
.end method
