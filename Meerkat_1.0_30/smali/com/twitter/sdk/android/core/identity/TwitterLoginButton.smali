.class public Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;
.super Landroid/widget/Button;
.source "TwitterLoginButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/identity/TwitterLoginButton$1;,
        Lcom/twitter/sdk/android/core/identity/TwitterLoginButton$LoginClickListener;
    }
.end annotation


# static fields
.field static final ERROR_MSG_NO_ACTIVITY:Ljava/lang/String; = "TwitterLoginButton requires an activity. Override getActivity to provide the activity for this button."

.field static final TAG:Ljava/lang/String; = "Twitter"


# instance fields
.field final activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field volatile authClient:Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

.field callback:Lcom/twitter/sdk/android/core/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;"
        }
    .end annotation
.end field

.field onClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 46
    const v0, 0x1010048

    invoke-direct {p0, p1, p2, v0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILcom/twitter/sdk/android/core/identity/TwitterAuthClient;)V

    .line 51
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILcom/twitter/sdk/android/core/identity/TwitterAuthClient;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "authClient"    # Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->activityRef:Ljava/lang/ref/WeakReference;

    .line 57
    iput-object p4, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->authClient:Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    .line 58
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setupButton()V

    .line 60
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->checkTwitterCoreAndEnable()V

    .line 61
    return-void
.end method

.method private checkTwitterCoreAndEnable()V
    .locals 4

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 188
    :goto_0
    return-void

    .line 182
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    .line 185
    .local v0, "ex":Ljava/lang/IllegalStateException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setEnabled(Z)V

    goto :goto_0
.end method

.method private setupButton()V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 65
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 66
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Lcom/twitter/sdk/android/core/R$drawable;->tw__ic_logo_default:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-super {p0, v1, v4, v4, v4}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 68
    sget v1, Lcom/twitter/sdk/android/core/R$dimen;->tw__login_btn_drawable_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-super {p0, v1}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    .line 70
    sget v1, Lcom/twitter/sdk/android/core/R$string;->tw__login_btn_txt:I

    invoke-super {p0, v1}, Landroid/widget/Button;->setText(I)V

    .line 71
    sget v1, Lcom/twitter/sdk/android/core/R$color;->tw__solid_white:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-super {p0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 72
    sget v1, Lcom/twitter/sdk/android/core/R$dimen;->tw__login_btn_text_size:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    invoke-super {p0, v3, v1}, Landroid/widget/Button;->setTextSize(IF)V

    .line 74
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-super {p0, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 75
    sget v1, Lcom/twitter/sdk/android/core/R$dimen;->tw__login_btn_left_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Lcom/twitter/sdk/android/core/R$dimen;->tw__login_btn_right_padding:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-super {p0, v1, v3, v2, v3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 77
    sget v1, Lcom/twitter/sdk/android/core/R$drawable;->tw__login_btn:I

    invoke-super {p0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 78
    new-instance v1, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton$LoginClickListener;

    invoke-direct {v1, p0, v4}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton$LoginClickListener;-><init>(Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;Lcom/twitter/sdk/android/core/identity/TwitterLoginButton$1;)V

    invoke-super {p0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 80
    invoke-super {p0, v3}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 82
    :cond_0
    return-void
.end method


# virtual methods
.method protected getActivity()Landroid/app/Activity;
    .locals 2

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 126
    :goto_0
    return-object v0

    .line 125
    :cond_0
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 126
    const/4 v0, 0x0

    goto :goto_0

    .line 128
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "TwitterLoginButton requires an activity. Override getActivity to provide the activity for this button."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCallback()Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->callback:Lcom/twitter/sdk/android/core/Callback;

    return-object v0
.end method

.method getTwitterAuthClient()Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->authClient:Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    if-nez v0, :cond_1

    .line 168
    const-class v1, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    monitor-enter v1

    .line 169
    :try_start_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->authClient:Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    invoke-direct {v0}, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->authClient:Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    .line 172
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    :cond_1
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->authClient:Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    return-object v0

    .line 172
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->getTwitterAuthClient()Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;->getRequestCode()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->getTwitterAuthClient()Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;->onActivityResult(IILandroid/content/Intent;)V

    .line 116
    :cond_0
    return-void
.end method

.method public setCallback(Lcom/twitter/sdk/android/core/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/TwitterSession;>;"
    if-nez p1, :cond_0

    .line 92
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Callback cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_0
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->callback:Lcom/twitter/sdk/android/core/Callback;

    .line 95
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->onClickListener:Landroid/view/View$OnClickListener;

    .line 135
    return-void
.end method
