.class Lorg/puremvc/java/multicore/core/view/View$1;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Lorg/puremvc/java/multicore/interfaces/IFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/puremvc/java/multicore/core/view/View;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/puremvc/java/multicore/core/view/View;

.field final synthetic val$mediator:Lorg/puremvc/java/multicore/interfaces/IMediator;


# direct methods
.method constructor <init>(Lorg/puremvc/java/multicore/core/view/View;Lorg/puremvc/java/multicore/interfaces/IMediator;)V
    .locals 0
    .param p1, "this$0"    # Lorg/puremvc/java/multicore/core/view/View;

    .prologue
    .line 189
    iput-object p1, p0, Lorg/puremvc/java/multicore/core/view/View$1;->this$0:Lorg/puremvc/java/multicore/core/view/View;

    iput-object p2, p0, Lorg/puremvc/java/multicore/core/view/View$1;->val$mediator:Lorg/puremvc/java/multicore/interfaces/IMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 1
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 192
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/view/View$1;->val$mediator:Lorg/puremvc/java/multicore/interfaces/IMediator;

    invoke-interface {v0, p1}, Lorg/puremvc/java/multicore/interfaces/IMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 193
    return-void
.end method
