// Copyright 2024 Google LLC

package google.sdv.gateway.data_tunnel;

import android.hardware.common.NativeHandle;

/**
 * Contains all the required Data Tunnel client/agent connection
 * information including client id and read/write pipe handles.
 * The client_id value is used by DataTunnel Agent to distinguish
 * client instances while using communication pipe.
 */
@VintfStability
parcelable ClientDescriptor {
    /**
     * Used by DataTunnel Agent to distinguish client instances while using communication pipe.
     */
    int clientId;
    /**
     * Holds Client<->Agent communication pipe handle for reading. For use from the application's
     * process through the "libsdvgatewayclient" library.
     */
    ParcelFileDescriptor readPipeHandle;
    /**
     * Holds Client<->Agent communication pipe handle for writing. For use from the application's
     * process through the "libsdvgatewayclient" library.
     */
    ParcelFileDescriptor writePipeHandle;
}
