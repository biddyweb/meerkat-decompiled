.class Lcom/sithagi/countrycodepicker/CountryPicker$2;
.super Ljava/lang/Object;
.source "CountryPicker.java"

# interfaces
.implements Landroid/text/TextWatcher;


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
    .line 161
    iput-object p1, p0, Lcom/sithagi/countrycodepicker/CountryPicker$2;->this$0:Lcom/sithagi/countrycodepicker/CountryPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 175
    iget-object v0, p0, Lcom/sithagi/countrycodepicker/CountryPicker$2;->this$0:Lcom/sithagi/countrycodepicker/CountryPicker;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/sithagi/countrycodepicker/CountryPicker;->search(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/sithagi/countrycodepicker/CountryPicker;->access$200(Lcom/sithagi/countrycodepicker/CountryPicker;Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 171
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 166
    return-void
.end method
