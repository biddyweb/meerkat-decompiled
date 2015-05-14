.class Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "ScheduleBroadcastMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->showDatePicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    .prologue
    .line 183
    iput-object p1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 186
    iget-object v8, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->resultObject:Ljava/lang/Object;

    if-nez v8, :cond_0

    .line 214
    :goto_0
    return-void

    .line 190
    :cond_0
    iget-object v9, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    iget-object v8, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->resultObject:Ljava/lang/Object;

    check-cast v8, Ljava/util/Date;

    iput-object v8, v9, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeOfBroadcast:Ljava/util/Date;

    .line 192
    iget-object v8, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    iget-object v8, v8, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeOfBroadcast:Ljava/util/Date;

    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 194
    .local v2, "broadcastTime":J
    invoke-static {v2, v3}, Lco/getair/meerkat/utilities/DateFormatter;->timeToFuture(J)J

    move-result-wide v6

    .line 196
    .local v6, "timeToBroadcast":J
    long-to-int v8, v6

    const v9, 0xea60

    div-int/2addr v8, v9

    add-int/lit8 v5, v8, 0x1

    .line 197
    .local v5, "minutes":I
    div-int/lit8 v4, v5, 0x3c

    .line 200
    .local v4, "hours":I
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 201
    .local v1, "c":Ljava/util/Calendar;
    iget-object v8, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    iget-object v8, v8, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeOfBroadcast:Ljava/util/Date;

    invoke-virtual {v1, v8}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 202
    const/16 v8, 0xb

    invoke-virtual {v1, v8, v4}, Ljava/util/Calendar;->set(II)V

    .line 203
    const/16 v8, 0xc

    rem-int/lit8 v9, v5, 0x3c

    invoke-virtual {v1, v8, v9}, Ljava/util/Calendar;->set(II)V

    .line 206
    iget-object v8, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v8}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->access$300(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v8}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    .line 207
    .local v0, "activity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    new-instance v8, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;

    invoke-direct {v8, p0, v1}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;Ljava/util/Calendar;)V

    invoke-virtual {v0, v8}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
