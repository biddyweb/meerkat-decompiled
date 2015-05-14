.class interface abstract Lcom/digits/sdk/android/DigitsController;
.super Ljava/lang/Object;
.source "DigitsController.java"


# virtual methods
.method public abstract clearError()V
.end method

.method public abstract executeRequest(Landroid/content/Context;)V
.end method

.method public abstract getErrorCount()I
.end method

.method public abstract getErrors()Lcom/digits/sdk/android/ErrorCodes;
.end method

.method public abstract getTextWatcher()Landroid/text/TextWatcher;
.end method

.method public abstract handleError(Landroid/content/Context;Lcom/digits/sdk/android/DigitsException;)V
.end method

.method public abstract onResume()V
.end method

.method public abstract showTOS(Landroid/content/Context;)V
.end method

.method public abstract startFallback(Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/digits/sdk/android/DigitsException;)V
.end method

.method public abstract validateInput(Ljava/lang/CharSequence;)Z
.end method
