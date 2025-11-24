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

package google.sdv.identity;

import google.sdv.identity.ProcessIdentifier;
import google.sdv.identity.ServiceFqin;
import google.sdv.identity.ServiceIdentity;

/** SDV Service Identity APIs. */
@VintfStability
interface IIdentityAgent {
    /** Create a new Identity for the Service given the arguments. */
    ServiceIdentity createIdentity(
            in ServiceIdentity.EcPublicKey publicKey, in ServiceFqin fqin, in IBinder linkToDeath);

    /** Verify that the provided ServiceIdentity value is valid. */
    boolean verifyIdentity(in ServiceIdentity identity);

    /** Find a ServiceIdentity given the unique ID. */
    @nullable ServiceIdentity findIdentityByUid(long sid);

    /** Find a ServiceIdentity given the Service FQIN. */
    @nullable ServiceIdentity findIdentityByName(in ServiceFqin name);

    /**
     * Find a ServiceIdentity given unique process identifier composed from OS-specific
     * identifiers.
     */
    @nullable ServiceIdentity findIdentityByProcess(
            in ProcessIdentifier process_identifier);
}
