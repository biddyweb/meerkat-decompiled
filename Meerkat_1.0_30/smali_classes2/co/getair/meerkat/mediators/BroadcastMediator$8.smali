.class Lco/getair/meerkat/mediators/BroadcastMediator$8;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;-><init>(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/BroadcastMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 260
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$8;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v2, 0x0

    .line 262
    if-eqz p2, :cond_0

    .line 263
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$8;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$200(Lco/getair/meerkat/mediators/BroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandOptInTweets"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 267
    :goto_0
    return-void

    .line 265
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$8;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$300(Lco/getair/meerkat/mediators/BroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandOptOutTweets"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
