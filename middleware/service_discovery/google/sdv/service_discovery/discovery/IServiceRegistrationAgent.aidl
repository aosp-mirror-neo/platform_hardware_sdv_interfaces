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

package google.sdv.service_discovery.discovery;

import google.sdv.service_discovery.common.AccessControl;
import google.sdv.service_discovery.common.RegistrationToken;
import google.sdv.service_discovery.common.UnitType;
import google.sdv.service_discovery.common.metadata.ApplicationMetadata;

@VintfStability
interface IServiceRegistrationAgent {
    /**
     * Registers a Service Unit hosted by the calling Service Bundle along with the provided
     * Unit Type, ACLs, and Metadata.
     *
     * Arguments provided for this registration:
     * 1. ServiceUnitName: The name used for identifying this Service Unit registration. This
     *    UnitName must be unique within the set of all Service Units registered by the same
     *    ServiceBundle.
     * 2. UnitType: The registered Service Unit is said to IMPLEMENT the provided UnitType.
     *    This UnitType can then be used by potential clients to discovert all Service Units
     *    registered with the same Unit Type.
     * 3. ACLs: The registered Service Unit is protected using the access control lists
     *    specified in the ACLs argument.
     * 4. AppMetadata: Metadata that is Service specific and is not known to ServiceManager.
     *
     * Unit Type Polymorphism: Multiple Service Units can be registered with the same
     * UnitType. The different Service Units can have their respective AccessControl and
     * Metadata values. The same Service Unit cannot be registered multiple times with
     * different Unit Types.
     *
     * TODO: specify the error cases and the errors that are returned.
     *
     * NOTE that the registered ServiceUnit is registered as a Server or a Publisher
     * depending on the case-type of the provided TypedMetadata.
     *
     * Returns a unique use-once token that can be used with RpcAgent or DataTunnelAgent
     * to create a Server or Publisher (respectively).
     */
    RegistrationToken registerServiceUnit(@utf8InCpp String serviceUnitName,
            in UnitType unitType, in AccessControl acls, in ApplicationMetadata appMetadata);

    /**
     * Unregisters the Service Unit hosted by the calling Service Bundle and identified by
     * the provided ServiceUnitName.
     *
     * TODO: specify the error cases and the errors that are returned.
     */
    void unregisterServiceUnit(@utf8InCpp String serviceUnitName);
}
