.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$1;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->createScheduledStreamRow(Landroid/view/ViewGroup;Landroid/view/View;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .prologue
    .line 683
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$1;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 686
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$1;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->access$1300(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$1;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->context:Landroid/content/Context;
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->access$1300(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;)Landroid/content/Context;

    move-result-object v2

    const-class v3, Lco/getair/meerkat/activities/CommentsActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 687
    return-void
.end method
