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

package google.sdv.data_tunnel;

/**
 * PoC version of publisher API for Data Tunnel service.
 *
 * Unstable until API council approval.
 */

import android.hardware.common.NativeHandle;

/**
 * Contains all the required Data Tunnel client/agent connection
 * information including client id and read/write pipe handles.
 * The client_id value is used by DataTunnel Agent to distinguish
 * libsdv_dt client instances while using communication pipe.
 */
@VintfStability
parcelable ClientDescriptor {
    /**
     * Used by DataTunnel Agent to distinguish libsdv_dt client
     * instances while using communication pipe.
     */
    int client_id;
    /**
     * Holds Client<->Agent communication pipe handle
     */
    NativeHandle comm_pipe_handle;
}
