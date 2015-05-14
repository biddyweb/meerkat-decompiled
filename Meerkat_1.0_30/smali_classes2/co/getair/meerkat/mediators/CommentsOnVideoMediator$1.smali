.class Lco/getair/meerkat/mediators/CommentsOnVideoMediator$1;
.super Ljava/lang/Object;
.source "CommentsOnVideoMediator.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/CommentsOnVideoMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/CommentsOnVideoMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/CommentsOnVideoMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/CommentsOnVideoMediator;

    .prologue
    .line 39
    iput-object p1, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsOnVideoMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 3
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 46
    add-int v0, p2, p3

    .line 48
    .local v0, "lastItem":I
    iget-object v2, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$1;->this$0:Lco/getair/meerkat/mediators/CommentsOnVideoMediator;

    if-ne v0, p4, :cond_0

    const/4 v1, 0x1

    :goto_0
    # setter for: Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->allowScroll:Z
    invoke-static {v2, v1}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;->access$002(Lco/getair/meerkat/mediators/CommentsOnVideoMediator;Z)Z

    .line 49
    return-void

    .line 48
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 42
    return-void
.end method
