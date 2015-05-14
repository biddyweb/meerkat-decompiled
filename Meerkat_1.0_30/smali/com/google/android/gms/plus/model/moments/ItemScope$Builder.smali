.class public Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/plus/model/moments/ItemScope;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mName:Ljava/lang/String;

.field private zzFA:Ljava/lang/String;

.field private zzZO:Ljava/lang/String;

.field private zzalQ:D

.field private zzalR:D

.field private final zzauX:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private zzauY:Lcom/google/android/gms/internal/zztr;

.field private zzauZ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private zzavA:Ljava/lang/String;

.field private zzavB:Lcom/google/android/gms/internal/zztr;

.field private zzavC:Lcom/google/android/gms/internal/zztr;

.field private zzavD:Lcom/google/android/gms/internal/zztr;

.field private zzavE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zztr;",
            ">;"
        }
    .end annotation
.end field

.field private zzavF:Ljava/lang/String;

.field private zzavG:Ljava/lang/String;

.field private zzavH:Ljava/lang/String;

.field private zzavI:Ljava/lang/String;

.field private zzavJ:Lcom/google/android/gms/internal/zztr;

.field private zzavK:Ljava/lang/String;

.field private zzavL:Ljava/lang/String;

.field private zzavM:Ljava/lang/String;

.field private zzavN:Lcom/google/android/gms/internal/zztr;

.field private zzavO:Ljava/lang/String;

.field private zzavP:Ljava/lang/String;

.field private zzavQ:Ljava/lang/String;

.field private zzavR:Ljava/lang/String;

.field private zzava:Lcom/google/android/gms/internal/zztr;

.field private zzavb:Ljava/lang/String;

.field private zzavc:Ljava/lang/String;

.field private zzavd:Ljava/lang/String;

.field private zzave:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zztr;",
            ">;"
        }
    .end annotation
.end field

.field private zzavf:I

.field private zzavg:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zztr;",
            ">;"
        }
    .end annotation
.end field

.field private zzavh:Lcom/google/android/gms/internal/zztr;

.field private zzavi:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zztr;",
            ">;"
        }
    .end annotation
.end field

.field private zzavj:Ljava/lang/String;

.field private zzavk:Ljava/lang/String;

.field private zzavl:Lcom/google/android/gms/internal/zztr;

.field private zzavm:Ljava/lang/String;

.field private zzavn:Ljava/lang/String;

.field private zzavo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zztr;",
            ">;"
        }
    .end annotation
.end field

.field private zzavp:Ljava/lang/String;

.field private zzavq:Ljava/lang/String;

.field private zzavr:Ljava/lang/String;

.field private zzavs:Ljava/lang/String;

.field private zzavt:Ljava/lang/String;

.field private zzavu:Ljava/lang/String;

.field private zzavv:Ljava/lang/String;

.field private zzavw:Ljava/lang/String;

.field private zzavx:Lcom/google/android/gms/internal/zztr;

.field private zzavy:Ljava/lang/String;

.field private zzavz:Ljava/lang/String;

.field private zzpn:Ljava/lang/String;

.field private zzxV:Ljava/lang/String;

