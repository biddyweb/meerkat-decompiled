.class Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;
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

.field final synthetic val$followUser:Lco/getair/meerkat/dtos/FollowUser;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;Lco/getair/meerkat/dtos/FollowUser;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    .prologue
    .line 245
    iput-object p1, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;->this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    iput-object p2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;->val$followUser:Lco/getair/meerkat/dtos/FollowUser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 248
    iget-object v1, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;->this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    # getter for: Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->context:Landroid/content/Context;
    invoke-static {v1}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->access$300(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;->val$followUser:Lco/getair/meerkat/dtos/FollowUser;

    .line 249
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/FollowUser;->getUsername()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/utilities/TwitterUrlBuilder;->forUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;->val$followUser:Lco/getair/meerkat/dtos/FollowUser;

    .line 250
    invoke-virtual {v3}, Lco/getair/meerkat/dtos/FollowUser;->getTwitterHandle()Ljava/lang/String;

    move-result-object v3

    .line 248
    invoke-static {v1, v2, v3}, Lco/getair/meerkat/activities/WebViewActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 252
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$2;->this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    # getter for: Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->context:Landroid/content/Context;
    invoke-static {v1}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->access$300(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 253
    return-void
.end method
