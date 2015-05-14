.class Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;
.super Ljava/lang/Object;
.source "PhoneVerificationMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/PhoneVerificationMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 86
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 90
    const/4 v2, 0x0

    .line 92
    .local v2, "formattedNumber":Ljava/lang/String;
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryDialCode:Ljava/lang/String;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$200(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 96
    :try_start_0
    invoke-static {}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/google/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v5

    .line 99
    .local v5, "phoneNumberUtil":Lcom/google/i18n/phonenumbers/PhoneNumberUtil;
    new-instance v0, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getOwnerActivity()Landroid/support/v4/app/FragmentActivity;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$300(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-direct {v0, v6}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 100
    .local v0, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryCode:Ljava/lang/String;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$100(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveDefaultCountryCode(Ljava/lang/String;)V

    .line 101
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryDialCode:Ljava/lang/String;
    invoke-static {v7}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$200(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->mobileNumberEditText:Landroid/widget/EditText;
    invoke-static {v7}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$400(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/EditText;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;

    move-result-object v4

    .line 102
    .local v4, "phoneNumber":Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;
    sget-object v6, Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberFormat;->E164:Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberFormat;

    invoke-virtual {v5, v4, v6}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->format(Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberFormat;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/google/i18n/phonenumbers/NumberParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 109
    .end local v0    # "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    .end local v4    # "phoneNumber":Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;
    .end local v5    # "phoneNumberUtil":Lcom/google/i18n/phonenumbers/PhoneNumberUtil;
    :goto_0
    if-nez v2, :cond_1

    .line 111
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->promptInvalidNumberMessage()V
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$500(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V

    .line 127
    :goto_1
    return-void

    .line 104
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Lcom/google/i18n/phonenumbers/NumberParseException;
    invoke-virtual {v1}, Lcom/google/i18n/phonenumbers/NumberParseException;->printStackTrace()V

    goto :goto_0

    .line 116
    .end local v1    # "e":Lcom/google/i18n/phonenumbers/NumberParseException;
    :cond_0
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->promptInvalidNumberMessage()V
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$500(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V

    goto :goto_1

    .line 120
    :cond_1
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getOwnerActivity()Landroid/support/v4/app/FragmentActivity;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$300(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    const-string v7, "input_method"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/inputmethod/InputMethodManager;

    .line 121
    .local v3, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->mobileNumberEditText:Landroid/widget/EditText;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$400(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/EditText;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v6

    invoke-virtual {v3, v6, v8}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 123
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->inputView:Landroid/view/View;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$600(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/view/View;

    move-result-object v6

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 124
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->progressBar:Landroid/widget/ProgressBar;
    invoke-static {v6}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$700(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/ProgressBar;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 126
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    const-string v7, "eventSendPhoneNumberForVerification"

    invoke-virtual {v6, v7, v2, v9}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1
.end method
