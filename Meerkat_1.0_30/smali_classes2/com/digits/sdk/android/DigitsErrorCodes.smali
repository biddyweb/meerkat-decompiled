.class Lcom/digits/sdk/android/DigitsErrorCodes;
.super Ljava/lang/Object;
.source "DigitsErrorCodes.java"

# interfaces
.implements Lcom/digits/sdk/android/ErrorCodes;


# static fields
.field private static final INITIAL_CAPACITY:I = 0xa


# instance fields
.field protected final codeIdMap:Landroid/util/SparseIntArray;

.field private final resources:Landroid/content/res/Resources;


# direct methods
.method constructor <init>(Landroid/content/res/Resources;)V
    .locals 3
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Landroid/util/SparseIntArray;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    .line 17
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x58

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__confirmation_error_alternative:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 19
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x11c

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__network_error:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 21
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x12e

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__network_error:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 23
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0xf0

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__network_error:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 24
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x57

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__network_error:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 32
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->resources:Landroid/content/res/Resources;

    .line 33
    return-void
.end method


# virtual methods
.method public getDefaultMessage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->resources:Landroid/content/res/Resources;

    sget v1, Lcom/digits/sdk/android/R$string;->dgts__try_again:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMessage(I)Ljava/lang/String;
    .locals 3
    .param p1, "code"    # I

    .prologue
    const/4 v2, -0x1

    .line 38
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 39
    .local v0, "id":I
    if-ne v0, v2, :cond_0

    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsErrorCodes;->getDefaultMessage()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->resources:Landroid/content/res/Resources;

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getNetworkError()Ljava/lang/String;
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsErrorCodes;->resources:Landroid/content/res/Resources;

    sget v1, Lcom/digits/sdk/android/R$string;->dgts__network_error:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
