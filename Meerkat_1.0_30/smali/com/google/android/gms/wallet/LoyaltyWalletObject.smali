.class public final Lcom/google/android/gms/wallet/LoyaltyWalletObject;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/wallet/LoyaltyWalletObject;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field state:I

.field private final zzFG:I

.field zzaDA:Ljava/lang/String;

.field zzaDB:Ljava/lang/String;

.field zzaDC:Ljava/lang/String;

.field zzaDD:Ljava/lang/String;

.field zzaDE:Ljava/lang/String;

.field zzaDF:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzp;",
            ">;"
        }
    .end annotation
.end field

.field zzaDG:Lcom/google/android/gms/wallet/wobs/zzl;

.field zzaDH:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/maps/model/LatLng;",
            ">;"
        }
    .end annotation
.end field

.field zzaDI:Ljava/lang/String;

.field zzaDJ:Ljava/lang/String;

.field zzaDK:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzd;",
            ">;"
        }
    .end annotation
.end field

.field zzaDL:Z

.field zzaDM:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzn;",
            ">;"
        }
    .end annotation
.end field

.field zzaDN:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzj;",
            ">;"
        }
    .end annotation
.end field

.field zzaDO:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzn;",
            ">;"
        }
    .end annotation
.end field

.field zzaDP:Lcom/google/android/gms/wallet/wobs/zzf;

.field zzaDx:Ljava/lang/String;

.field zzaDy:Ljava/lang/String;

.field zzaDz:Ljava/lang/String;

.field zzapd:Ljava/lang/String;

.field zzfl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/wallet/zzk;

    invoke-direct {v0}, Lcom/google/android/gms/wallet/zzk;-><init>()V

    sput-object v0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    iput v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzFG:I

    invoke-static {}, Lcom/google/android/gms/internal/zzls;->zzkb()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDF:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/internal/zzls;->zzkb()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDH:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/internal/zzls;->zzkb()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDK:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/internal/zzls;->zzkb()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDM:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/internal/zzls;->zzkb()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDN:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/android/gms/internal/zzls;->zzkb()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDO:Ljava/util/ArrayList;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/ArrayList;Lcom/google/android/gms/wallet/wobs/zzl;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/google/android/gms/wallet/wobs/zzf;)V
    .locals 1
    .param p1, "versionCode"    # I
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "accountId"    # Ljava/lang/String;
    .param p4, "issuerName"    # Ljava/lang/String;
    .param p5, "programName"    # Ljava/lang/String;
    .param p6, "accountName"    # Ljava/lang/String;
    .param p7, "barcodeAlternateText"    # Ljava/lang/String;
    .param p8, "barcodeType"    # Ljava/lang/String;
    .param p9, "barcodeValue"    # Ljava/lang/String;
    .param p10, "barcodeLabel"    # Ljava/lang/String;
    .param p11, "classId"    # Ljava/lang/String;
    .param p12, "state"    # I
    .param p14, "validTimeInterval"    # Lcom/google/android/gms/wallet/wobs/zzl;
    .param p16, "infoModuleDataHexFontColor"    # Ljava/lang/String;
    .param p17, "infoModuleDataHexBackgroundColor"    # Ljava/lang/String;
    .param p19, "infoModuleDataShowLastUpdateTime"    # Z
    .param p23, "loyaltyPoints"    # Lcom/google/android/gms/wallet/wobs/zzf;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzp;",
            ">;",
            "Lcom/google/android/gms/wallet/wobs/zzl;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/maps/model/LatLng;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzd;",
            ">;Z",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzn;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzj;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/wallet/wobs/zzn;",
            ">;",
            "Lcom/google/android/gms/wallet/wobs/zzf;",
            ")V"
        }
    .end annotation

    .prologue
    .local p13, "messages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/wallet/wobs/zzp;>;"
    .local p15, "locations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/maps/model/LatLng;>;"
    .local p18, "infoModuleDataLabelValueRows":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/wallet/wobs/zzd;>;"
    .local p20, "imageModuleDataMainImageUris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/wallet/wobs/zzn;>;"
    .local p21, "textModulesData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/wallet/wobs/zzj;>;"
    .local p22, "linksModuleDataUris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/wallet/wobs/zzn;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzFG:I

    iput-object p2, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzfl:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDx:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDy:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDz:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzapd:Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDA:Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDB:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDC:Ljava/lang/String;

    iput-object p10, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDD:Ljava/lang/String;

    iput-object p11, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDE:Ljava/lang/String;

    iput p12, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->state:I

    iput-object p13, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDF:Ljava/util/ArrayList;

    iput-object p14, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDG:Lcom/google/android/gms/wallet/wobs/zzl;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDH:Ljava/util/ArrayList;

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDI:Ljava/lang/String;

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDJ:Ljava/lang/String;

    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDK:Ljava/util/ArrayList;

    move/from16 v0, p19

    iput-boolean v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDL:Z

    move-object/from16 v0, p20

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDM:Ljava/util/ArrayList;

    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDN:Ljava/util/ArrayList;

    move-object/from16 v0, p22

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDO:Ljava/util/ArrayList;

    move-object/from16 v0, p23

    iput-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDP:Lcom/google/android/gms/wallet/wobs/zzf;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAccountId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDx:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzapd:Ljava/lang/String;

    return-object v0
.end method

.method public getBarcodeAlternateText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDA:Ljava/lang/String;

    return-object v0
.end method

.method public getBarcodeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDB:Ljava/lang/String;

    return-object v0
.end method

.method public getBarcodeValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDC:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzfl:Ljava/lang/String;

    return-object v0
.end method

.method public getIssuerName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDy:Ljava/lang/String;

    return-object v0
.end method

.method public getProgramName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzaDz:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/wallet/LoyaltyWalletObject;->zzFG:I

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/wallet/zzk;->zza(Lcom/google/android/gms/wallet/LoyaltyWalletObject;Landroid/os/Parcel;I)V

    return-void
.end method
