.class public Lco/getair/meerkat/mediators/CommentsOnVideoMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "CommentsOnVideoMediator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    }
.end annotation


# instance fields
.field private allowScroll:Z

.field private commentsList:Landroid/widget/ListView;

.field private rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->rootView:Landroid/view/View;

    .line 37
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e007a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    .line 38
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setTranscriptMode(I)V

    .line 39
    iget-object v0, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    new-instance v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$1;-><init>(Lco/getair/meerkat/mediators/CommentsOnVideoMediator;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 51
    return-void
.end method

.method static synthetic access$002(Lco/getair/meerkat/mediators/CommentsOnVideoMediator;Z)Z
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/CommentsOnVideoMediator;
    .param p1, "x1"    # Z

    .prologue
    .line 25
    iput-boolean p1, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->allowScroll:Z

    return p1
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 55
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventActivityArrived"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 56
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;

    .line 58
    .local v0, "broadcastActivity":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;
    iget-object v3, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;

    .line 60
    .local v1, "commentsListAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->add(Ljava/lang/Object;)V

    .line 61
    invoke-virtual {v1}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->notifyDataSetChanged()V

    .line 63
    iget-boolean v3, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->allowScroll:Z

    if-eqz v3, :cond_0

    .line 64
    iget-object v3, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    invoke-virtual {v1}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->getCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 68
    .end local v0    # "broadcastActivity":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;
    .end local v1    # "commentsListAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventPlaylistArrived"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventBroadcastBegan"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 69
    :cond_1
    iget-object v3, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;

    .line 71
    .local v2, "feedLiveAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    if-nez v2, :cond_3

    .line 72
    new-instance v2, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;

    .end local v2    # "feedLiveAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;-><init>(Lco/getair/meerkat/mediators/CommentsOnVideoMediator;Landroid/content/Context;)V

    .line 74
    .restart local v2    # "feedLiveAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    iget-object v3, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    invoke-virtual {v3, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 79
    .end local v2    # "feedLiveAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    :cond_2
    :goto_0
    return-void

    .line 76
    .restart local v2    # "feedLiveAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    :cond_3
    invoke-virtual {v2}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->clear()V

    goto :goto_0
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 83
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventActivityArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventPlaylistArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventBroadcastBegan"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRemove()V
    .locals 2

    .prologue
    .line 145
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRemove()V

    .line 147
    const-string v1, "removing all comments stuff"

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;)V

    .line 148
    iget-object v1, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->commentsList:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;

    .line 149
    .local v0, "commentsListAdapter":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
    invoke-virtual {v0}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->clear()V

    .line 150
    invoke-virtual {v0}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->notifyDataSetChanged()V

    .line 151
    return-void
.end method
