.class public Lcom/instabug/library/util/TouchEventDispatcher;
.super Ljava/lang/Object;
.source "TouchEventDispatcher.java"


# instance fields
.field private previousX:I

.field private previousY:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private findTargetView(Landroid/view/View;II)Landroid/view/View;
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    const/4 v0, 0x0

    .line 41
    .line 42
    const/4 v2, 0x2

    new-array v2, v2, [I

    .line 43
    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 44
    aget v3, v2, v4

    if-lt p3, v3, :cond_4

    aget v3, v2, v0

    if-lt p2, v3, :cond_4

    aget v3, v2, v4

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    add-int/2addr v3, v4

    if-gt p3, v3, :cond_4

    aget v2, v2, v0

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    if-gt p2, v2, :cond_4

    .line 45
    instance-of v2, p1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_3

    move v2, v0

    :goto_0
    move-object v0, p1

    .line 46
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_2

    move-object v0, p1

    .line 47
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 48
    instance-of v3, v0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    .line 49
    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v0, p2, p3}, Lcom/instabug/library/util/TouchEventDispatcher;->findTargetView(Landroid/view/View;II)Landroid/view/View;

    move-result-object v0

    .line 50
    if-eqz v0, :cond_6

    :goto_1
    move-object v1, v0

    .line 58
    :cond_0
    :goto_2
    if-nez v1, :cond_2

    .line 59
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    .line 53
    :cond_1
    invoke-direct {p0, v0, p2, p3}, Lcom/instabug/library/util/TouchEventDispatcher;->findTargetView(Landroid/view/View;II)Landroid/view/View;

    move-result-object v0

    .line 54
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 55
    goto :goto_2

    :cond_2
    move-object v0, v1

    .line 62
    if-nez v0, :cond_5

    .line 70
    :cond_3
    :goto_3
    return-object p1

    :cond_4
    move-object p1, v1

    .line 68
    goto :goto_3

    :cond_5
    move-object p1, v0

    goto :goto_3

    :cond_6
    move-object v0, v1

    goto :goto_1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 14
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v2

    invoke-virtual {v2}, Lcom/instabug/library/Instabug;->isTrackingUserSteps()Z

    move-result v2

    if-nez v2, :cond_1

    .line 32
    :cond_0
    :goto_0
    return v0

    .line 17
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    float-to-int v2, v2

    .line 18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    float-to-int v3, v3

    .line 19
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    if-nez v4, :cond_2

    .line 20
    iput v2, p0, Lcom/instabug/library/util/TouchEventDispatcher;->previousX:I

    .line 21
    iput v3, p0, Lcom/instabug/library/util/TouchEventDispatcher;->previousY:I

    goto :goto_0

    .line 22
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    if-ne v4, v1, :cond_0

    .line 23
    iget v4, p0, Lcom/instabug/library/util/TouchEventDispatcher;->previousX:I

    if-ne v4, v2, :cond_0

    iget v4, p0, Lcom/instabug/library/util/TouchEventDispatcher;->previousY:I

    if-ne v4, v3, :cond_0

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 25
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0, v2, v3}, Lcom/instabug/library/util/TouchEventDispatcher;->findTargetView(Landroid/view/View;II)Landroid/view/View;

    move-result-object v0

    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 27
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "EventProcessor: Found target view in "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long/2addr v2, v4

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 28
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/instabug/library/Instabug;->viewTapped(Landroid/view/View;)V

    move v0, v1

    .line 29
    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 36
    iput v0, p0, Lcom/instabug/library/util/TouchEventDispatcher;->previousX:I

    .line 37
    iput v0, p0, Lcom/instabug/library/util/TouchEventDispatcher;->previousY:I

    .line 38
    return-void
.end method
