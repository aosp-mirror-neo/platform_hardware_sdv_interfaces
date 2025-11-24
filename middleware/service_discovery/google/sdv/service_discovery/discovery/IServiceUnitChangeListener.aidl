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

import google.sdv.service_discovery.discovery.ServiceUnitDefinition;

/**
 * SDV Service Discovery Listener APIs.
 *
 * This interface describes callbacks which will be executed by the Service Discovery
 * when monitored service units are registered/unregistered/changed.
 */
@VintfStability
oneway interface IServiceUnitChangeListener {
    /**
     * Called by Service Discovery to provide notifications on registration of a new service unit.
     *
     * @param definition ServiceUnitDefinition, identifying the new registered service unit.
     */
    void onServiceUnitRegistered(in ServiceUnitDefinition definition);

    /**
     * Called by Service Discovery to provide notifications on unregistration of a service unit.
     *
     * @param definition ServiceUnitDefinition, identifying the unregistered service unit.
     */
    void onServiceUnitUnregistered(in ServiceUnitDefinition definition);

    /**
     * Called by Service Discovery to provide notifications on a change of a service unit.
     *
     * @param definition ServiceUnitDefinition, identifying the changed service unit.
     */
    void onServiceUnitChanged(in ServiceUnitDefinition definition);
}
