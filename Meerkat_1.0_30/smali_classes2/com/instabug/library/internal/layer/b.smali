.class final Lcom/instabug/library/internal/layer/b;
.super Ljava/lang/Object;
.source "GoogleMapLayerProvider.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$SnapshotReadyCallback;


# instance fields
.field private synthetic a:Lcom/instabug/library/internal/layer/c$a;

.field private synthetic b:Lcom/instabug/library/internal/layer/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/layer/a;Lcom/instabug/library/internal/layer/c$a;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/instabug/library/internal/layer/b;->b:Lcom/instabug/library/internal/layer/a;

    iput-object p2, p0, Lcom/instabug/library/internal/layer/b;->a:Lcom/instabug/library/internal/layer/c$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onSnapshotReady(Landroid/graphics/Bitmap;)V
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/instabug/library/internal/layer/b;->b:Lcom/instabug/library/internal/layer/a;

    invoke-static {v0, p1}, Lcom/instabug/library/internal/layer/a;->a(Lcom/instabug/library/internal/layer/a;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 34
    iget-object v0, p0, Lcom/instabug/library/internal/layer/b;->a:Lcom/instabug/library/internal/layer/c$a;

    invoke-interface {v0}, Lcom/instabug/library/internal/layer/c$a;->a()V

    .line 35
    return-void
.end method
