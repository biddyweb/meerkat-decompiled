.class Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;
.super Ljava/lang/Object;
.source "PhoneVerificationMediator.java"

# interfaces
.implements Lcom/sithagi/countrycodepicker/CountryPickerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

.field final synthetic val$picker:Lcom/sithagi/countrycodepicker/CountryPicker;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;Lcom/sithagi/countrycodepicker/CountryPicker;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

    .prologue
    .line 71
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;->this$1:Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

    iput-object p2, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;->val$picker:Lcom/sithagi/countrycodepicker/CountryPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelectCountry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;
    .param p3, "dialCode"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;->this$1:Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

    iget-object v0, v0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->openCountryPickerButton:Landroid/widget/Button;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$000(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/Button;

    move-result-object v0

    const-string v1, "%s ( %s )"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;->this$1:Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

    iget-object v0, v0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # setter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryCode:Ljava/lang/String;
    invoke-static {v0, p2}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$102(Lco/getair/meerkat/mediators/PhoneVerificationMediator;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;->this$1:Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

    iget-object v0, v0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # setter for: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryDialCode:Ljava/lang/String;
    invoke-static {v0, p3}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$202(Lco/getair/meerkat/mediators/PhoneVerificationMediator;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;->val$picker:Lcom/sithagi/countrycodepicker/CountryPicker;

    invoke-virtual {v0}, Lcom/sithagi/countrycodepicker/CountryPicker;->dismiss()V

    .line 78
    return-void
.end method
