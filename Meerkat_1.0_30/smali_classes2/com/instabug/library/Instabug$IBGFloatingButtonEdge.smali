.class public final enum Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;
.super Ljava/lang/Enum;
.source "Instabug.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/Instabug;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "IBGFloatingButtonEdge"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

.field public static final enum Left:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

.field public static final enum Right:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 53
    new-instance v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    const-string v1, "Right"

    invoke-direct {v0, v1, v2}, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Right:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    new-instance v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    const-string v1, "Left"

    invoke-direct {v0, v1, v3}, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Left:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    sget-object v1, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Right:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    aput-object v1, v0, v2

    sget-object v1, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->Left:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    aput-object v1, v0, v3

    sput-object v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->$VALUES:[Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;
    .locals 1

    .prologue
    .line 53
    const-class v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    return-object v0
.end method

.method public static values()[Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->$VALUES:[Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    invoke-virtual {v0}, [Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    return-object v0
.end method
