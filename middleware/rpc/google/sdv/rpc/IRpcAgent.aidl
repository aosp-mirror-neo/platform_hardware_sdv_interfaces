// Copyright 2023 Google LLC

package google.sdv.rpc;

import android.os.ParcelFileDescriptor;
import google.sdv.service_discovery.common.RegistrationToken;

/**
 * SDV RpcAgent APIs.
 */
@VintfStability
interface IRpcAgent {
    /**
     * Enables the service of the corresponding token in service discovery
     * and returns a socket that must be listened by the RPC server of the service.
     */
    ParcelFileDescriptor registerServer(
            in google.sdv.service_discovery.common.RegistrationToken token);
    /**
     * Enables the service of the corresponding token in service discovery
     * and associates with it the provided port.
     */
    void registerServerPort(
            in google.sdv.service_discovery.common.RegistrationToken token, int port);

    /**
     * Returns the file descriptor of the socket that is connected to the desired
     * RPC server.
     */
    ParcelFileDescriptor getFdConnection(in long sid, @utf8InCpp String unitName);

    /**
     * Returns the address of the desired RPC server.
     */
    @utf8InCpp String getAddressConnection(in long sid, @utf8InCpp String unitName);

    /**
     * Returns the name of the configured network interface that RpcAgent binds to
     * or error if the network interface name is empty.
     */
    @utf8InCpp String getNetworkInterfaceName();
}
