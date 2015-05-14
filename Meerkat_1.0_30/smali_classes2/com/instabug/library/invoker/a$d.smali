.class public final Lcom/instabug/library/invoker/a$d;
.super Ljava/lang/Object;
.source "FloatingButtonInvoker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/invoker/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 294
    const v0, -0xffff01

    iput v0, p0, Lcom/instabug/library/invoker/a$d;->a:I

    .line 295
    const/4 v0, -0x1

    iput v0, p0, Lcom/instabug/library/invoker/a$d;->b:I

    .line 296
    sget-object v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Right:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    iput-object v0, p0, Lcom/instabug/library/invoker/a$d;->c:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    .line 297
    const/16 v0, 0x32

    iput v0, p0, Lcom/instabug/library/invoker/a$d;->d:I

    return-void
.end method
