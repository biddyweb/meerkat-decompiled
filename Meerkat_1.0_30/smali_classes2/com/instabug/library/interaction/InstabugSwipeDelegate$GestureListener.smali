.class public Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "InstabugSwipeDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/interaction/InstabugSwipeDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instabug/library/interaction/InstabugSwipeDelegate;


# direct methods
.method public constructor <init>(Lcom/instabug/library/interaction/InstabugSwipeDelegate;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;->this$0:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 74
    iget-object v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;->this$0:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    # invokes: Lcom/instabug/library/interaction/InstabugSwipeDelegate;->isDirectionValid(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    invoke-static {v0, p1, p2}, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->access$000(Lcom/instabug/library/interaction/InstabugSwipeDelegate;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;->this$0:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    # getter for: Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mGoodCycle:Z
    invoke-static {v0}, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->access$100(Lcom/instabug/library/interaction/InstabugSwipeDelegate;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->invokeFeedbackProcess()V

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;->this$0:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    # setter for: Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mGoodCycle:Z
    invoke-static {v0, v1}, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->access$102(Lcom/instabug/library/interaction/InstabugSwipeDelegate;Z)Z

    .line 78
    return v1
.end method
