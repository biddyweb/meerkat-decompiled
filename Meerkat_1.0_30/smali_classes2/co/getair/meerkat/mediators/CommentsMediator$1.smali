.class Lco/getair/meerkat/mediators/CommentsMediator$1;
.super Ljava/lang/Object;
.source "CommentsMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/CommentsMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/CommentsMediator;

.field final synthetic val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/CommentsMediator;Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/CommentsMediator;

    .prologue
    .line 73
    iput-object p1, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 76
    iget-object v2, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->val$notification:Lorg/puremvc/java/multicore/interfaces/INotification;

    invoke-interface {v2}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 78
    .local v0, "commentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/FollowUser;>;"
    iget-object v2, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsMediator;

    # getter for: Lco/getair/meerkat/mediators/CommentsMediator;->commentsListView:Landroid/widget/ListView;
    invoke-static {v2}, Lco/getair/meerkat/mediators/CommentsMediator;->access$000(Lco/getair/meerkat/mediators/CommentsMediator;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;

    .line 79
    .local v1, "commentsArrayAdapter":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;
    if-nez v1, :cond_0

    .line 81
    new-instance v1, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;

    .end local v1    # "commentsArrayAdapter":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;
    iget-object v3, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsMediator;

    iget-object v2, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsMediator;

    # invokes: Lco/getair/meerkat/mediators/CommentsMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v2}, Lco/getair/meerkat/mediators/CommentsMediator;->access$100(Lco/getair/meerkat/mediators/CommentsMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;-><init>(Lco/getair/meerkat/mediators/CommentsMediator;Landroid/content/Context;)V

    .line 82
    .restart local v1    # "commentsArrayAdapter":Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;
    iget-object v2, p0, Lco/getair/meerkat/mediators/CommentsMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsMediator;

    # getter for: Lco/getair/meerkat/mediators/CommentsMediator;->commentsListView:Landroid/widget/ListView;
    invoke-static {v2}, Lco/getair/meerkat/mediators/CommentsMediator;->access$000(Lco/getair/meerkat/mediators/CommentsMediator;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 85
    :cond_0
    invoke-virtual {v1}, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->clear()V

    .line 86
    invoke-virtual {v1, v0}, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 87
    invoke-virtual {v1}, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;->notifyDataSetChanged()V

    .line 88
    return-void
.end method
