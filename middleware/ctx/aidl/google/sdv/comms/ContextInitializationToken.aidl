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

package google.sdv.comms;

import google.sdv.data_tunnel.IAgentService;
import google.sdv.identity.ServiceIdentity;
import google.sdv.rpc.IRpcAgent;
import google.sdv.service_discovery.discovery.IServiceDiscoveryAgent;
import google.sdv.service_discovery.discovery.IServiceRegistrationAgent;

/**
 * The use-once Context initialisation value issued by LifecycleManager to Service Bundles that
 * enables them to create the SDV SDK Context object.
 */
@RustDerive(PartialEq=true)
@VintfStability
parcelable ContextInitializationToken {
    /** The registered ServiceIdentity for the Service Bundle. */
    ServiceIdentity identity;

    /** An initialised Binder connection to the Service Discovery Agent. */
    IServiceRegistrationAgent sr_agent;

    /** An initialised Binder connection to the Service Discovery Agent. */
    IServiceDiscoveryAgent sd_agent;

    /** An initialised Binder connection to the Data Tunnel Agent. */
    IAgentService dt_agent;

    /** An initialised Binder connection to the RPC Agent. */
    IRpcAgent rpc_agent;
}
