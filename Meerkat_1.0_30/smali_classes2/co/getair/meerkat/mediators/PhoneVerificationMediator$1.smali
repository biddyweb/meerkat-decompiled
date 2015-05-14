.class Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;
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
    .line 67
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 70
    const-string v1, "Select Country"

    invoke-static {v1}, Lcom/sithagi/countrycodepicker/CountryPicker;->newInstance(Ljava/lang/String;)Lcom/sithagi/countrycodepicker/CountryPicker;

    move-result-object v0

    .line 71
    .local v0, "picker":Lcom/sithagi/countrycodepicker/CountryPicker;
    new-instance v1, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;

    invoke-direct {v1, p0, v0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1$1;-><init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;Lcom/sithagi/countrycodepicker/CountryPicker;)V

    invoke-virtual {v0, v1}, Lcom/sithagi/countrycodepicker/CountryPicker;->setListener(Lcom/sithagi/countrycodepicker/CountryPickerListener;)V

    .line 81
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getOwnerActivity()Landroid/support/v4/app/FragmentActivity;
    invoke-static {v1}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->access$300(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "COUNTRY_PICKER"

    invoke-virtual {v0, v1, v2}, Lcom/sithagi/countrycodepicker/CountryPicker;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 82
    return-void
.end method
