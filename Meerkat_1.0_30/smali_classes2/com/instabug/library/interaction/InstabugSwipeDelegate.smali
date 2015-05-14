.class public Lcom/instabug/library/interaction/InstabugSwipeDelegate;
.super Ljava/lang/Object;
.source "InstabugSwipeDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;,
        Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureListener;,
        Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;
    }
.end annotation


# static fields
.field private static final DIRECTION_DOWN:I = 0x2

.field private static final DIRECTION_LEFT:I = 0x3

.field private static final DIRECTION_RIGHT:I = 0x4

.field private static final DIRECTION_UP:I = 0x1


# instance fields
.field private mDirectionNeeded:I

.field private final mForwarder:Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;

.field private mGoodCycle:Z

.field private mPointerCountNeeded:I


# direct methods
.method public constructor <init>(Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;)V
    .locals 3

    .prologue
    const/4 v2, 0x3

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-boolean v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mGoodCycle:Z

    .line 12
    iput v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mPointerCountNeeded:I

    .line 23
    iput-object p1, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mForwarder:Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;

    .line 25
    if-nez p2, :cond_0

    .line 26
    sget-object p2, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->ThreeSwipeUp:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    .line 28
    :cond_0
    sget-object v0, Lcom/instabug/library/interaction/a;->a:[I

    invoke-virtual {p2}, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 38
    :goto_0
    return-void

    .line 30
    :pswitch_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mDirectionNeeded:I

    .line 31
    iput v2, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mPointerCountNeeded:I

    goto :goto_0

    .line 34
    :pswitch_1
    iput v2, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mDirectionNeeded:I

    .line 35
    const/4 v0, 0x2

    iput v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mPointerCountNeeded:I

    goto :goto_0

    .line 28
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/instabug/library/interaction/InstabugSwipeDelegate;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->isDirectionValid(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/instabug/library/interaction/InstabugSwipeDelegate;)Z
    .locals 1

    .prologue
    .line 8
    iget-boolean v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mGoodCycle:Z

    return v0
.end method

.method static synthetic access$102(Lcom/instabug/library/interaction/InstabugSwipeDelegate;Z)Z
    .locals 0

    .prologue
    .line 8
    iput-boolean p1, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mGoodCycle:Z

    return p1
.end method

.method private isDirectionValid(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 60
    iget v2, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mDirectionNeeded:I

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    move v0, v1

    .line 68
    :cond_0
    :goto_0
    return v0

    .line 62
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    cmpl-float v2, v2, v3

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 65
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v2, v2, v3

    if-gez v2, :cond_0

    :cond_1
    move v0, v1

    goto :goto_0

    .line 60
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 2

    .prologue
    .line 42
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    iget v1, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mPointerCountNeeded:I

    if-lt v0, v1, :cond_0

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mGoodCycle:Z

    .line 46
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 47
    and-int/lit16 v0, v0, 0xff

    packed-switch v0, :pswitch_data_0

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mForwarder:Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;

    invoke-interface {v0, p1}, Lcom/instabug/library/interaction/InstabugSwipeDelegate$InstabugTouchEventForwarder;->onInstabugGestureEvent(Landroid/view/MotionEvent;)V

    .line 57
    :goto_0
    return-void

    .line 51
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    iget v1, p0, Lcom/instabug/library/interaction/InstabugSwipeDelegate;->mPointerCountNeeded:I

    if-ge v0, v1, :cond_1

    goto :goto_0

    .line 47
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
