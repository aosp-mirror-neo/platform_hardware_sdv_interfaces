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

package google.sdv.mesh.provisioning;

import google.sdv.mesh.provisioning.IWriteCallback;

/**
 * Interface for the provisioning of the /vvmtruststore/uds_pubs file.
 *
 * It's only available when the SDV Boot Mode is UNLOCKED.
 */
@VintfStability
interface IUdsPubsProvisioner {
    /**
     * Initiates the writing of the uds_pubs file corresponding to the current
     * mesh members of a complete mesh.
     *
     * The operation is started only once the mesh is complete.
     *
     * This method returns immediately. The given listener will be notified once
     * the write operation concludes. The caller can drop the listener safely if
     * the operation is taking too long. Dropping the listener before the
     * operation has been started will cancel it.
     *
     * Only a single call, from any client, can be outstanding at anytime.
     */
    void writeUdsPubs(in IWriteCallback listener);
}
