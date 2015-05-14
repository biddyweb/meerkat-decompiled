.class Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;
.super Ljava/lang/Object;
.source "ExecutorScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->schedule(Lrx/functions/Action0;JLjava/util/concurrent/TimeUnit;)Lrx/Subscription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;

.field final synthetic val$action:Lrx/functions/Action0;

.field final synthetic val$mas:Lrx/subscriptions/MultipleAssignmentSubscription;


# direct methods
.method constructor <init>(Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;Lrx/subscriptions/MultipleAssignmentSubscription;Lrx/functions/Action0;)V
    .locals 0

    .prologue
    .line 122
    iput-object p1, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->this$0:Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;

    iput-object p2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->val$mas:Lrx/subscriptions/MultipleAssignmentSubscription;

    iput-object p3, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->val$action:Lrx/functions/Action0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 125
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->val$mas:Lrx/subscriptions/MultipleAssignmentSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/MultipleAssignmentSubscription;->isUnsubscribed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    :goto_0
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->val$mas:Lrx/subscriptions/MultipleAssignmentSubscription;

    iget-object v1, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->this$0:Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;

    iget-object v2, p0, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker$1;->val$action:Lrx/functions/Action0;

    invoke-virtual {v1, v2}, Lrx/schedulers/ExecutorScheduler$ExecutorSchedulerWorker;->schedule(Lrx/functions/Action0;)Lrx/Subscription;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/subscriptions/MultipleAssignmentSubscription;->set(Lrx/Subscription;)V

    goto :goto_0
.end method
