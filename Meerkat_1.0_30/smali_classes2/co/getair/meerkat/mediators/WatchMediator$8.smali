.class Lco/getair/meerkat/mediators/WatchMediator$8;
.super Ljava/lang/Object;
.source "WatchMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/WatchMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/WatchMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/WatchMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 202
    iput-object p1, p0, Lco/getair/meerkat/mediators/WatchMediator$8;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 205
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator$8;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    # invokes: Lco/getair/meerkat/mediators/WatchMediator;->getWatchActivityFacade()Lco/getair/meerkat/facades/WatchActivityFacade;
    invoke-static {v1}, Lco/getair/meerkat/mediators/WatchMediator;->access$100(Lco/getair/meerkat/mediators/WatchMediator;)Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v1

    const-string v2, "watchProxy"

    invoke-virtual {v1, v2}, Lco/getair/meerkat/facades/WatchActivityFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/WatchProxy;

    .line 206
    .local v0, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator$8;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    # invokes: Lco/getair/meerkat/mediators/WatchMediator;->getWatchActivityFacade()Lco/getair/meerkat/facades/WatchActivityFacade;
    invoke-static {v1}, Lco/getair/meerkat/mediators/WatchMediator;->access$100(Lco/getair/meerkat/mediators/WatchMediator;)Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v1

    const-string v2, "eventEndWatchSaySomethingNiceButtonClicked"

    invoke-virtual {v0}, Lco/getair/meerkat/proxies/WatchProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lco/getair/meerkat/facades/WatchActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 207
    return-void
.end method
