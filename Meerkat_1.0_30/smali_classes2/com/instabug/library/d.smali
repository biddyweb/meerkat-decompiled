.class final Lcom/instabug/library/d;
.super Ljava/lang/Object;
.source "InstabugAnnotationScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/instabug/library/b;


# direct methods
.method constructor <init>(Lcom/instabug/library/b;)V
    .locals 0

    .prologue
    .line 381
    iput-object p1, p0, Lcom/instabug/library/d;->a:Lcom/instabug/library/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lcom/instabug/library/d;->a:Lcom/instabug/library/b;

    invoke-static {v0}, Lcom/instabug/library/b;->b(Lcom/instabug/library/b;)V

    .line 385
    return-void
.end method
