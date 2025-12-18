//
// Copyright (C) 2026 The Android Open Source Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

package google.sdv.gateway;

import google.sdv.gateway.service_discovery.ServerUnitMetadata;
import google.sdv.gateway.service_discovery.UnitType;

/**
 * RegisterRpcServerParams contains the parameters needed to call SDV Gateway Session AIDL's
 * registerRpcServer API.
 *
 * TODO: b/360243025 - Applications should not need to pass the serverPackageName, the
 * serverPackageName should be deduced programmatically.
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
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
