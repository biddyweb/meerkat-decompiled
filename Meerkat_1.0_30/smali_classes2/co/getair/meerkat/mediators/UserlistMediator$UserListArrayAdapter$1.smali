.class Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;
.super Ljava/lang/Object;
.source "UserlistMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->getViewForUserRow(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

.field final synthetic val$amIFollowing:Z

.field final synthetic val$finalViewHolder:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;

.field final synthetic val$followUser:Lco/getair/meerkat/dtos/FollowUser;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;ZLco/getair/meerkat/dtos/FollowUser;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    .prologue
    .line 229
    iput-object p1, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    iput-object p2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$finalViewHolder:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;

    iput-boolean p3, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$amIFollowing:Z

    iput-object p4, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$followUser:Lco/getair/meerkat/dtos/FollowUser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 232
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$finalViewHolder:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;

    iget-object v1, v0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->followButton:Landroid/widget/ToggleButton;

    iget-boolean v0, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$amIFollowing:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 233
    iget-boolean v0, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$amIFollowing:Z

    if-eqz v0, :cond_1

    .line 234
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v0

    const-string v1, "unfollowUserCommand"

    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$followUser:Lco/getair/meerkat/dtos/FollowUser;

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 238
    :goto_1
    iget-object v0, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->notifyDataSetChanged()V

    .line 239
    return-void

    .line 232
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 236
    :cond_1
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v0

    const-string v1, "followUserCommand"

    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$1;->val$followUser:Lco/getair/meerkat/dtos/FollowUser;

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1
.end method
