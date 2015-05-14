.class Lco/getair/meerkat/mediators/UserlistMediator$1;
.super Ljava/lang/Object;
.source "UserlistMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/UserlistMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/UserlistMediator;

.field final synthetic val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/UserlistMediator;Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/UserlistMediator;

    .prologue
    .line 99
    iput-object p1, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 102
    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;

    invoke-interface {v2}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 104
    .local v0, "userList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/FollowUser;>;"
    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    # getter for: Lco/getair/meerkat/mediators/UserlistMediator;->userListView:Landroid/widget/ListView;
    invoke-static {v2}, Lco/getair/meerkat/mediators/UserlistMediator;->access$000(Lco/getair/meerkat/mediators/UserlistMediator;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    .line 105
    .local v1, "userListArrayAdapter":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;
    if-nez v1, :cond_0

    .line 107
    new-instance v1, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    .end local v1    # "userListArrayAdapter":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;
    iget-object v3, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    # invokes: Lco/getair/meerkat/mediators/UserlistMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v2}, Lco/getair/meerkat/mediators/UserlistMediator;->access$100(Lco/getair/meerkat/mediators/UserlistMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;-><init>(Lco/getair/meerkat/mediators/UserlistMediator;Landroid/content/Context;)V

    .line 108
    .restart local v1    # "userListArrayAdapter":Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;
    iget-object v2, p0, Lco/getair/meerkat/mediators/UserlistMediator$1;->this$0:Lco/getair/meerkat/mediators/UserlistMediator;

    # getter for: Lco/getair/meerkat/mediators/UserlistMediator;->userListView:Landroid/widget/ListView;
    invoke-static {v2}, Lco/getair/meerkat/mediators/UserlistMediator;->access$000(Lco/getair/meerkat/mediators/UserlistMediator;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 111
    :cond_0
    invoke-virtual {v1}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->clear()V

    .line 112
    invoke-virtual {v1, v0}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 113
    invoke-virtual {v1}, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;->notifyDataSetChanged()V

    .line 114
    return-void
.end method
