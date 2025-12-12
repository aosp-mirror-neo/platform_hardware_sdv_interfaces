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

@VintfStability
interface IWriteCallback {
    @Backing(type="int")
    enum ErrorCode {
        /**
         * System is already performing uds_pubs provisioning upon request of another
         * client.
         */
        BUSY,

        /**
         * An IO error has occurred while attempting to write the uds_pubs file.
         *
         * Examples: A read-only vvmtruststore partition. Permission denied to create
         * the uds_pubs file.
         */
        IO,

        /**
         * An unrecoverable internal error.
         *
         * Examples: failing to serialize into CBOR, failing to compute a SHA-256.
         */
        INTERNAL,
    }

    /**
     * This callback is called when the uds_pubs is successfully written into the
     * vvmtruststore partition.
     *
     * @param vvmFactoryTrust The SHA-256 of uds_pubs, to be used as the
     *      VVMFactoryTrust matching this file.
     */
    oneway void onSuccess(in byte[] vvmFactoryTrust);

    /**
     * This callback is called when the operation to write the uds_pubs file
     * fails.
     */
    oneway void onFailure(in ErrorCode errorCode);
}
