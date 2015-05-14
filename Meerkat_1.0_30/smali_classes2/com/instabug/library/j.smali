.class final Lcom/instabug/library/j;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/h$b;


# instance fields
.field private synthetic a:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;)V
    .locals 0

    .prologue
    .line 620
    iput-object p1, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)V
    .locals 4

    .prologue
    .line 623
    iget-object v0, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 624
    iget-object v0, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Z)Z

    .line 625
    iget-object v0, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->c(Lcom/instabug/library/h;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {}, Lcom/instabug/library/h;->x()Ljava/lang/Class;

    move-result-object v2

    iget-object v0, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->h(Lcom/instabug/library/h;)Lcom/instabug/library/Instabug$SdkThemeSource;

    move-result-object v0

    sget-object v3, Lcom/instabug/library/Instabug$SdkThemeSource;->CALLER_THEME:Lcom/instabug/library/Instabug$SdkThemeSource;

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->d(Lcom/instabug/library/h;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    :goto_0
    iget-object v3, p0, Lcom/instabug/library/j;->a:Lcom/instabug/library/h;

    invoke-static {v3}, Lcom/instabug/library/h;->e(Lcom/instabug/library/h;)Lcom/instabug/library/Instabug$SdkThemingMode;

    move-result-object v3

    invoke-static {v1, v2, v0, v3, p1}, Lcom/instabug/library/h;->a(Landroid/app/Activity;Ljava/lang/Class;Lcom/instabug/library/internal/theming/a;Lcom/instabug/library/Instabug$SdkThemingMode;Ljava/io/File;)V

    .line 626
    return-void

    .line 625
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
