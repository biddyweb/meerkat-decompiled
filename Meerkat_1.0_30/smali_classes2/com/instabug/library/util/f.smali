.class public final Lcom/instabug/library/util/f;
.super Ljava/lang/Object;
.source "InstabugIdentifierResolver.java"


# instance fields
.field private a:Landroid/content/res/Resources;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/f;->a:Landroid/content/res/Resources;

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/util/f;->b:Ljava/lang/String;

    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .prologue
    .line 15
    iget-object v0, p0, Lcom/instabug/library/util/f;->a:Landroid/content/res/Resources;

    iget-object v1, p0, Lcom/instabug/library/util/f;->b:Ljava/lang/String;

    invoke-virtual {v0, p1, p2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method
