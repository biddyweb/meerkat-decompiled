.class public final Lcom/instabug/library/internal/view/AnimatedImageView$a;
.super Ljava/lang/Object;
.source "AnimatedImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/internal/view/AnimatedImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput p2, p0, Lcom/instabug/library/internal/view/AnimatedImageView$a;->b:I

    .line 100
    iput p1, p0, Lcom/instabug/library/internal/view/AnimatedImageView$a;->a:I

    .line 101
    return-void
.end method
