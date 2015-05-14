.class final Lcom/instabug/library/w;
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
    .line 607
    iput-object p1, p0, Lcom/instabug/library/w;->a:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)V
    .locals 1

    .prologue
    .line 610
    iget-object v0, p0, Lcom/instabug/library/w;->a:Lcom/instabug/library/h;

    invoke-static {v0, p1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;Ljava/io/File;)V

    .line 611
    return-void
.end method
