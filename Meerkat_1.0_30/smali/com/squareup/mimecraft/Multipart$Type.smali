.class public final enum Lcom/squareup/mimecraft/Multipart$Type;
.super Ljava/lang/Enum;
.source "Multipart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/mimecraft/Multipart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/squareup/mimecraft/Multipart$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/squareup/mimecraft/Multipart$Type;

.field public static final enum ALTERNATIVE:Lcom/squareup/mimecraft/Multipart$Type;

.field public static final enum DIGEST:Lcom/squareup/mimecraft/Multipart$Type;

.field public static final enum FORM:Lcom/squareup/mimecraft/Multipart$Type;

.field public static final enum MIXED:Lcom/squareup/mimecraft/Multipart$Type;

.field public static final enum PARALLEL:Lcom/squareup/mimecraft/Multipart$Type;


# instance fields
.field final contentType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 24
    new-instance v0, Lcom/squareup/mimecraft/Multipart$Type;

    const-string v1, "MIXED"

    const-string v2, "mixed"

    invoke-direct {v0, v1, v3, v2}, Lcom/squareup/mimecraft/Multipart$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/squareup/mimecraft/Multipart$Type;->MIXED:Lcom/squareup/mimecraft/Multipart$Type;

    .line 30
    new-instance v0, Lcom/squareup/mimecraft/Multipart$Type;

    const-string v1, "ALTERNATIVE"

    const-string v2, "alternative"

    invoke-direct {v0, v1, v4, v2}, Lcom/squareup/mimecraft/Multipart$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/squareup/mimecraft/Multipart$Type;->ALTERNATIVE:Lcom/squareup/mimecraft/Multipart$Type;

    .line 36
    new-instance v0, Lcom/squareup/mimecraft/Multipart$Type;

    const-string v1, "DIGEST"

    const-string v2, "digest"

    invoke-direct {v0, v1, v5, v2}, Lcom/squareup/mimecraft/Multipart$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/squareup/mimecraft/Multipart$Type;->DIGEST:Lcom/squareup/mimecraft/Multipart$Type;

    .line 41
    new-instance v0, Lcom/squareup/mimecraft/Multipart$Type;

    const-string v1, "PARALLEL"

    const-string v2, "parallel"

    invoke-direct {v0, v1, v6, v2}, Lcom/squareup/mimecraft/Multipart$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/squareup/mimecraft/Multipart$Type;->PARALLEL:Lcom/squareup/mimecraft/Multipart$Type;

    .line 47
    new-instance v0, Lcom/squareup/mimecraft/Multipart$Type;

    const-string v1, "FORM"

    const-string v2, "form-data"

    invoke-direct {v0, v1, v7, v2}, Lcom/squareup/mimecraft/Multipart$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/squareup/mimecraft/Multipart$Type;->FORM:Lcom/squareup/mimecraft/Multipart$Type;

    .line 18
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/squareup/mimecraft/Multipart$Type;

    sget-object v1, Lcom/squareup/mimecraft/Multipart$Type;->MIXED:Lcom/squareup/mimecraft/Multipart$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/squareup/mimecraft/Multipart$Type;->ALTERNATIVE:Lcom/squareup/mimecraft/Multipart$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/squareup/mimecraft/Multipart$Type;->DIGEST:Lcom/squareup/mimecraft/Multipart$Type;

    aput-object v1, v0, v5

    sget-object v1, Lcom/squareup/mimecraft/Multipart$Type;->PARALLEL:Lcom/squareup/mimecraft/Multipart$Type;

    aput-object v1, v0, v6

    sget-object v1, Lcom/squareup/mimecraft/Multipart$Type;->FORM:Lcom/squareup/mimecraft/Multipart$Type;

    aput-object v1, v0, v7

    sput-object v0, Lcom/squareup/mimecraft/Multipart$Type;->$VALUES:[Lcom/squareup/mimecraft/Multipart$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 52
    iput-object p3, p0, Lcom/squareup/mimecraft/Multipart$Type;->contentType:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/squareup/mimecraft/Multipart$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 18
    const-class v0, Lcom/squareup/mimecraft/Multipart$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/squareup/mimecraft/Multipart$Type;

    return-object v0
.end method

.method public static values()[Lcom/squareup/mimecraft/Multipart$Type;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/squareup/mimecraft/Multipart$Type;->$VALUES:[Lcom/squareup/mimecraft/Multipart$Type;

    invoke-virtual {v0}, [Lcom/squareup/mimecraft/Multipart$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/squareup/mimecraft/Multipart$Type;

    return-object v0
.end method
