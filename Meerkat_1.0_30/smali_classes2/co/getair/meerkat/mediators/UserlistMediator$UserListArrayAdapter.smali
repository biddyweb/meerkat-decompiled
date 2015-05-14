.class Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;
.super Landroid/widget/ArrayAdapter;
.source "UserlistMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/UserlistMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserListArrayAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
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

.field final synthetic this$0:Lco/getair/meerkat/mediators/UserlistMediator;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/mediators/UserlistMediator;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    iput-object p1, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    .line 126
    const v0, 0x7f04004c

    invoke-direct {p0, p2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 128
    iput-object p2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->context:Landroid/content/Context;

    .line 129
    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    .prologue
    .line 121
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method private getViewForCap(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 174
    move-object v1, p2

    .line 176
    .local v1, "rowView":Landroid/view/View;
    if-nez v1, :cond_0

    .line 178
    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->context:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 179
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v2, 0x7f04004b

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 182
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne p1, v2, :cond_1

    const/high16 v2, 0x43340000    # 180.0f

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 184
    return-object v1

    .line 182
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getViewForUserRow(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 190
    move-object v8, p2

    .line 192
    .local v8, "rowView":Landroid/view/View;
    if-nez v8, :cond_0

    .line 194
    iget-object v9, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->context:Landroid/content/Context;

    const-string v10, "layout_inflater"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/LayoutInflater;

    .line 195
    .local v6, "inflater":Landroid/view/LayoutInflater;
    const v9, 0x7f04004c

    const/4 v10, 0x0

    invoke-virtual {v6, v9, p3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 197
    new-instance v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;

    invoke-direct {v5, p0}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;-><init>(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;)V

    .line 199
    .local v5, "holder":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
    const v9, 0x7f0e0165

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->name:Landroid/widget/TextView;

    .line 200
    const v9, 0x7f0e0166

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->twitterHandle:Landroid/widget/TextView;

    .line 201
    const v9, 0x7f0e0164

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    iput-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 202
    const v9, 0x7f0e0169

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ToggleButton;

    iput-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->followButton:Landroid/widget/ToggleButton;

    .line 203
    const v9, 0x7f0e0167

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    iput-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->scoreContainer:Landroid/view/View;

    .line 204
    const v9, 0x7f0e0168

    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    iput-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->score:Landroid/widget/TextView;

    .line 206
    invoke-virtual {v8, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 212
    .end local v6    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    new-instance v9, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v10, 0x1

    .line 213
    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    const/4 v10, 0x1

    .line 214
    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    .line 216
    .local v1, "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    .line 218
    .local v7, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/dtos/FollowUser;

    .line 220
    .local v3, "followUser":Lco/getair/meerkat/dtos/FollowUser;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v9

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/FollowUser;->getProfileThumbImage()Ljava/lang/String;

    move-result-object v10

    iget-object v11, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v9, v10, v11, v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 221
    iget-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/FollowUser;->getDisplayName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    iget-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->twitterHandle:Landroid/widget/TextView;

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/FollowUser;->getTwitterHandle()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v9

    const-string v10, "graphProxy"

    invoke-virtual {v9, v10}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/proxies/GraphProxy;

    .line 225
    .local v4, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v3}, Lco/getair/meerkat/dtos/FollowUser;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Lco/getair/meerkat/proxies/GraphProxy;->amIFollowingUser(Ljava/lang/String;)Z

    move-result v0

    .line 227
    .local v0, "amIFollowing":Z
    move-object v2, v5

    .line 228
    .local v2, "finalViewHolder":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
    iget-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->followButton:Landroid/widget/ToggleButton;

    invoke-virtual {v9, v0}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 229
    iget-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->followButton:Landroid/widget/ToggleButton;

    new-instance v10, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;

    invoke-direct {v10, p0, v2, v0, v3}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;-><init>(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;ZLco/getair/meerkat/dtos/FollowUser;)V

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    iget-object v10, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->scoreContainer:Landroid/view/View;

    iget-object v9, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    # getter for: Lco/getair/meerkat/mediators/UserlistMediator;->showScore:Z
    invoke-static {v9}, Lco/getair/meerkat/mediators/UserlistMediator;->access$200(Lco/getair/meerkat/mediators/UserlistMediator;)Z

    move-result v9

    if-eqz v9, :cond_1

    const/4 v9, 0x0

    :goto_1
    invoke-virtual {v10, v9}, Landroid/view/View;->setVisibility(I)V

    .line 243
    iget-object v9, v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->score:Landroid/widget/TextView;

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/FollowUser;->getScore()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    new-instance v9, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;

    invoke-direct {v9, p0, v3}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;-><init>(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;Lco/getair/meerkat/dtos/FollowUser;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 256
    return-object v8

    .line 209
    .end local v0    # "amIFollowing":Z
    .end local v1    # "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .end local v2    # "finalViewHolder":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
    .end local v3    # "followUser":Lco/getair/meerkat/dtos/FollowUser;
    .end local v4    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .end local v5    # "holder":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
    .end local v7    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    :cond_0
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;

    .restart local v5    # "holder":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
    goto/16 :goto_0

    .line 242
    .restart local v0    # "amIFollowing":Z
    .restart local v1    # "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .restart local v2    # "finalViewHolder":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
    .restart local v3    # "followUser":Lco/getair/meerkat/dtos/FollowUser;
    .restart local v4    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .restart local v7    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    :cond_1
    const/16 v9, 0x8

    goto :goto_1
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 134
    invoke-super {p0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 145
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_1

    .line 147
    :cond_0
    const/4 v0, 0x0

    .line 149
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 157
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 164
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 160
    :pswitch_0
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getViewForCap(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 162
    :pswitch_1
    add-int/lit8 v0, p1, -0x1

    invoke-direct {p0, v0, p2, p3}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getViewForUserRow(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 157
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 139
    const/4 v0, 0x2

    return v0
.end method
