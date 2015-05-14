.class public final enum Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;
.super Ljava/lang/Enum;
.source "InstabugSwipeDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/instabug/library/interaction/InstabugSwipeDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GestureConfig"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

.field public static final enum ThreeSwipeUp:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

.field public static final enum TwoSwipeLeft:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 20
    new-instance v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    const-string v1, "ThreeSwipeUp"

    invoke-direct {v0, v1, v2}, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->ThreeSwipeUp:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    new-instance v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    const-string v1, "TwoSwipeLeft"

    invoke-direct {v0, v1, v3}, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->TwoSwipeLeft:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    sget-object v1, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->ThreeSwipeUp:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    aput-object v1, v0, v2

    sget-object v1, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->TwoSwipeLeft:Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    aput-object v1, v0, v3

    sput-object v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->$VALUES:[Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    return-object v0
.end method

.method public static values()[Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->$VALUES:[Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    invoke-virtual {v0}, [Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/instabug/library/interaction/InstabugSwipeDelegate$GestureConfig;

    return-object v0
.end method
