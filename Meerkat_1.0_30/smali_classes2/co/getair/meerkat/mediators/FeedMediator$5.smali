.class Lco/getair/meerkat/mediators/FeedMediator$5;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
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
    .line 230
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$5;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 233
    const-string v0, "CRASH"

    const-string v1, "CLEANING ALL SCHEDULED"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$5;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->progressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$400(Lco/getair/meerkat/mediators/FeedMediator;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 236
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$5;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v0

    sget-object v1, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;->Scheduled:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->removeAllOfType(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$Type;)V

    .line 237
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$5;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    const/4 v1, 0x0

    # setter for: Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I
    invoke-static {v0, v1}, Lco/getair/meerkat/mediators/FeedMediator;->access$702(Lco/getair/meerkat/mediators/FeedMediator;I)I

    .line 238
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$5;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # getter for: Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    invoke-static {v0}, Lco/getair/meerkat/mediators/FeedMediator;->access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->notifyDataSetChanged()V

    .line 239
    return-void
.end method
