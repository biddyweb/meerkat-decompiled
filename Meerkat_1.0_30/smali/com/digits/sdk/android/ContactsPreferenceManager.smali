.class Lcom/digits/sdk/android/ContactsPreferenceManager;
.super Ljava/lang/Object;
.source "ContactsPreferenceManager.java"


# static fields
.field static final PREFKEY_CONTACTS_IMPORT_PERMISSION:Ljava/lang/String; = "CONTACTS_IMPORT_PERMISSION"

.field static final PREFKEY_CONTACTS_READ_TIMESTAMP:Ljava/lang/String; = "CONTACTS_READ_TIMESTAMP"

.field static final PREFKEY_CONTACTS_UPLOADED:Ljava/lang/String; = "CONTACTS_CONTACTS_UPLOADED"


# instance fields
.field private final prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    const-class v1, Lcom/digits/sdk/android/Digits;

    invoke-static {v1}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    iput-object v0, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    .line 18
    return-void
.end method


# virtual methods
.method protected clearContactImportPermissionGranted()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 32
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "CONTACTS_IMPORT_PERMISSION"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->save(Landroid/content/SharedPreferences$Editor;)Z

    .line 33
    return-void
.end method

.method protected hasContactImportPermissionGranted()Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->get()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "CONTACTS_IMPORT_PERMISSION"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected setContactImportPermissionGranted()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 27
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "CONTACTS_IMPORT_PERMISSION"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->save(Landroid/content/SharedPreferences$Editor;)Z

    .line 28
    return-void
.end method

.method protected setContactsReadTimestamp(J)V
    .locals 3
    .param p1, "timestamp"    # J
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "CONTACTS_READ_TIMESTAMP"

    invoke-interface {v1, v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->save(Landroid/content/SharedPreferences$Editor;)Z

    .line 38
    return-void
.end method

.method protected setContactsUploaded(I)V
    .locals 3
    .param p1, "count"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsPreferenceManager;->prefStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "CONTACTS_CONTACTS_UPLOADED"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->save(Landroid/content/SharedPreferences$Editor;)Z

    .line 43
    return-void
.end method
