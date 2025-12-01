// Copyright 2024 Google LLC

package google.sdv.gateway;

import google.sdv.gateway.service_discovery.ServerUnitMetadata;
import google.sdv.gateway.service_discovery.UnitType;

/**
 * RegisterRpcServerParams contains the parameters needed to call SDV Gateway Session AIDL's
 * registerRpcServer API.
 *
 * TODO: b/360243025 - Applications should not need to pass the serverPackageName, the
 * serverPackageName should be deduced programmatically.
 */

@VintfStability
parcelable RegisterRpcServerParams {
    /** The service unit name of the RPC server to create. */
    @utf8InCpp String serviceUnitName;
    /** The unit type that the service will be implementing. */
    UnitType unitType;
    /** The port where SDV-SD and RpcAgent should listen for connections on. */
    int listeningPort;
    /**
     * The metadata of the application to be serviced by this RPC server, consisting on valueHolder
     * and a version.
     */
    ServerUnitMetadata serverUnitMetadata;
}
