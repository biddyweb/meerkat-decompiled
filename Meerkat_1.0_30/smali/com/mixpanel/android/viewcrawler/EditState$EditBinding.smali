.class Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;
.super Ljava/lang/Object;
.source "EditState.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/viewcrawler/EditState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EditBinding"
.end annotation


# instance fields
.field private mAlive:Z

.field private volatile mDying:Z

.field private final mEdit:Lcom/mixpanel/android/viewcrawler/ViewVisitor;

.field private final mHandler:Landroid/os/Handler;

.field private final mViewRoot:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/mixpanel/android/viewcrawler/ViewVisitor;Landroid/os/Handler;)V
    .locals 2
    .param p1, "viewRoot"    # Landroid/view/View;
    .param p2, "edit"    # Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    .param p3, "uiThreadHandler"    # Landroid/os/Handler;

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    iput-object p2, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mEdit:Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    .line 132
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mViewRoot:Ljava/lang/ref/WeakReference;

    .line 133
    iput-object p3, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mHandler:Landroid/os/Handler;

    .line 134
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mAlive:Z

    .line 135
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mDying:Z

    .line 137
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 138
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 139
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 141
    :cond_0
    invoke-virtual {p0}, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->run()V

    .line 142
    return-void
.end method

.method private cleanUp()V
    .locals 3

    .prologue
    .line 174
    iget-boolean v2, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mAlive:Z

    if-eqz v2, :cond_1

    .line 175
    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mViewRoot:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 176
    .local v1, "viewRoot":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 177
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 178
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 179
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 182
    .end local v0    # "observer":Landroid/view/ViewTreeObserver;
    :cond_0
    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mEdit:Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    invoke-virtual {v2}, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->cleanup()V

    .line 184
    .end local v1    # "viewRoot":Landroid/view/View;
    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mAlive:Z

    .line 185
    return-void
.end method


# virtual methods
.method public kill()V
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mDying:Z

    .line 169
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 170
    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->run()V

    .line 147
    return-void
.end method

.method public run()V
    .locals 4

    .prologue
    .line 151
    iget-boolean v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mAlive:Z

    if-nez v1, :cond_0

    .line 165
    :goto_0
    return-void

    .line 155
    :cond_0
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mViewRoot:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 156
    .local v0, "viewRoot":Landroid/view/View;
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mDying:Z

    if-eqz v1, :cond_2

    .line 157
    :cond_1
    invoke-direct {p0}, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->cleanUp()V

    goto :goto_0

    .line 162
    :cond_2
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mEdit:Lcom/mixpanel/android/viewcrawler/ViewVisitor;

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->visit(Landroid/view/View;)V

    .line 163
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 164
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/EditState$EditBinding;->mHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
