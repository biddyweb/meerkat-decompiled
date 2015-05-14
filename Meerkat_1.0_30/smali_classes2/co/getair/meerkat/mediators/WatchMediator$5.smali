.class Lco/getair/meerkat/mediators/WatchMediator$5;
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
    .line 172
    iput-object p1, p0, Lco/getair/meerkat/mediators/WatchMediator$5;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 175
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator$5;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/WatchMediator;->sendComment()V

    .line 176
    return-void
.end method
