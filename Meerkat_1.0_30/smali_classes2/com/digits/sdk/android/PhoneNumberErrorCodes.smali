.class Lcom/digits/sdk/android/PhoneNumberErrorCodes;
.super Lcom/digits/sdk/android/DigitsErrorCodes;
.source "PhoneNumberErrorCodes.java"


# direct methods
.method constructor <init>(Landroid/content/res/Resources;)V
    .locals 3
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/DigitsErrorCodes;-><init>(Landroid/content/res/Resources;)V

    .line 11
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x2c

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__try_again_phone_number:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 13
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x12c

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__try_again_phone_number:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 15
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x12f

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__try_again_phone_number:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 17
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x11d

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__confirmation_error_alternative:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 19
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberErrorCodes;->codeIdMap:Landroid/util/SparseIntArray;

    const/16 v1, 0x11e

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__confirmation_error_alternative:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 21
    return-void
.end method