.field private zzxX:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/plus/model/moments/ItemScope;
    .locals 60

    new-instance v2, Lcom/google/android/gms/internal/zztr;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauY:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauZ:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzava:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavb:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavc:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavd:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzave:Ljava/util/List;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavf:I

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavg:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavh:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavi:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavj:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavk:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavl:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavm:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavn:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzpn:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavo:Ljava/util/List;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavp:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavq:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavr:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzZO:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavs:Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavt:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavu:Ljava/lang/String;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavv:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavw:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavx:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavy:Ljava/lang/String;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavz:Ljava/lang/String;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzFA:Ljava/lang/String;

    move-object/from16 v34, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavA:Ljava/lang/String;

    move-object/from16 v35, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavB:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzalQ:D

    move-wide/from16 v37, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavC:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v39, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzalR:D

    move-wide/from16 v40, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->mName:Ljava/lang/String;

    move-object/from16 v42, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavD:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v43, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavE:Ljava/util/List;

    move-object/from16 v44, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavF:Ljava/lang/String;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavG:Ljava/lang/String;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavH:Ljava/lang/String;

    move-object/from16 v47, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavI:Ljava/lang/String;

    move-object/from16 v48, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavJ:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v49, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavK:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavL:Ljava/lang/String;

    move-object/from16 v51, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavM:Ljava/lang/String;

    move-object/from16 v52, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavN:Lcom/google/android/gms/internal/zztr;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavO:Ljava/lang/String;

    move-object/from16 v54, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavP:Ljava/lang/String;

    move-object/from16 v55, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzxV:Ljava/lang/String;

    move-object/from16 v56, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzxX:Ljava/lang/String;

    move-object/from16 v57, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavQ:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavR:Ljava/lang/String;

    move-object/from16 v59, v0

    invoke-direct/range {v2 .. v59}, Lcom/google/android/gms/internal/zztr;-><init>(Ljava/util/Set;Lcom/google/android/gms/internal/zztr;Ljava/util/List;Lcom/google/android/gms/internal/zztr;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lcom/google/android/gms/internal/zztr;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zztr;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zztr;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zztr;DLcom/google/android/gms/internal/zztr;DLjava/lang/String;Lcom/google/android/gms/internal/zztr;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zztr;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zztr;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method public setAbout(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "about"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "about":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauY:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAdditionalName(Ljava/util/List;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "additionalName":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauZ:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAddress(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "address"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "address":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzava:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAddressCountry(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "addressCountry"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavb:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAddressLocality(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "addressLocality"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavc:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAddressRegion(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "addressRegion"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavd:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAssociated_media(Ljava/util/List;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;)",
            "Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "associated_media":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/plus/model/moments/ItemScope;>;"
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzave:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAttendeeCount(I)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "attendeeCount"    # I

    .prologue
    iput p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavf:I

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAttendees(Ljava/util/List;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;)",
            "Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "attendees":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/plus/model/moments/ItemScope;>;"
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavg:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAudio(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "audio"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "audio":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavh:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setAuthor(Ljava/util/List;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;)",
            "Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "author":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/plus/model/moments/ItemScope;>;"
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavi:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setBestRating(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "bestRating"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavj:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setBirthDate(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "birthDate"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavk:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setByArtist(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "byArtist"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "byArtist":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavl:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setCaption(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "caption"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavm:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setContentSize(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "contentSize"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavn:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setContentUrl(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "contentUrl"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzpn:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setContributor(Ljava/util/List;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;)",
            "Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "contributor":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/plus/model/moments/ItemScope;>;"
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavo:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setDateCreated(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "dateCreated"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavp:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setDateModified(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "dateModified"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavq:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setDatePublished(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "datePublished"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavr:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setDescription(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzZO:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setDuration(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "duration"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavs:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setEmbedUrl(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "embedUrl"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavt:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setEndDate(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "endDate"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavu:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setFamilyName(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "familyName"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavv:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setGender(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "gender"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavw:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setGeo(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "geo"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "geo":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavx:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setGivenName(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "givenName"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavy:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x1e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setHeight(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "height"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavz:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzFA:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setImage(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "image"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavA:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x21

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setInAlbum(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "inAlbum"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "inAlbum":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavB:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x22

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setLatitude(D)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 3
    .param p1, "latitude"    # D

    .prologue
    iput-wide p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzalQ:D

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setLocation(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "location"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "location":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavC:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x25

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setLongitude(D)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 3
    .param p1, "longitude"    # D

    .prologue
    iput-wide p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzalR:D

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x26

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->mName:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x27

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setPartOfTVSeries(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "partOfTVSeries"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "partOfTVSeries":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavD:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setPerformers(Ljava/util/List;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/plus/model/moments/ItemScope;",
            ">;)",
            "Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "performers":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/gms/plus/model/moments/ItemScope;>;"
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavE:Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x29

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setPlayerType(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "playerType"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavF:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x2a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setPostOfficeBoxNumber(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "postOfficeBoxNumber"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavG:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x2b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setPostalCode(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "postalCode"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavH:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x2c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setRatingValue(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "ratingValue"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavI:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x2d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setReviewRating(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "reviewRating"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "reviewRating":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavJ:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x2e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setStartDate(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "startDate"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavK:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x2f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setStreetAddress(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "streetAddress"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavL:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x30

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavM:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x31

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setThumbnail(Lcom/google/android/gms/plus/model/moments/ItemScope;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "thumbnail"    # Lcom/google/android/gms/plus/model/moments/ItemScope;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zztr;

    .end local p1    # "thumbnail":Lcom/google/android/gms/plus/model/moments/ItemScope;
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavN:Lcom/google/android/gms/internal/zztr;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x32

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setThumbnailUrl(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "thumbnailUrl"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavO:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x33

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setTickerSymbol(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "tickerSymbol"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavP:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x34

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzxV:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x35

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzxX:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x36

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setWidth(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "width"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavQ:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x37

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public setWorstRating(Ljava/lang/String;)Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;
    .locals 2
    .param p1, "worstRating"    # Ljava/lang/String;

    .prologue
    iput-object p1, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzavR:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/plus/model/moments/ItemScope$Builder;->zzauX:Ljava/util/Set;

    const/16 v1, 0x38

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p0
.end method
