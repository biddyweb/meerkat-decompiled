package com.digits.sdk.android;

import android.annotation.SuppressLint;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.services.persistence.PreferenceStore;
import io.fabric.sdk.android.services.persistence.PreferenceStoreImpl;

class ContactsPreferenceManager
{
  static final String PREFKEY_CONTACTS_IMPORT_PERMISSION = "CONTACTS_IMPORT_PERMISSION";
  static final String PREFKEY_CONTACTS_READ_TIMESTAMP = "CONTACTS_READ_TIMESTAMP";
  static final String PREFKEY_CONTACTS_UPLOADED = "CONTACTS_CONTACTS_UPLOADED";
  private final PreferenceStore prefStore = new PreferenceStoreImpl(Fabric.getKit(Digits.class));

  @SuppressLint({"CommitPrefEdits"})
  protected void clearContactImportPermissionGranted()
  {
    this.prefStore.save(this.prefStore.edit().remove("CONTACTS_IMPORT_PERMISSION"));
  }

  @SuppressLint({"CommitPrefEdits"})
  protected boolean hasContactImportPermissionGranted()
  {
    return this.prefStore.get().getBoolean("CONTACTS_IMPORT_PERMISSION", false);
  }

  @SuppressLint({"CommitPrefEdits"})
  protected void setContactImportPermissionGranted()
  {
    this.prefStore.save(this.prefStore.edit().putBoolean("CONTACTS_IMPORT_PERMISSION", true));
  }

  @SuppressLint({"CommitPrefEdits"})
  protected void setContactsReadTimestamp(long paramLong)
  {
    this.prefStore.save(this.prefStore.edit().putLong("CONTACTS_READ_TIMESTAMP", paramLong));
  }

  @SuppressLint({"CommitPrefEdits"})
  protected void setContactsUploaded(int paramInt)
  {
    this.prefStore.save(this.prefStore.edit().putInt("CONTACTS_CONTACTS_UPLOADED", paramInt));
  }
}