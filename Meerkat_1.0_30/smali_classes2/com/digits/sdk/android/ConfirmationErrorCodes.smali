.class Lcom/digits/sdk/android/ConfirmationErrorCodes;
.super Lcom/digits/sdk/android/DigitsErrorCodes;
.source "ConfirmationErrorCodes.java"


# direct methods
.method constructor <init>(Landroid/content/res/Resources;)V
    .locals 3
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/DigitsErrorCodes;-><init>(Landroid/content/res/Resources;)V

    .line 12
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2c

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__try_again_confirmation:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 14
    return-void
.end method
