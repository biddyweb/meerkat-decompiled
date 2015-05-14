package com.google.android.gms.drive.internal;

import android.content.IntentSender;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.drive.RealtimeDocumentSyncRequest;
import com.google.android.gms.drive.execution.internal.GetContentTransferInfoRequest;

public abstract interface zzag extends IInterface
{
  public abstract IntentSender zza(CreateFileIntentSenderRequest paramCreateFileIntentSenderRequest)
    throws RemoteException;

  public abstract IntentSender zza(OpenFileIntentSenderRequest paramOpenFileIntentSenderRequest)
    throws RemoteException;

  public abstract void zza(RealtimeDocumentSyncRequest paramRealtimeDocumentSyncRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(GetContentTransferInfoRequest paramGetContentTransferInfoRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(AddEventListenerRequest paramAddEventListenerRequest, zzai paramzzai, String paramString, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(AuthorizeAccessRequest paramAuthorizeAccessRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CancelPendingActionsRequest paramCancelPendingActionsRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CheckResourceIdsExistRequest paramCheckResourceIdsExistRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CloseContentsAndUpdateMetadataRequest paramCloseContentsAndUpdateMetadataRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CloseContentsRequest paramCloseContentsRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CreateContentsRequest paramCreateContentsRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CreateFileRequest paramCreateFileRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(CreateFolderRequest paramCreateFolderRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(DeleteResourceRequest paramDeleteResourceRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(DisconnectRequest paramDisconnectRequest)
    throws RemoteException;

  public abstract void zza(FetchThumbnailRequest paramFetchThumbnailRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(GetChangesRequest paramGetChangesRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(GetDriveIdFromUniqueIdentifierRequest paramGetDriveIdFromUniqueIdentifierRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(GetMetadataRequest paramGetMetadataRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(ListParentsRequest paramListParentsRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(LoadRealtimeRequest paramLoadRealtimeRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(OpenContentsRequest paramOpenContentsRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(QueryRequest paramQueryRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(QueryRequest paramQueryRequest, zzai paramzzai1, zzai paramzzai2, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(RemoveEventListenerRequest paramRemoveEventListenerRequest, zzai paramzzai, String paramString, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(SetDrivePreferencesRequest paramSetDrivePreferencesRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(SetFileUploadPreferencesRequest paramSetFileUploadPreferencesRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(SetResourceParentsRequest paramSetResourceParentsRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(TrashResourceRequest paramTrashResourceRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(UnsubscribeResourceRequest paramUnsubscribeResourceRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(UntrashResourceRequest paramUntrashResourceRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(UpdateMetadataRequest paramUpdateMetadataRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zza(zzah paramzzah)
    throws RemoteException;

  public abstract void zza(zzai paramzzai, zzah paramzzah)
    throws RemoteException;

  public abstract void zzb(QueryRequest paramQueryRequest, zzah paramzzah)
    throws RemoteException;

  public abstract void zzb(zzah paramzzah)
    throws RemoteException;

  public abstract void zzc(zzah paramzzah)
    throws RemoteException;

  public abstract void zzd(zzah paramzzah)
    throws RemoteException;

  public abstract void zze(zzah paramzzah)
    throws RemoteException;

  public abstract void zzf(zzah paramzzah)
    throws RemoteException;

  public abstract void zzg(zzah paramzzah)
    throws RemoteException;

  public abstract void zzh(zzah paramzzah)
    throws RemoteException;

  public abstract void zzi(zzah paramzzah)
    throws RemoteException;

  public abstract void zzj(zzah paramzzah)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzag
  {
    public static zzag zzac(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.drive.internal.IDriveService");
      if ((localIInterface != null) && ((localIInterface instanceof zzag)))
        return (zzag)localIInterface;
      return new zza(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.drive.internal.IDriveService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i28 = paramParcel1.readInt();
        GetMetadataRequest localGetMetadataRequest = null;
        if (i28 != 0)
          localGetMetadataRequest = (GetMetadataRequest)GetMetadataRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localGetMetadataRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i27 = paramParcel1.readInt();
        QueryRequest localQueryRequest3 = null;
        if (i27 != 0)
          localQueryRequest3 = (QueryRequest)QueryRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localQueryRequest3, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i26 = paramParcel1.readInt();
        UpdateMetadataRequest localUpdateMetadataRequest = null;
        if (i26 != 0)
          localUpdateMetadataRequest = (UpdateMetadataRequest)UpdateMetadataRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localUpdateMetadataRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i25 = paramParcel1.readInt();
        CreateContentsRequest localCreateContentsRequest = null;
        if (i25 != 0)
          localCreateContentsRequest = (CreateContentsRequest)CreateContentsRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCreateContentsRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i24 = paramParcel1.readInt();
        CreateFileRequest localCreateFileRequest = null;
        if (i24 != 0)
          localCreateFileRequest = (CreateFileRequest)CreateFileRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCreateFileRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i23 = paramParcel1.readInt();
        CreateFolderRequest localCreateFolderRequest = null;
        if (i23 != 0)
          localCreateFolderRequest = (CreateFolderRequest)CreateFolderRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCreateFolderRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i22 = paramParcel1.readInt();
        OpenContentsRequest localOpenContentsRequest = null;
        if (i22 != 0)
          localOpenContentsRequest = (OpenContentsRequest)OpenContentsRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localOpenContentsRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i21 = paramParcel1.readInt();
        CloseContentsRequest localCloseContentsRequest = null;
        if (i21 != 0)
          localCloseContentsRequest = (CloseContentsRequest)CloseContentsRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCloseContentsRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zza(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i20 = paramParcel1.readInt();
        OpenFileIntentSenderRequest localOpenFileIntentSenderRequest = null;
        if (i20 != 0)
          localOpenFileIntentSenderRequest = (OpenFileIntentSenderRequest)OpenFileIntentSenderRequest.CREATOR.createFromParcel(paramParcel1);
        IntentSender localIntentSender2 = zza(localOpenFileIntentSenderRequest);
        paramParcel2.writeNoException();
        if (localIntentSender2 != null)
        {
          paramParcel2.writeInt(1);
          localIntentSender2.writeToParcel(paramParcel2, 1);
        }
        while (true)
        {
          return true;
          paramParcel2.writeInt(0);
        }
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i19 = paramParcel1.readInt();
        CreateFileIntentSenderRequest localCreateFileIntentSenderRequest = null;
        if (i19 != 0)
          localCreateFileIntentSenderRequest = (CreateFileIntentSenderRequest)CreateFileIntentSenderRequest.CREATOR.createFromParcel(paramParcel1);
        IntentSender localIntentSender1 = zza(localCreateFileIntentSenderRequest);
        paramParcel2.writeNoException();
        if (localIntentSender1 != null)
        {
          paramParcel2.writeInt(1);
          localIntentSender1.writeToParcel(paramParcel2, 1);
        }
        while (true)
        {
          return true;
          paramParcel2.writeInt(0);
        }
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i18 = paramParcel1.readInt();
        AuthorizeAccessRequest localAuthorizeAccessRequest = null;
        if (i18 != 0)
          localAuthorizeAccessRequest = (AuthorizeAccessRequest)AuthorizeAccessRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localAuthorizeAccessRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i17 = paramParcel1.readInt();
        ListParentsRequest localListParentsRequest = null;
        if (i17 != 0)
          localListParentsRequest = (ListParentsRequest)ListParentsRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localListParentsRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i16 = paramParcel1.readInt();
        AddEventListenerRequest localAddEventListenerRequest = null;
        if (i16 != 0)
          localAddEventListenerRequest = (AddEventListenerRequest)AddEventListenerRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localAddEventListenerRequest, zzai.zza.zzae(paramParcel1.readStrongBinder()), paramParcel1.readString(), zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 15:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i15 = paramParcel1.readInt();
        RemoveEventListenerRequest localRemoveEventListenerRequest = null;
        if (i15 != 0)
          localRemoveEventListenerRequest = (RemoveEventListenerRequest)RemoveEventListenerRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localRemoveEventListenerRequest, zzai.zza.zzae(paramParcel1.readStrongBinder()), paramParcel1.readString(), zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i14 = paramParcel1.readInt();
        DisconnectRequest localDisconnectRequest = null;
        if (i14 != 0)
          localDisconnectRequest = (DisconnectRequest)DisconnectRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localDisconnectRequest);
        paramParcel2.writeNoException();
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i13 = paramParcel1.readInt();
        TrashResourceRequest localTrashResourceRequest = null;
        if (i13 != 0)
          localTrashResourceRequest = (TrashResourceRequest)TrashResourceRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localTrashResourceRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i12 = paramParcel1.readInt();
        CloseContentsAndUpdateMetadataRequest localCloseContentsAndUpdateMetadataRequest = null;
        if (i12 != 0)
          localCloseContentsAndUpdateMetadataRequest = (CloseContentsAndUpdateMetadataRequest)CloseContentsAndUpdateMetadataRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCloseContentsAndUpdateMetadataRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 19:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i11 = paramParcel1.readInt();
        QueryRequest localQueryRequest2 = null;
        if (i11 != 0)
          localQueryRequest2 = (QueryRequest)QueryRequest.CREATOR.createFromParcel(paramParcel1);
        zzb(localQueryRequest2, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 20:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzb(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 21:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzc(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 22:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzd(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 23:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zze(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 24:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i10 = paramParcel1.readInt();
        DeleteResourceRequest localDeleteResourceRequest = null;
        if (i10 != 0)
          localDeleteResourceRequest = (DeleteResourceRequest)DeleteResourceRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localDeleteResourceRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 27:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i9 = paramParcel1.readInt();
        LoadRealtimeRequest localLoadRealtimeRequest = null;
        if (i9 != 0)
          localLoadRealtimeRequest = (LoadRealtimeRequest)LoadRealtimeRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localLoadRealtimeRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 28:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i8 = paramParcel1.readInt();
        SetResourceParentsRequest localSetResourceParentsRequest = null;
        if (i8 != 0)
          localSetResourceParentsRequest = (SetResourceParentsRequest)SetResourceParentsRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localSetResourceParentsRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 29:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i7 = paramParcel1.readInt();
        GetDriveIdFromUniqueIdentifierRequest localGetDriveIdFromUniqueIdentifierRequest = null;
        if (i7 != 0)
          localGetDriveIdFromUniqueIdentifierRequest = (GetDriveIdFromUniqueIdentifierRequest)GetDriveIdFromUniqueIdentifierRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localGetDriveIdFromUniqueIdentifierRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 30:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i6 = paramParcel1.readInt();
        CheckResourceIdsExistRequest localCheckResourceIdsExistRequest = null;
        if (i6 != 0)
          localCheckResourceIdsExistRequest = (CheckResourceIdsExistRequest)CheckResourceIdsExistRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCheckResourceIdsExistRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 31:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzf(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 32:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzg(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 33:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i5 = paramParcel1.readInt();
        SetDrivePreferencesRequest localSetDrivePreferencesRequest = null;
        if (i5 != 0)
          localSetDrivePreferencesRequest = (SetDrivePreferencesRequest)SetDrivePreferencesRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localSetDrivePreferencesRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 34:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i4 = paramParcel1.readInt();
        RealtimeDocumentSyncRequest localRealtimeDocumentSyncRequest = null;
        if (i4 != 0)
          localRealtimeDocumentSyncRequest = (RealtimeDocumentSyncRequest)RealtimeDocumentSyncRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localRealtimeDocumentSyncRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 35:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzh(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 36:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i3 = paramParcel1.readInt();
        SetFileUploadPreferencesRequest localSetFileUploadPreferencesRequest = null;
        if (i3 != 0)
          localSetFileUploadPreferencesRequest = (SetFileUploadPreferencesRequest)SetFileUploadPreferencesRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localSetFileUploadPreferencesRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 37:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i2 = paramParcel1.readInt();
        CancelPendingActionsRequest localCancelPendingActionsRequest = null;
        if (i2 != 0)
          localCancelPendingActionsRequest = (CancelPendingActionsRequest)CancelPendingActionsRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localCancelPendingActionsRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 38:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int i1 = paramParcel1.readInt();
        UntrashResourceRequest localUntrashResourceRequest = null;
        if (i1 != 0)
          localUntrashResourceRequest = (UntrashResourceRequest)UntrashResourceRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localUntrashResourceRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 39:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int n = paramParcel1.readInt();
        QueryRequest localQueryRequest1 = null;
        if (n != 0)
          localQueryRequest1 = (QueryRequest)QueryRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localQueryRequest1, zzai.zza.zzae(paramParcel1.readStrongBinder()), zzai.zza.zzae(paramParcel1.readStrongBinder()), zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 40:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zza(zzai.zza.zzae(paramParcel1.readStrongBinder()), zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 41:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzi(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 42:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int m = paramParcel1.readInt();
        FetchThumbnailRequest localFetchThumbnailRequest = null;
        if (m != 0)
          localFetchThumbnailRequest = (FetchThumbnailRequest)FetchThumbnailRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localFetchThumbnailRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 43:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        zzj(zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 44:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int k = paramParcel1.readInt();
        GetChangesRequest localGetChangesRequest = null;
        if (k != 0)
          localGetChangesRequest = (GetChangesRequest)GetChangesRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localGetChangesRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 45:
        paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
        int j = paramParcel1.readInt();
        GetContentTransferInfoRequest localGetContentTransferInfoRequest = null;
        if (j != 0)
          localGetContentTransferInfoRequest = (GetContentTransferInfoRequest)GetContentTransferInfoRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localGetContentTransferInfoRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 46:
      }
      paramParcel1.enforceInterface("com.google.android.gms.drive.internal.IDriveService");
      int i = paramParcel1.readInt();
      UnsubscribeResourceRequest localUnsubscribeResourceRequest = null;
      if (i != 0)
        localUnsubscribeResourceRequest = (UnsubscribeResourceRequest)UnsubscribeResourceRequest.CREATOR.createFromParcel(paramParcel1);
      zza(localUnsubscribeResourceRequest, zzah.zza.zzad(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzag
    {
      private IBinder zzle;

      zza(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public IntentSender zza(CreateFileIntentSenderRequest paramCreateFileIntentSenderRequest)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCreateFileIntentSenderRequest != null)
            {
              localParcel1.writeInt(1);
              paramCreateFileIntentSenderRequest.writeToParcel(localParcel1, 0);
              this.zzle.transact(11, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntentSender = (IntentSender)IntentSender.CREATOR.createFromParcel(localParcel2);
                return localIntentSender;
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IntentSender localIntentSender = null;
        }
      }

      public IntentSender zza(OpenFileIntentSenderRequest paramOpenFileIntentSenderRequest)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramOpenFileIntentSenderRequest != null)
            {
              localParcel1.writeInt(1);
              paramOpenFileIntentSenderRequest.writeToParcel(localParcel1, 0);
              this.zzle.transact(10, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntentSender = (IntentSender)IntentSender.CREATOR.createFromParcel(localParcel2);
                return localIntentSender;
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IntentSender localIntentSender = null;
        }
      }

      public void zza(RealtimeDocumentSyncRequest paramRealtimeDocumentSyncRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramRealtimeDocumentSyncRequest != null)
            {
              localParcel1.writeInt(1);
              paramRealtimeDocumentSyncRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(34, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(GetContentTransferInfoRequest paramGetContentTransferInfoRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramGetContentTransferInfoRequest != null)
            {
              localParcel1.writeInt(1);
              paramGetContentTransferInfoRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(45, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(AddEventListenerRequest paramAddEventListenerRequest, zzai paramzzai, String paramString, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramAddEventListenerRequest != null)
            {
              localParcel1.writeInt(1);
              paramAddEventListenerRequest.writeToParcel(localParcel1, 0);
              if (paramzzai != null)
              {
                localIBinder1 = paramzzai.asBinder();
                localParcel1.writeStrongBinder(localIBinder1);
                localParcel1.writeString(paramString);
                IBinder localIBinder2 = null;
                if (paramzzah != null)
                  localIBinder2 = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder2);
                this.zzle.transact(14, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder1 = null;
        }
      }

      public void zza(AuthorizeAccessRequest paramAuthorizeAccessRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramAuthorizeAccessRequest != null)
            {
              localParcel1.writeInt(1);
              paramAuthorizeAccessRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(12, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CancelPendingActionsRequest paramCancelPendingActionsRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCancelPendingActionsRequest != null)
            {
              localParcel1.writeInt(1);
              paramCancelPendingActionsRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(37, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CheckResourceIdsExistRequest paramCheckResourceIdsExistRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCheckResourceIdsExistRequest != null)
            {
              localParcel1.writeInt(1);
              paramCheckResourceIdsExistRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(30, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CloseContentsAndUpdateMetadataRequest paramCloseContentsAndUpdateMetadataRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCloseContentsAndUpdateMetadataRequest != null)
            {
              localParcel1.writeInt(1);
              paramCloseContentsAndUpdateMetadataRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(18, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CloseContentsRequest paramCloseContentsRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCloseContentsRequest != null)
            {
              localParcel1.writeInt(1);
              paramCloseContentsRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(8, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CreateContentsRequest paramCreateContentsRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCreateContentsRequest != null)
            {
              localParcel1.writeInt(1);
              paramCreateContentsRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(4, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CreateFileRequest paramCreateFileRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCreateFileRequest != null)
            {
              localParcel1.writeInt(1);
              paramCreateFileRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(5, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(CreateFolderRequest paramCreateFolderRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramCreateFolderRequest != null)
            {
              localParcel1.writeInt(1);
              paramCreateFolderRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(6, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(DeleteResourceRequest paramDeleteResourceRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramDeleteResourceRequest != null)
            {
              localParcel1.writeInt(1);
              paramDeleteResourceRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(24, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(DisconnectRequest paramDisconnectRequest)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramDisconnectRequest != null)
          {
            localParcel1.writeInt(1);
            paramDisconnectRequest.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(16, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(FetchThumbnailRequest paramFetchThumbnailRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramFetchThumbnailRequest != null)
            {
              localParcel1.writeInt(1);
              paramFetchThumbnailRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(42, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(GetChangesRequest paramGetChangesRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramGetChangesRequest != null)
            {
              localParcel1.writeInt(1);
              paramGetChangesRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(44, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(GetDriveIdFromUniqueIdentifierRequest paramGetDriveIdFromUniqueIdentifierRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramGetDriveIdFromUniqueIdentifierRequest != null)
            {
              localParcel1.writeInt(1);
              paramGetDriveIdFromUniqueIdentifierRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(29, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(GetMetadataRequest paramGetMetadataRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramGetMetadataRequest != null)
            {
              localParcel1.writeInt(1);
              paramGetMetadataRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(ListParentsRequest paramListParentsRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramListParentsRequest != null)
            {
              localParcel1.writeInt(1);
              paramListParentsRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(13, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(LoadRealtimeRequest paramLoadRealtimeRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramLoadRealtimeRequest != null)
            {
              localParcel1.writeInt(1);
              paramLoadRealtimeRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(27, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(OpenContentsRequest paramOpenContentsRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramOpenContentsRequest != null)
            {
              localParcel1.writeInt(1);
              paramOpenContentsRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(7, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(QueryRequest paramQueryRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramQueryRequest != null)
            {
              localParcel1.writeInt(1);
              paramQueryRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(2, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(QueryRequest paramQueryRequest, zzai paramzzai1, zzai paramzzai2, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramQueryRequest != null)
            {
              localParcel1.writeInt(1);
              paramQueryRequest.writeToParcel(localParcel1, 0);
              if (paramzzai1 != null)
              {
                localIBinder1 = paramzzai1.asBinder();
                localParcel1.writeStrongBinder(localIBinder1);
                if (paramzzai2 == null)
                  break label159;
                localIBinder2 = paramzzai2.asBinder();
                localParcel1.writeStrongBinder(localIBinder2);
                IBinder localIBinder3 = null;
                if (paramzzah != null)
                  localIBinder3 = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder3);
                this.zzle.transact(39, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder1 = null;
          continue;
          label159: IBinder localIBinder2 = null;
        }
      }

      public void zza(RemoveEventListenerRequest paramRemoveEventListenerRequest, zzai paramzzai, String paramString, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramRemoveEventListenerRequest != null)
            {
              localParcel1.writeInt(1);
              paramRemoveEventListenerRequest.writeToParcel(localParcel1, 0);
              if (paramzzai != null)
              {
                localIBinder1 = paramzzai.asBinder();
                localParcel1.writeStrongBinder(localIBinder1);
                localParcel1.writeString(paramString);
                IBinder localIBinder2 = null;
                if (paramzzah != null)
                  localIBinder2 = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder2);
                this.zzle.transact(15, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder1 = null;
        }
      }

      public void zza(SetDrivePreferencesRequest paramSetDrivePreferencesRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramSetDrivePreferencesRequest != null)
            {
              localParcel1.writeInt(1);
              paramSetDrivePreferencesRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(33, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(SetFileUploadPreferencesRequest paramSetFileUploadPreferencesRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramSetFileUploadPreferencesRequest != null)
            {
              localParcel1.writeInt(1);
              paramSetFileUploadPreferencesRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(36, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(SetResourceParentsRequest paramSetResourceParentsRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramSetResourceParentsRequest != null)
            {
              localParcel1.writeInt(1);
              paramSetResourceParentsRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(28, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(TrashResourceRequest paramTrashResourceRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramTrashResourceRequest != null)
            {
              localParcel1.writeInt(1);
              paramTrashResourceRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(17, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(UnsubscribeResourceRequest paramUnsubscribeResourceRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramUnsubscribeResourceRequest != null)
            {
              localParcel1.writeInt(1);
              paramUnsubscribeResourceRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(46, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(UntrashResourceRequest paramUntrashResourceRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramUntrashResourceRequest != null)
            {
              localParcel1.writeInt(1);
              paramUntrashResourceRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(38, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(UpdateMetadataRequest paramUpdateMetadataRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramUpdateMetadataRequest != null)
            {
              localParcel1.writeInt(1);
              paramUpdateMetadataRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(3, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zza(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(9, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzai paramzzai, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzai != null);
          for (IBinder localIBinder1 = paramzzai.asBinder(); ; localIBinder1 = null)
          {
            localParcel1.writeStrongBinder(localIBinder1);
            IBinder localIBinder2 = null;
            if (paramzzah != null)
              localIBinder2 = paramzzah.asBinder();
            localParcel1.writeStrongBinder(localIBinder2);
            this.zzle.transact(40, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(QueryRequest paramQueryRequest, zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
            if (paramQueryRequest != null)
            {
              localParcel1.writeInt(1);
              paramQueryRequest.writeToParcel(localParcel1, 0);
              if (paramzzah != null)
              {
                localIBinder = paramzzah.asBinder();
                localParcel1.writeStrongBinder(localIBinder);
                this.zzle.transact(19, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          IBinder localIBinder = null;
        }
      }

      public void zzb(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(20, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(21, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(22, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(23, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(31, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(32, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzh(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(35, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzi(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(41, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzj(zzah paramzzah)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.drive.internal.IDriveService");
          if (paramzzah != null);
          for (IBinder localIBinder = paramzzah.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(43, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}