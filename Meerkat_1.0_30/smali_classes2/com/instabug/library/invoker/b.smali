.class final Lcom/instabug/library/invoker/b;
.super Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;
.source "FloatingButtonInvoker.java"


# instance fields
.field private synthetic a:Lcom/instabug/library/invoker/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/invoker/a;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/instabug/library/invoker/b;->a:Lcom/instabug/library/invoker/a;

    invoke-direct {p0}, Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public final resize(II)Landroid/graphics/Shader;
    .locals 7

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 73
    new-instance v0, Landroid/graphics/RadialGradient;

    int-to-float v1, p1

    div-float/2addr v1, v3

    int-to-float v2, p1

    div-float/2addr v2, v3

    int-to-float v3, p1

    iget-object v4, p0, Lcom/instabug/library/invoker/b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v4}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a;)Lcom/instabug/library/invoker/a$d;

    move-result-object v4

    iget v4, v4, Lcom/instabug/library/invoker/a$d;->b:I

    iget-object v5, p0, Lcom/instabug/library/invoker/b;->a:Lcom/instabug/library/invoker/a;

    invoke-static {v5}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a;)Lcom/instabug/library/invoker/a$d;

    move-result-object v5

    iget v5, v5, Lcom/instabug/library/invoker/a$d;->a:I

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    return-object v0
.end method
