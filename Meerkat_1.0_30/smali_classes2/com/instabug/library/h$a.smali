.class final Lcom/instabug/library/h$a;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/internal/layer/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation


# instance fields
.field private a:I

.field private b:Lcom/instabug/library/h$b;

.field private c:Landroid/app/Activity;

.field private synthetic d:Lcom/instabug/library/h;


# direct methods
.method public constructor <init>(Lcom/instabug/library/h;Landroid/app/Activity;Lcom/instabug/library/h$b;)V
    .locals 1

    .prologue
    .line 971
    iput-object p1, p0, Lcom/instabug/library/h$a;->d:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 967
    const/4 v0, 0x1

    iput v0, p0, Lcom/instabug/library/h$a;->a:I

    .line 972
    iput-object p2, p0, Lcom/instabug/library/h$a;->c:Landroid/app/Activity;

    .line 973
    iput-object p3, p0, Lcom/instabug/library/h$a;->b:Lcom/instabug/library/h$b;

    .line 974
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .prologue
    .line 978
    iget-object v0, p0, Lcom/instabug/library/h$a;->d:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->i(Lcom/instabug/library/h;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lcom/instabug/library/h$a;->a:I

    if-lt v0, v1, :cond_0

    .line 979
    iget-object v0, p0, Lcom/instabug/library/h$a;->d:Lcom/instabug/library/h;

    iget-object v1, p0, Lcom/instabug/library/h$a;->c:Landroid/app/Activity;

    iget-object v2, p0, Lcom/instabug/library/h$a;->b:Lcom/instabug/library/h$b;

    invoke-static {v0, v1, v2}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Landroid/app/Activity;Lcom/instabug/library/h$b;)V

    .line 984
    :goto_0
    return-void

    .line 981
    :cond_0
    iget v0, p0, Lcom/instabug/library/h$a;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/instabug/library/h$a;->a:I

    .line 982
    iget-object v0, p0, Lcom/instabug/library/h$a;->d:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->i(Lcom/instabug/library/h;)Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lcom/instabug/library/h$a;->a:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/layer/c;

    invoke-interface {v0, p0}, Lcom/instabug/library/internal/layer/c;->a(Lcom/instabug/library/internal/layer/c$a;)V

    goto :goto_0
.end method
