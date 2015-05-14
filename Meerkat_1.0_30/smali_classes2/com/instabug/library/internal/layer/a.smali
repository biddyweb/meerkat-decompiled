.class public final Lcom/instabug/library/internal/layer/a;
.super Ljava/lang/Object;
.source "GoogleMapLayerProvider.java"

# interfaces
.implements Lcom/instabug/library/internal/layer/c;


# instance fields
.field private a:Ljava/lang/ref/WeakReference;

.field private b:Ljava/lang/ref/WeakReference;

.field private c:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/instabug/library/internal/layer/a;->a:Ljava/lang/ref/WeakReference;

    .line 19
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    .line 20
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/internal/layer/a;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .prologue
    .line 11
    iput-object p1, p0, Lcom/instabug/library/internal/layer/a;->c:Landroid/graphics/Bitmap;

    return-object p1
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;)V
    .locals 4

    .prologue
    .line 41
    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 43
    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 44
    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->c:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    aget v2, v1, v2

    int-to-float v2, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    int-to-float v1, v1

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 45
    return-void
.end method

.method public final a(Lcom/instabug/library/internal/layer/c$a;)V
    .locals 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->a:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    .line 25
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    .line 26
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    :cond_0
    invoke-interface {p1}, Lcom/instabug/library/internal/layer/c$a;->a()V

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/maps/GoogleMap;

    new-instance v1, Lcom/instabug/library/internal/layer/b;

    invoke-direct {v1, p0, p1}, Lcom/instabug/library/internal/layer/b;-><init>(Lcom/instabug/library/internal/layer/a;Lcom/instabug/library/internal/layer/c$a;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->snapshot(Lcom/google/android/gms/maps/GoogleMap$SnapshotReadyCallback;)V

    .line 37
    return-void
.end method

.method public final a()Z
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final b()Landroid/view/View;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/instabug/library/internal/layer/a;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0
.end method
