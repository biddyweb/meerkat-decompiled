.class public Lcom/digits/sdk/android/ContactsUploadResult;
.super Ljava/lang/Object;
.source "ContactsUploadResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/digits/sdk/android/ContactsUploadResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final successCount:I

.field public final totalCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    new-instance v0, Lcom/digits/sdk/android/ContactsUploadResult$1;

    invoke-direct {v0}, Lcom/digits/sdk/android/ContactsUploadResult$1;-><init>()V

    sput-object v0, Lcom/digits/sdk/android/ContactsUploadResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(II)V
    .locals 0
    .param p1, "successCount"    # I
    .param p2, "totalCount"    # I

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/digits/sdk/android/ContactsUploadResult;->successCount:I

    .line 15
    iput p2, p0, Lcom/digits/sdk/android/ContactsUploadResult;->totalCount:I

    .line 16
    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/digits/sdk/android/ContactsUploadResult;->successCount:I

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/digits/sdk/android/ContactsUploadResult;->totalCount:I

    .line 21
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 30
    iget v0, p0, Lcom/digits/sdk/android/ContactsUploadResult;->successCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 31
    iget v0, p0, Lcom/digits/sdk/android/ContactsUploadResult;->totalCount:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 32
    return-void
.end method
