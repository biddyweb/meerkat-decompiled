.class Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;
.super Ljava/lang/Object;
.source "ScheduleBroadcastMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;

.field final synthetic val$c:Ljava/util/Calendar;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;Ljava/util/Calendar;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;

    .prologue
    .line 207
    iput-object p1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;->this$1:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;

    iput-object p2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;->val$c:Ljava/util/Calendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 210
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "HH:mm"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 211
    .local v0, "format":Ljava/text/SimpleDateFormat;
    iget-object v1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;->this$1:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;

    iget-object v1, v1, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    # getter for: Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeTextView:Landroid/widget/TextView;
    invoke-static {v1}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->access$400(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)Landroid/widget/TextView;

    move-result-object v1

    const-string v2, "%s from now"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5$1;->val$c:Ljava/util/Calendar;

    invoke-virtual {v5}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    return-void
.end method
