.class public final enum Lcom/instabug/library/util/d$a;
.super Ljava/lang/Enum;
.source "ExecShell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/util/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation


# static fields
.field public static final enum a:Lcom/instabug/library/util/d$a;


# instance fields
.field b:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 14
    new-instance v0, Lcom/instabug/library/util/d$a;

    const-string v1, "check_su_binary"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "/system/xbin/which"

    aput-object v3, v2, v4

    const-string v3, "su"

    aput-object v3, v2, v5

    invoke-direct {v0, v1, v4, v2}, Lcom/instabug/library/util/d$a;-><init>(Ljava/lang/String;I[Ljava/lang/String;)V

    sput-object v0, Lcom/instabug/library/util/d$a;->a:Lcom/instabug/library/util/d$a;

    .line 13
    new-array v0, v5, [Lcom/instabug/library/util/d$a;

    sget-object v1, Lcom/instabug/library/util/d$a;->a:Lcom/instabug/library/util/d$a;

    aput-object v1, v0, v4

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 19
    iput-object p3, p0, Lcom/instabug/library/util/d$a;->b:[Ljava/lang/String;

    .line 20
    return-void
.end method
