.class Lco/getair/meerkat/mediators/FeedMediator$3;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/FeedMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 159
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$3;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$3;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->refreshFeed()V
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$300(Lco/getair/meerkat/mediators/FeedMediator;)V

    .line 163
    return-void
.end method
