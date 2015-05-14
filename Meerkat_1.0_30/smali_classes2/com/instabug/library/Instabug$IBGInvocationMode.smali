.class public final enum Lcom/instabug/library/Instabug$IBGInvocationMode;
.super Ljava/lang/Enum;
.source "Instabug.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/Instabug;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "IBGInvocationMode"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/instabug/library/Instabug$IBGInvocationMode;

.field public static final enum IBGInvocationModeBugReporter:Lcom/instabug/library/Instabug$IBGInvocationMode;

.field public static final enum IBGInvocationModeFeedbackSender:Lcom/instabug/library/Instabug$IBGInvocationMode;

.field public static final enum IBGInvocationModeNA:Lcom/instabug/library/Instabug$IBGInvocationMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 52
    new-instance v0, Lcom/instabug/library/Instabug$IBGInvocationMode;

    const-string v1, "IBGInvocationModeNA"

    invoke-direct {v0, v1, v2}, Lcom/instabug/library/Instabug$IBGInvocationMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeNA:Lcom/instabug/library/Instabug$IBGInvocationMode;

    new-instance v0, Lcom/instabug/library/Instabug$IBGInvocationMode;

    const-string v1, "IBGInvocationModeBugReporter"

    invoke-direct {v0, v1, v3}, Lcom/instabug/library/Instabug$IBGInvocationMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeBugReporter:Lcom/instabug/library/Instabug$IBGInvocationMode;

    new-instance v0, Lcom/instabug/library/Instabug$IBGInvocationMode;

    const-string v1, "IBGInvocationModeFeedbackSender"

    invoke-direct {v0, v1, v4}, Lcom/instabug/library/Instabug$IBGInvocationMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeFeedbackSender:Lcom/instabug/library/Instabug$IBGInvocationMode;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/instabug/library/Instabug$IBGInvocationMode;

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeNA:Lcom/instabug/library/Instabug$IBGInvocationMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeBugReporter:Lcom/instabug/library/Instabug$IBGInvocationMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeFeedbackSender:Lcom/instabug/library/Instabug$IBGInvocationMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/instabug/library/Instabug$IBGInvocationMode;->$VALUES:[Lcom/instabug/library/Instabug$IBGInvocationMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/instabug/library/Instabug$IBGInvocationMode;
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/instabug/library/Instabug$IBGInvocationMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/Instabug$IBGInvocationMode;

    return-object v0
.end method

.method public static values()[Lcom/instabug/library/Instabug$IBGInvocationMode;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/instabug/library/Instabug$IBGInvocationMode;->$VALUES:[Lcom/instabug/library/Instabug$IBGInvocationMode;

    invoke-virtual {v0}, [Lcom/instabug/library/Instabug$IBGInvocationMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/instabug/library/Instabug$IBGInvocationMode;

    return-object v0
.end method
