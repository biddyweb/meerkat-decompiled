.class Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;
.super Lcom/google/gson/TypeAdapter;
.source "SafeListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/models/SafeListAdapter;->create(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)Lcom/google/gson/TypeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/TypeAdapter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/models/SafeListAdapter;

.field final synthetic val$delegate:Lcom/google/gson/TypeAdapter;

.field final synthetic val$tokenType:Lcom/google/gson/reflect/TypeToken;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/models/SafeListAdapter;Lcom/google/gson/TypeAdapter;Lcom/google/gson/reflect/TypeToken;)V
    .locals 0

    .prologue
    .line 20
    iput-object p1, p0, Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;->this$0:Lcom/twitter/sdk/android/core/models/SafeListAdapter;

    iput-object p2, p0, Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;->val$delegate:Lcom/google/gson/TypeAdapter;

    iput-object p3, p0, Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;->val$tokenType:Lcom/google/gson/reflect/TypeToken;

    invoke-direct {p0}, Lcom/google/gson/TypeAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;
    .locals 4
    .param p1, "arg0"    # Lcom/google/gson/stream/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonReader;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 28
    iget-object v2, p0, Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;->val$delegate:Lcom/google/gson/TypeAdapter;

    invoke-virtual {v2, p1}, Lcom/google/gson/TypeAdapter;->read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;

    move-result-object v1

    .line 29
    .local v1, "t":Ljava/lang/Object;, "TT;"
    const-class v2, Ljava/util/List;

    iget-object v3, p0, Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;->val$tokenType:Lcom/google/gson/reflect/TypeToken;

    invoke-virtual {v3}, Lcom/google/gson/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 30
    if-nez v1, :cond_1

    .line 31
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 37
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_0
    :goto_0
    return-object v1

    .restart local v1    # "t":Ljava/lang/Object;, "TT;"
    :cond_1
    move-object v0, v1

    .line 34
    check-cast v0, Ljava/util/List;

    .line 35
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method

.method public write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 1
    .param p1, "out"    # Lcom/google/gson/stream/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonWriter;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    .local p2, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/twitter/sdk/android/core/models/SafeListAdapter$1;->val$delegate:Lcom/google/gson/TypeAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/google/gson/TypeAdapter;->write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V

    .line 24
    return-void
.end method
