.class public Lcom/instabug/library/InstabugActivityDelegate;
.super Ljava/lang/Object;
.source "InstabugActivityDelegate.java"

# interfaces
.implements Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;


# instance fields
.field private dispatcher:Lcom/instabug/library/util/TouchEventDispatcher;

.field private final mActivity:Landroid/app/Activity;

.field private mDetector:Landroid/support/v4/view/GestureDetectorCompat;

.field private mSwipeDelegate:Lcom/instabug/library/interaction/InstabugSwipeDelegate;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Lcom/instabug/library/util/TouchEventDispatcher;

    invoke-direct {v0}, Lcom/instabug/library/util/TouchEventDispatcher;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->dispatcher:Lcom/instabug/library/util/TouchEventDispatcher;

    .line 19
    iput-object p1, p0, Lcom/instabug/library/InstabugActivityDelegate;->mActivity:Landroid/app/Activity;

    .line 20
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->iG()Lcom/instabug/library/Instabug$a;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/Instabug$a;->a:Lcom/instabug/library/Instabug;

    # getter for: Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;
    invoke-static {v0}, Lcom/instabug/library/Instabug;->access$000(Lcom/instabug/library/Instabug;)Lcom/instabug/library/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventTwoFingersSwipeLeft:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_0

    .line 21
    new-instance v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    sget-object v1, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->TwoSwipeLeft:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    invoke-direct {v0, p0, v1}, Lcom/instabug/library/interaction/InstabugSwipeDelegate;-><init>(Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;)V

    iput-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->mSwipeDelegate:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    .line 22
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat;

    new-instance v1, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;

    iget-object v2, p0, Lcom/instabug/library/InstabugActivityDelegate;->mSwipeDelegate:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v2}, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;-><init>(Lcom/instabug/library/interaction/InstabugSwipeDelegate;)V

    invoke-direct {v0, p1, v1}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->mDetector:Landroid/support/v4/view/GestureDetectorCompat;

    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->mSwipeDelegate:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->mSwipeDelegate:Lcom/instabug/library/interaction/InstabugSwipeDelegate;

    invoke-virtual {v0, p1}, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->onTouchEvent(Landroid/view/MotionEvent;)V

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->dispatcher:Lcom/instabug/library/util/TouchEventDispatcher;

    iget-object v1, p0, Lcom/instabug/library/InstabugActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Lcom/instabug/library/util/TouchEventDispatcher;->dispatchTouchEvent(Landroid/app/Activity;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 39
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/InstabugActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/instabug/library/Instabug;->onDestroy(Landroid/app/Activity;)V

    .line 40
    return-void
.end method

.method public onInstabugGestureEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/instabug/library/InstabugActivityDelegate;->mDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 52
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 33
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    .line 34
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/InstabugActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/instabug/library/Instabug;->onPause(Landroid/app/Activity;)V

    .line 36
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    .line 28
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/InstabugActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/instabug/library/Instabug;->onResume(Landroid/app/Activity;)V

    .line 30
    :cond_0
    return-void
.end method
