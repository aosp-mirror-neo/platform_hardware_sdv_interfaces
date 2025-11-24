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

import google.sdv.identity.ServiceFqin;

/**
 * The identifiers of a service bundle instance.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable ServiceIdentity {
    /**
     * A 64-bit number that uniquely identifies a running service bundle instance, known as a
     * Service ID (SID).
     *
     * An SID is guaranteed to be unique vehicle-wide among all currently running service bundle
     * instances.
     */
    long sid;

    @RustDerive(Clone=true, PartialEq=true, Hash=true)
    parcelable EcPublicKey {
        byte[32] keyValue;
    }

    /* Unused */
    EcPublicKey publicKey;

    /* Fully Qualified Instance Name. */
    ServiceFqin name;
}
