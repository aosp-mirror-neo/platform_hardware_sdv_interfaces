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

package google.sdv.privileged.identity;

import google.sdv.identity.ProcessIdentifier;
import google.sdv.identity.ServiceFqin;
import google.sdv.identity.ServiceIdentity;

/**
 * NOTE: Only the SDV Gateway service is allowed to use this interface.
 */
@VintfStability
interface IPrivilegedIdentityAgent {
    /**
     * Create a new Identity for the Service given the arguments.
     *
     * Has the same behavior as {@link google.sdv.identity.IIdentityAgent.createIdentity} but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    ServiceIdentity createIdentityForProcess(in ServiceIdentity.EcPublicKey publicKey,
            in ServiceFqin fqin, in IBinder linkToDeath, in ProcessIdentifier process_identifier);
}
