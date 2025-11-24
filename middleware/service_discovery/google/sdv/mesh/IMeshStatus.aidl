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

package google.sdv.mesh;

import google.sdv.mesh.PeerConnectionStatus;

/**
 * Interface for obtaining data related SD Mesh status.
 */
@VintfStability
interface IMeshStatus {
    /**
     * Answers if SDV Mesh is complete from this VM's perspective
     *
     * It returns true if this VM is connected to all other VMs in
     * the vehicle as defined in vvmconfig and false otherwise.
     *
     * If all SDV VMs booted in LOCKED SDV Boot Mode report
     * isComplete() as true after factory provisioning or ECU
     * replacement, the operation is successful.
     *
     * See getPeersConnectionStatus() for detailed Mesh status
     * information.
     */
    boolean isComplete();

    /**
     * Returns list of objects that describe connection status of the peers.
     */
    List<PeerConnectionStatus> getPeersConnectionStatus();
}
