.class Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$2;
.super Ljava/lang/Object;
.source "ScheduleBroadcastMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
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
    .line 100
    iput-object p1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$2;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 103
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$2;->this$0:Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->addPhoto()V
    invoke-static {v0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->access$100(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    .line 104
    return-void
.end method
