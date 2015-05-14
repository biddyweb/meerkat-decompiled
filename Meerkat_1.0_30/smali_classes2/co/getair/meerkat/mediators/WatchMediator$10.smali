.class Lco/getair/meerkat/mediators/WatchMediator$10;
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
    .line 217
    iput-object p1, p0, Lco/getair/meerkat/mediators/WatchMediator$10;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 220
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator$10;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    # invokes: Lco/getair/meerkat/mediators/WatchMediator;->getWatchActivityFacade()Lco/getair/meerkat/facades/WatchActivityFacade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/WatchMediator;->access$100(Lco/getair/meerkat/mediators/WatchMediator;)Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v0

    const-string v1, "eventReportGotClicked"

    invoke-virtual {v0, v1, v2, v2}, Lco/getair/meerkat/facades/WatchActivityFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 221
    return-void
.end method
