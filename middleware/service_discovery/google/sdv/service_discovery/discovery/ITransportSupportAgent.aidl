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

import google.sdv.identity.ServiceIdentity;
import google.sdv.service_discovery.common.RegistrationToken;
import google.sdv.service_discovery.common.metadata.TransportMetadata;
import google.sdv.service_discovery.discovery.ServiceUnitDefinition;

/**
 * SDV Service Discovery APIs for Transport Agents.
 *
 * Transport Agents coordinate with Service discovery to complete Service Unit registration. When
 * ServiceDiscovery's registerServiceUnit public API is called, a temporary use-once registration
 * token is issued which is used by TarnsportAgent to complete the registration. At this time,
 * Transport Agents write some agent specific TransportMetadata with the registration entry.
 * Correspondingly, when clients discover Service Units, TransportAgent can request the stored
 * TransportMetadata by using the Service Bundle SID and UnitName of the registration.
 */
@VintfStability
interface ITransportSupportAgent {
    const long MAX_AGENT_METADATA_SIZE = 1024;

    /**
     * Checks the provided token for validity, and fetches the associated ServiceUnitDefinition.
     *
     * The ServiceUnitDefinition is guaranteed to exist if the token is valid. This token was
     * originally generated and issued by ServiceRegistrationAgent after a successful
     * registerService call.
     *
     * @throws exception with the error code set to:
     *         {@code ExceptionCode::ILLEGAL_ARGUMENT} if the token is not valid.
     */
    ServiceUnitDefinition getServiceUnitForToken(in RegistrationToken token);

    /**
     * Set the agent specific TransportMetadata for the Service Unit to which the provided
     * RegistrationToken was issued.
     *
     * @throws exception with the error code set to:
     *         {@code ExceptionCode::ILLEGAL_ARGUMENT} if the token is not valid.
     */
    void setAgentMetadata(in RegistrationToken token, in TransportMetadata agentMetadata);

    /**
     * Get the agent specific TransportMetadata for the given Service Unit.

     * The TransportMetadata returned is for the Service Unit identified by the {@code unitName}
     * and published by the Service Bundle identified by the {@code sid}.
     */
    void getAgentMetadata(in long sid, @utf8InCpp String unitName,
            out ServiceUnitDefinition sud, out TransportMetadata agentMetadata);
}
