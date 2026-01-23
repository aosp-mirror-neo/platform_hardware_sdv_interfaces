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
