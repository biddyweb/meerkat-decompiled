.class Lcom/sithagi/countrycodepicker/CountryPicker$1;
.super Ljava/lang/Object;
.source "CountryPicker.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sithagi/countrycodepicker/CountryPicker;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sithagi/countrycodepicker/CountryPicker;


# direct methods
.method constructor <init>(Lcom/sithagi/countrycodepicker/CountryPicker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/sithagi/countrycodepicker/CountryPicker;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/CountryPicker$1;->this$0:Lcom/sithagi/countrycodepicker/CountryPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/sithagi/countrycodepicker/CountryPicker$1;->this$0:Lcom/sithagi/countrycodepicker/CountryPicker;

    # getter for: Lcom/sithagi/countrycodepicker/CountryPicker;->listener:Lcom/sithagi/countrycodepicker/CountryPickerListener;
    invoke-static {v1}, Lcom/sithagi/countrycodepicker/CountryPicker;->access$000(Lcom/sithagi/countrycodepicker/CountryPicker;)Lcom/sithagi/countrycodepicker/CountryPickerListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 154
    iget-object v1, p0, Lcom/sithagi/countrycodepicker/CountryPicker$1;->this$0:Lcom/sithagi/countrycodepicker/CountryPicker;

    # getter for: Lcom/sithagi/countrycodepicker/CountryPicker;->selectedCountriesList:Ljava/util/List;
    invoke-static {v1}, Lcom/sithagi/countrycodepicker/CountryPicker;->access$100(Lcom/sithagi/countrycodepicker/CountryPicker;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sithagi/countrycodepicker/Country;

    .line 155
    .local v0, "country":Lcom/sithagi/countrycodepicker/Country;
    iget-object v1, p0, Lcom/sithagi/countrycodepicker/CountryPicker$1;->this$0:Lcom/sithagi/countrycodepicker/CountryPicker;

    # getter for: Lcom/sithagi/countrycodepicker/CountryPicker;->listener:Lcom/sithagi/countrycodepicker/CountryPickerListener;
    invoke-static {v1}, Lcom/sithagi/countrycodepicker/CountryPicker;->access$000(Lcom/sithagi/countrycodepicker/CountryPicker;)Lcom/sithagi/countrycodepicker/CountryPickerListener;

    move-result-object v1

    invoke-virtual {v0}, Lcom/sithagi/countrycodepicker/Country;->getName()Ljava/lang/String;

    move-result-object v2

    .line 156
    invoke-virtual {v0}, Lcom/sithagi/countrycodepicker/Country;->getCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/sithagi/countrycodepicker/Country;->getDialCode()Ljava/lang/String;

    move-result-object v4

    .line 155
    invoke-interface {v1, v2, v3, v4}, Lcom/sithagi/countrycodepicker/CountryPickerListener;->onSelectCountry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .end local v0    # "country":Lcom/sithagi/countrycodepicker/Country;
    :cond_0
    return-void
.end method
