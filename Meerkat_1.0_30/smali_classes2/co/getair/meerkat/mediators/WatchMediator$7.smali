.class Lco/getair/meerkat/mediators/WatchMediator$7;
.super Ljava/lang/Object;
.source "WatchMediator.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    .line 187
    iput-object p1, p0, Lco/getair/meerkat/mediators/WatchMediator$7;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 191
    packed-switch p2, :pswitch_data_0

    .line 197
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 193
    :pswitch_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator$7;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/WatchMediator;->sendComment()V

    goto :goto_0

    .line 191
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method
