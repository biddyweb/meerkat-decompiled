.class Lco/getair/meerkat/mediators/BroadcastMediator$12;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastCutOff()V
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
    .line 388
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$12;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 390
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$12;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->finishBroadcasting()V

    .line 391
    return-void
.end method
